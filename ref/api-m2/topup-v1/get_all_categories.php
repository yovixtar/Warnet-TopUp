<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8");
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

include "dbms.php";

$sql_category = "SELECT * FROM categories";
$stmt_category = $db->prepare($sql_category);
$stmt_category->execute();
$result_category = $stmt_category->fetchAll(PDO::FETCH_ASSOC);

echo json_encode(
    [
        'meta' => [
            'code' => 200,
            'status' => $status,
            'message' => $pesan,
        ],
        'data' => $result_category,
    ]
);
