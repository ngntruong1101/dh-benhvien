<?php
require_once 'header.php';
require_once 'connect.php';
if (isset($_GET['hovaten'])) {
    $hovaten = $_GET['hovaten'];
    $sql = "SELECT nhanvien.*, khoa.ten FROM nhanvien INNER JOIN khoa ON nhanvien.khoa_id = khoa.id WHERE
    hovaten LIKE '%$hovaten%'";
    $stmt = $pdo->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $sql = "SELECT nhanvien.*, khoa.ten FROM nhanvien INNER JOIN khoa ON nhanvien.khoa_id = khoa.id";
$stmt = $pdo->query($sql);
$items = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

?>
<div class="nav">
    <a href="index.php"
       class="btn btn-primary me-3">Trang Chủ</a>
</div>
<form>
    <label class="form-label">Tìm kiếm lớp hành chính</label>
    <input type="text" class="form-control"  name="hovaten" placeholder="Nhập tên nhân viên">
    <input type="submit" value="Tìm kiếm" class="btn btn-primary mt-3">
</form>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Khoa</th>
            <th>Họ và tên</th>
            <th>Điện thoại</th>
            <th>Năm ký hợp đồng</th>
            <th>Quản lý điều trị</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($items as $item) { ?>
            <tr>
                <td><?php echo $item['ID'] ?></td>
                <td><?php echo $item['ten'] ?></td>
                <td><?php echo $item['hovaten'] ?></td>
                <td><?php echo $item['dienthoai'] ?></td>
                <td><?php echo $item['namkyhopdong'] ?></td>
                <td>
                    <a href="themdieutri.php?id=<?php echo $item['ID'] ?>" class="btn btn-primary">Thêm</a>
                </td>
            </tr>
        <?php } ?>
    </tbody>
</table>
<?php require_once 'footer.php' ?>
