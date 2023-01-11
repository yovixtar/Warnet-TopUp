<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8"); 
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');
include "dbsql.php";

$username = $_POST['username'];
$password = $_POST['password'];
$bagian = $_POST['bagian'];
$sql = "UPDATE user SET password = SHA1(?) , bagian = ? WHERE username = ?";
$stmt = $db->prepare($sql);
$result = $stmt->execute([$password, $bagian, $username]);
echo json_encode(['hasil' => $result]);