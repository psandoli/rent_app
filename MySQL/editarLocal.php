<?php
include "conexao.php";

	$id = $_POST['id'];
        $nome = $_POST['nome'];

	$query = "UPDATE `localizacao` SET nome = '$nome' WHERE id = $id";

if ($connect->query($query) === TRUE) {
            echo json_encode("success");
        } else {
            echo json_encode("error");
        }
?>