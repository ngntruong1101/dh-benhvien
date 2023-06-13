<?php
require_once 'connect.php';

var_dump($_POST);
$nhanvien_id = $_POST['nhanvien_id'];
$loaibenh_id = $_POST['loaibenh_id'];
$benhnhan = $_POST['benhnhan'];
$ngaybatdau = $_POST['ngaybatdau'];
$ngayketthuc = $_POST['ngayketthuc'];
$nhanxet = $_POST['nhanxet'];

$sql = "INSERT INTO dieutri (nhanvien_ID, loaibenh_ID, benhnhan, ngaybatdau, ngayketthuc, nhanxet) VALUES
('$nhanvien_id','$loaibenh_id','$benhnhan', '$ngaybatdau','$ngayketthuc','$nhanxet')";
$stmt = $pdo->prepare($sql);
$rows = $stmt->execute();
if ($rows) {
    header("Location:" . 'themdieutri.php?id=' . $nhanvien_id);
}
?>