<?php
require_once('./config/connection.php');
$data = json_decode(file_get_contents("php://input"));
 
if ($data->code!=null){
    $code=$data->code;
        $sql = $conn->prepare("DELETE FROM Barang WHERE code=?");
        $sql->bind_param('s', $code);
        $sql->execute();
        if ($sql){
            echo json_encode(array('RESPONSE' =>'SUCCESS'));
        }else {
            echo json_encode(array('RESPONSE' => 'FAILED'));
        }
}else{
    echo "gagal";
}