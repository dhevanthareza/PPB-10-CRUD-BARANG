<?php
require_once('./config/connection.php');
$data = json_decode(file_get_contents('php://input'), true);
$code    = $data['code'];
$name    = $data['name'];
$purchasePrice    = $data['purchasePrice'];
$sellingPrice    = $data['sellingPrice'];
$qty    = $data['qty'];
$sql = $conn->prepare("INSERT INTO Barang (code, name, purchasePrice, sellingPrice, qty) VALUES (?, ?, ?, ?, ?)");
$sql->bind_param('ssddd', $code, $name, $purchasePrice, $sellingPrice, $qty);
$sql->execute();
if ($sql) {
    echo json_encode(array('RESPONSE' => 'SUCCESS'));
} else {
    echo json_encode(array('RESPONSE' => 'FAILED'));;
}
