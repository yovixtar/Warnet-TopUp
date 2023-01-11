<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8");
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

include "dbms.php";

$sql_category = "SELECT * FROM categories WHERE id = " . $_GET['id'] . " LIMIT 1";
$stmt_category = $db->prepare($sql_category);
$stmt_category->execute();
$result_category = $stmt_category->fetchAll(PDO::FETCH_ASSOC);

$result_category[0]['id'] = (int) $result_category[0]['id'];

echo json_encode(
    [
        'meta' => [
            'code' => 200,
            'status' => 'success',
            'message' => 'Get Category By ID',
        ],
        'data' => $result_category[0],
    ]
);