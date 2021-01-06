<?php
include "conexao.php";

$nome = $_POST['nome'];
$tamanho = $_POST['tamanho'];
$quarto = $_POST['quarto'];
$banheiro = $_POST['banheiro'];
$vaga = $_POST['vaga'];
$aluguel = $_POST['aluguel'];
$condominio = $_POST['condominio'];
$bairro = $_POST['bairro'];

$query = "INSERT INTO `imovel`(`nome`, `tamanho`, `quarto`, `banheiro`, `vaga`, `aluguel`, `condominio`, `bairro`) VALUES ('$nome', '$tamanho', '$quarto', '$banheiro', '$vaga', '$aluguel', '$condominio', '$bairro')";
$results = mysqli_query($connect, $query);

if ($results>0){
    echo json_encode("success");
}
?>