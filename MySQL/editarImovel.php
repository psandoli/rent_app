<?php
include "conexao.php";

	$id = $_POST['id'];
    $nome = $_POST['nome'];
	$tamanho = $_POST['tamanho'];
	$quarto = $_POST['quarto'];
	$banheiro = $_POST['banheiro'];
	$vaga = $_POST['vaga'];
	$aluguel = $_POST['aluguel'];
	$condominio = $_POST['condominio'];
	$bairro = $_POST['bairro'];

	$query = "UPDATE `imovel` SET nome = '$nome', tamanho = '$tamanho', quarto = '$quarto', 
	banheiro = '$banheiro', vaga = '$vaga', aluguel = '$aluguel', condominio = '$condominio', bairro = '$bairro' WHERE id = $id";

if ($connect->query($query) === TRUE) {
            echo json_encode("success");
        } else {
            echo json_encode("error");
        }
?>