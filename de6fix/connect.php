<?php
$conn = "mysql:host=localhost;dbname=benhvien";
$user = 'root';
$pass = '';
$pdo = new PDO($conn, $user, $pass);
if (!$pdo) {
    echo 'Ket noi that bai';
}
?>