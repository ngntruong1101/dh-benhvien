<?php
require_once 'header.php';
require_once 'connect.php';
if (isset($_GET['id'])) {
    $nhanvien_id = $_GET['id'];
    $sql = "SELECT dieutri.*, nhanvien.hovaten as htnv, loaibenh.tenbenh, benhnhan.hovaten FROM dieutri INNER JOIN nhanvien ON nhanvien.id = dieutri.nhanvien_id INNER JOIN loaibenh ON dieutri.loaibenh_id = dieutri.loaibenh_id INNER JOIN benhnhan ON benhnhan.id = dieutri.benhnhan WHERE nhanvien_id = $nhanvien_id";
    $stmt = $pdo->query($sql);
    $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

?>
<div class="nav">
    <a href="index.php"
       class="btn btn-primary me-3">Trang Chủ</a>
    <a href="dsnhanvien.php"
       class="btn btn-primary me-3">Danh Sách Nhân Viên</a>
</div>
<form action="them.php"
      method="post">
      <input type="hidden" name="nhanvien_id" value="<?php echo $nhanvien_id ?>">
    <label class="form-label">Loại bệnh</label>
    <select name="loaibenh_id" class="form-control">
        <?php
        $sqlBenh = "SELECT * FROM loaibenh";
        $stmt = $pdo->query($sqlBenh);
        $benhs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($benhs as $benh) {
        ?>
        <option value="<?php echo $benh['ID'] ?>"><?php echo $benh['tenbenh'] ?></option>
        <?php } ?>
    </select>
    <label class="form-label">Bệnh nhân</label>
    <select name="benhnhan" class="form-control">
        <?php
        $sqlBN = "SELECT * FROM benhnhan";
        $stmt = $pdo->query($sqlBN);
        $bns = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach ($bns as $bn) {
            ?>
        <option value="<?php echo $bn['ID'] ?>"><?php echo $bn['hovaten'] ?></option>
        <?php } ?>
    </select>
    <label class="form-label">Ngày bắt đầu</label>
    <input type="datetime-local"
           class="form-control"
           name="ngaybatdau">
           <label class="form-label">Ngày kết thúc</label>
    <input type="datetime-local"
           class="form-control"
           name="ngayketthuc">
    <label class="form-label">Nhận xét</label>
    <input type="text"
           class="form-control"
           name="nhanxet">
    <input type="submit"
           value="Thêm"
           class="btn btn-primary mt-3">
</form>
<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nhân viên</th>
            <th>Tên bệnh</th>
            <th>Bệnh nhân</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Nhận xét</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($items as $item) { ?>
            <tr>
                <td><?php echo $item['ID'] ?></td>
                <td>
                    <?php echo $item['htnv'] ?>
                </td>
                <td>
                    <?php echo $item['tenbenh'] ?>
                </td>
                <td><?php echo $item['hovaten'] ?></td>
                <td>
                    <?php echo $item['ngaybatdau'] ?>
                </td>
                <td><?php echo $item['ngayketthuc'] ?></td>
                <td>
                    <?php echo $item['nhanxet'] ?>
                </td>
            </tr>
        <?php } ?>
    </tbody>
</table>
<?php require_once 'footer.php' ?>