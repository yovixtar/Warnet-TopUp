<?php
header("Access-Control_Allow_Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Content-type:application/json;charset=utf-8");
header("Access-Control-Allow-Methods: GET");
//header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
header('access-control-allow-origin: *');
header('Access-Control-Allow-Headers: *');

include "dbms.php";

$sql_price = "SELECT price FROM nominal WHERE game_id = " . $_GET['game_id']." AND name = '" . $_GET['nominal_name']."'";
$stmt_price = $db->prepare($sql_price);
$stmt_price->execute();
$result_price = $stmt_price->fetchAll(PDO::FETCH_ASSOC);
$result_price[0]['price'] = intval($result_price[0]['price']);

echo json_encode(
    [
        'meta' => [
            'code' => 200,
            'status' => 'success',
            'message' => 'Berhasil mendapatkan price topup game',
        ],
        'data' => $result_price[0],
    ]
);
