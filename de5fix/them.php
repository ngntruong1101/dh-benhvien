<?php
require_once 'connect.php';

$id = $_POST['id'];
$trangthai = $_POST['trangthai'];
$lop_id = $_POST['lop_id'];
$hovaten = $_POST['hovaten'];
$ngaysinh = $_POST['ngaysinh'];
$mota = $_POST['mota'];

$sql = "INSERT INTO sinhvien(ID, trangthai, lop_id, hovaten, ngaysinh, mota) VALUES
('$id','$trangthai','$lop_id','$hovaten','$ngaysinh','$mota')";
$stmt = $pdo->prepare($sql);
$rows = $stmt->execute();
if ($rows) {
    header("Location:" . 'themsinhvien.php?id=' . $lop_id);
}
?>