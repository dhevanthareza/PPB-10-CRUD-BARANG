<?php
require_once('./config/connection.php');
$data = json_decode(file_get_contents("php://input"));

if ($data->code != null) {
    $code             = $data->code;
    $name    = $data->name;
    $purchasePrice          = $data->purchasePrice;
    $sellingPrice    = $data->sellingPrice;
    $qty           = $data->qty;

    $sql = $conn->prepare("UPDATE Barang SET name=?, purchasePrice=?, sellingPrice=?, qty=? WHERE code=?");
    $sql->bind_param('sddds', $name, $purchasePrice, $sellingPrice, $qty, $code);
    $sql->execute();
    if ($sql) {
        echo json_encode(array('RESPONSE' => 'SUCCESS'));
    } else {
        echo json_encode(array('RESPONSE' => 'FAILED'));
    }
} else {
    echo "GAGAL";
}
