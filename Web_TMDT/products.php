<?php
include 'config.php';
include 'includes/header.php';

// Tính số lượng trong giỏ (dùng cho JS)
$cart_count = 0;
if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $item) {
        $cart_count += $item['quantity'] ?? 0;
    }
}

// Lấy id danh mục từ URL (nếu có) - hỗ trợ cả id và danhmuc
$category_id = 0;
if (isset($_GET['id'])) {
    $category_id = intval($_GET['id']);
} elseif (isset($_GET['danhmuc'])) {
    $category_id = intval($_GET['danhmuc']);
}

// Tìm kiếm từ khóa (nếu có)
$search_query = isset($_GET['q']) ? trim($_GET['q']) : '';

// Sắp xếp
$sort = isset($_GET['sort']) ? $_GET['sort'] : 'newest';

// Biến cho tiêu đề
$section_title = "TẤT CẢ SẢN PHẨM";
$where_clauses = [];

if ($category_id > 0) {
    $check_cat = $conn->query("SELECT ten_danh_muc FROM danh_muc WHERE id = $category_id");
    if ($check_cat && $check_cat->num_rows > 0) {
        $cat_name = $check_cat->fetch_assoc()['ten_danh_muc'];
        $section_title = "SẢN PHẨM: " . htmlspecialchars($cat_name);

        $child_ids = [$category_id];
        $sql_child = "SELECT id FROM danh_muc WHERE id_cha = $category_id";
        $result_child = $conn->query($sql_child);
        while ($child = $result_child->fetch_assoc()) {
            $child_ids[] = $child['id'];
        }
        $ids_list = implode(',', $child_ids);
        $where_clauses[] = "id_danh_muc IN ($ids_list)";
    }
}

if (!empty($search_query)) {
    $safe_search = $conn->real_escape_string($search_query);
    $where_clauses[] = "(ten_san_pham LIKE '%$safe_search%' OR mo_ta LIKE '%$safe_search%')";
    if ($category_id == 0) {
        $section_title = "KẾT QUẢ TÌM KIẾM: \"" . htmlspecialchars($search_query) . "\"";
    }
}

$where_sql = !empty($where_clauses) ? "WHERE " . implode(' AND ', $where_clauses) : "";

// Xử lý order by
switch ($sort) {
    case 'price_asc':
        $order_sql = "ORDER BY gia ASC";
        break;
    case 'price_desc':
        $order_sql = "ORDER BY gia DESC";
        break;
    case 'name_asc':
        $order_sql = "ORDER BY ten_san_pham ASC";
        break;
    default:
        $order_sql = "ORDER BY id_san_pham DESC";
        break;
}

$products_query = "SELECT * FROM san_pham $where_sql $order_sql";
$result = $conn->query($products_query);
$total_products = $result ? $result->num_rows : 0;
?>

