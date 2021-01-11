<?php
include "conexao.php";

$img = $_FILES['img']['name'];
$nome = $_POST['nome'];
$tamanho = $_POST['tamanho'];
$quarto = $_POST['quarto'];
$banheiro = $_POST['banheiro'];
$vaga = $_POST['vaga'];
$aluguel = $_POST['aluguel'];
$condominio = $_POST['condominio'];
$bairro = $_POST['bairro'];

$imagePath = 'upload/'.$img;
$tmp_name = $_FILES['img']['tmp_name'];

move_uploaded_file($tmp_name, $imagePath);

$query = "INSERT INTO `imovel`(`nome`, `img`, `tamanho`, `quarto`, `banheiro`, `vaga`, `aluguel`, `condominio`, `bairro`) VALUES ('$nome', '$img', '$tamanho', '$quarto', '$banheiro', '$vaga', '$aluguel', '$condominio', '$bairro')";
$results = mysqli_query($connect, $query);

if ($results>0){
    echo json_encode("success");
} else {
    echo json_encode("error");
}
?>