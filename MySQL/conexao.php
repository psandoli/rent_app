<?php

$dns = 'mysql:host=localhost;dbname=locacao_imovel';
$user = 'root';
$password = '';
$host="localhost";
$db_name="locacao_imovel";

$connect=mysqli_connect($host,$user,$password,$db_name);

try{
 $db = new PDO ($dns, $user, $password);
}catch( PDOException $e){
 $error = $e->getMessage();
 echo $error;
}
?>