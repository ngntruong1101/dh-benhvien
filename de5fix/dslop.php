<?php
require_once 'header.php';
require_once 'connect.php';
if (isset($_GET['tenlop'])) {
    $tenlop = $_GET['tenlop'];
    $sql = "SELECT lophanhchinh.*, khoa.ten FROM lophanhchinh INNER JOIN khoa ON lophanhchinh.khoa_id = khoa.id WHERE
    tenlop LIKE '%$tenlop%'";
    $stmt = $pdo->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $sql = "SELECT lophanhchinh.*, khoa.ten FROM lophanhchinh INNER JOIN khoa ON lophanhchinh.khoa_id = khoa.id";
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
    <input type="text" class="form-control"  name="tenlop" placeholder="Nhập tên lớp">
    <input type="submit" value="Tìm kiếm" class="btn btn-primary mt-3">
</form>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Tên lớp</th>
            <th>Năm thành lập</th>
            <th>Khoa</th>
            <th>Sĩ số</th>
            <th>Thêm sinh viên</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($items as $item) { ?>
            <tr>
                <td><?php echo $item['ID'] ?></td>
                <td><?php echo $item['tenlop'] ?></td>
                <td><?php echo $item['namthanhlap'] ?></td>
                <td><?php echo $item['ten'] ?></td>
                <td><?php echo $item['siso'] ?></td>
                <td>
                    <a href="themsinhvien.php?id=<?php echo $item['ID'] ?>" class="btn btn-primary">Thêm</a>
                </td>
            </tr>
        <?php } ?>
    </tbody>
</table>
<?php require_once 'footer.php' ?>