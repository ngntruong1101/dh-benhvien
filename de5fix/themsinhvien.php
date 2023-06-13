<?php
require_once 'header.php';
require_once 'connect.php';
if (isset($_GET['id'])) {
    $lop_id = $_GET['id'];
    $sql = "SELECT sinhvien.*, lophanhchinh.tenlop FROM sinhvien INNER JOIN lophanhchinh ON lophanhchinh.id = sinhvien.lop_id WHERE lop_id = $lop_id";
    $stmt = $pdo->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
// if (isset($_GET['tenlop'])) {
//     $tenlop = $_GET['tenlop'];
//     $sql = "SELECT lophanhchinh.*, khoa.ten FROM lophanhchinh INNER JOIN khoa ON lophanhchinh.khoa_id = khoa.id WHERE
//     tenlop LIKE '%$tenlop%'";
//     $stmt = $pdo->query($sql);
//     $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
// } else {
//     $sql = "SELECT lophanhchinh.*, khoa.ten FROM lophanhchinh INNER JOIN khoa ON lophanhchinh.khoa_id = khoa.id";
//     $stmt = $pdo->query($sql);
//     $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
// }

?>
<div class="nav">
    <a href="index.php"
       class="btn btn-primary me-3">Trang Chủ</a>
       <a href="dslop.php"
       class="btn btn-primary me-3">Danh Sách Lớp Hành Chính</a>
</div>
<form action="them.php" method="post">
    <label class="form-label">ID</label>
    <input type="text" class="form-control"  name="id">
    <label class="form-label">Trạng thái</label>
    <input type="text" class="form-control"  name="trangthai">
    <input type="hidden" class="form-control"  name="lop_id" value="<?php echo $lop_id ?>" >
    <label class="form-label">Họ và tên</label>
    <input type="text" class="form-control"  name="hovaten">
    <label class="form-label">Ngày sinh</label>
    <input type="datetime-local" class="form-control"  name="ngaysinh">
    <label class="form-label">Mô tả</label>
    <input type="text" class="form-control"  name="mota">
    <input type="submit" value="Thêm" class="btn btn-primary mt-3">
</form>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Trạng thái</th>
            <th>Lớp</th>
            <th>Họ và tên</th>
            <th>Ngày sinh</th>
            <th>Mô tả</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($items as $item) { ?>
            <tr>
                <td><?php echo $item['ID'] ?></td>
                <td><?php echo $item['trangthai'] ?></td>
                <td><?php echo $item['tenlop'] ?></td>
                <td><?php echo $item['hovaten'] ?></td>
                <td><?php echo $item['ngaysinh'] ?></td>
                <td><?php echo $item['mota'] ?></td>
            </tr>
        <?php } ?>
    </tbody>
</table>
<?php require_once 'footer.php' ?>