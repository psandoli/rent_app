<?php
include "conexao.php";

	$id = $_POST['id'];

	$query = "DELETE FROM `localizacao` WHERE id = $id";

if ($connect->query($query) === TRUE) {
            echo json_encode("success");
        } else {
            echo json_encode("error");
        }
?>