<div class="container-limit my-4">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.php">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page"><?php echo $section_title; ?></li>
        </ol>
    </nav>

    <!-- DANH MỤC SẢN PHẨM & SẢN PHẨM -->
    <div class="row align-items-start category-product-section mb-4">
        <!-- Cột DANH MỤC (BÊN TRÁI) -->
        <div class="col-md-3 category-column">
            <h5 class="category-title">DANH MỤC SẢN PHẨM</h5>
            <div class="category-wrapper">
                <ul class="category-list">
                    <li class="parent-item <?php echo ($category_id == 0 && empty($search_query)) ? 'active' : ''; ?>">
                        <a href="products.php" class="fw-bold">Tất cả sản phẩm</a>
                    </li>
                    <?php
                    $sql_parent = "SELECT * FROM danh_muc WHERE id_cha IS NULL ORDER BY id ASC";
                    $result_parent = $conn->query($sql_parent);

                    if ($result_parent && $result_parent->num_rows > 0) {
                        while ($parent = $result_parent->fetch_assoc()) {
                            $active_parent = ($category_id == $parent['id']) ? ' active' : '';
                            echo '<li class="parent-item' . $active_parent . '">';
                            echo '<a href="products.php?id=' . $parent['id'] . '">' . htmlspecialchars($parent['ten_danh_muc']) . '</a>';

                            $sql_child = "SELECT * FROM danh_muc WHERE id_cha = " . intval($parent['id']) . " ORDER BY id ASC";
                            $result_child = $conn->query($sql_child);

                            if ($result_child && $result_child->num_rows > 0) {
                                echo '<ul class="subcategory-list">';
                                while ($child = $result_child->fetch_assoc()) {
                                    $active_child = ($category_id == $child['id']) ? ' class="active"' : '';
                                    echo '<li' . $active_child . '><a href="products.php?id=' . $child['id'] . '">' . htmlspecialchars($child['ten_danh_muc']) . '</a></li>';
                                }
                                echo '</ul>';
                            }
                            echo '</li>';
                        }
                    } else {
                        echo '<li>Không có danh mục nào.</li>';
                    }
                    ?>
                </ul>
            </div>

            <?php if ($category_id > 0 || !empty($search_query)): ?>
                <div class="mt-3">
                    <a href="products.php" class="btn btn-outline-secondary btn-sm w-100">
                        ← Xem tất cả sản phẩm
                    </a>
                </div>
            <?php endif; ?>
        </div>

        <!-- Cột SẢN PHẨM (BÊN PHẢI) -->
        <div class="col-md-9 product-column">
            <div class="d-flex justify-content-between align-items-center mb-3 pb-2 border-bottom flex-wrap gap-2">
                <h5 class="section-title mb-0"><?php echo $section_title; ?></h5>
                
                <div class="d-flex align-items-center gap-2">
                    <span class="text-muted small">Hiển thị <?php echo $total_products; ?> sản phẩm</span>
                    <select class="form-select form-select-sm" style="width: auto;" onchange="location = this.value;">
                        <?php
                        $base_url = "products.php?" . ($category_id ? "id=$category_id&" : "") . (!empty($search_query) ? "q=" . urlencode($search_query) . "&" : "");
                        ?>
                        <option value="<?php echo $base_url; ?>sort=newest" <?php echo $sort == 'newest' ? 'selected' : ''; ?>>Mới nhất</option>
                        <option value="<?php echo $base_url; ?>sort=price_asc" <?php echo $sort == 'price_asc' ? 'selected' : ''; ?>>Giá: Thấp đến Cao</option>
                        <option value="<?php echo $base_url; ?>sort=price_desc" <?php echo $sort == 'price_desc' ? 'selected' : ''; ?>>Giá: Cao đến Thấp</option>
                        <option value="<?php echo $base_url; ?>sort=name_asc" <?php echo $sort == 'name_asc' ? 'selected' : ''; ?>>Tên: A-Z</option>
                    </select>
                </div>
            </div>

            <div class="row product-grid">
                <?php
                if ($result && $result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        // Xử lý chuẩn hóa đường dẫn ảnh
                        $hinh_anh = str_replace('\\', '/', $row['link_anh']);
                        
                        echo '
                        <div class="col-md-4 col-6 mb-4">
                            <div class="card border-0 shadow-sm h-100 product-card">
                                <a href="product.php?id=' . $row['id_san_pham'] . '" class="text-decoration-none">
                                    <img src="assets/images/' . htmlspecialchars($hinh_anh) . '"
                                        class="card-img-top"
                                        alt="' . htmlspecialchars($row['ten_san_pham']) . '"
                                        style="height: 220px; object-fit: cover;"
                                        onerror="this.src=\'assets/images/no-image.jpg\'">
                                </a>
                                <div class="card-body d-flex flex-column">
                                    <h6 class="card-title text-dark">
                                        <a href="product.php?id=' . $row['id_san_pham'] . '" class="text-dark text-decoration-none">' . htmlspecialchars($row['ten_san_pham']) . '</a>
                                    </h6>
                                    <p class="card-text mb-2 text-danger"><strong>' . number_format($row['gia']) . ' VNĐ</strong></p>
                                    <div class="mt-auto d-flex gap-2">
                                        <a href="product.php?id=' . $row['id_san_pham'] . '" class="btn btn-outline-secondary btn-sm flex-fill">TÙY CHỌN</a>
                                        <button type="button"
                                                onclick="addToCart(' . $row['id_san_pham'] . ')"
                                                class="btn btn-primary btn-sm flex-fill">
                                            Thêm Giỏ Hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>';
                    }
                } else {
                    echo '
                    <div class="text-center w-100 py-5">
                        <i class="bi bi-box-seam text-muted" style="font-size: 3rem;"></i>
                        <p class="text-muted mt-3 fs-5">Không tìm thấy sản phẩm nào trong danh mục này.</p>
                        <a href="products.php" class="btn btn-primary">Xem tất cả sản phẩm</a>
                    </div>';
                }
                ?>
            </div>
        </div>
    </div>
</div>

<script>
// Đóng popup mượt mà
function closeCartPopup() {
    const popup = document.getElementById('addToCartSuccess');
    const backdrop = document.getElementById('cartPopupBackdrop');
    if (popup) {
        popup.style.opacity = '0';
        popup.style.transform = 'translateY(-30px)';
        setTimeout(() => {
            popup.remove();
            if (backdrop) backdrop.remove();
        }, 300);
    }
}

// Thêm vào giỏ hàng – KHÔNG RELOAD
function addToCart(id) {
    fetch(`cart.php?action=add&id=${id}&qty=1`, { credentials: 'same-origin' })
        .then(r => r.text())
        .then(html => {
            const div = document.createElement('div');
            div.innerHTML = html;
            const popup = div.querySelector('#addToCartSuccess');
            const backdrop = div.querySelector('#cartPopupBackdrop');
            if (popup) document.body.appendChild(popup);
            if (backdrop) document.body.appendChild(backdrop);

            const badge = document.querySelector('.cart-badge');
            if (badge) {
                badge.textContent = parseInt(badge.textContent || 0) + 1;
            } else {
                const cartBox = document.querySelector('.cart-box') || document.querySelector('a[href="cart.php"]');
                if (cartBox) cartBox.insertAdjacentHTML('beforeend', `<span class="cart-badge">1</span>`);
            }

            setTimeout(closeCartPopup, 10000);
        });
}
</script>

<?php include 'includes/footer.php'; ?>
