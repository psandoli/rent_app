<?php 
include "conexao.php";
// REGISTER IMOVEL

$nome = $_POST['nome'];

        $query = "SELECT * FROM `localizacao` WHERE nome = '$nome'";
        $results = mysqli_query($connect, $query);
        $count = mysqli_num_rows($results);

    if($count != 1){
        $query2 = "INSERT INTO `localizacao` (id, nome)
                VALUES(null, '$nome')";
        $results2 = mysqli_query($connect, $query2);

            echo json_encode("sucesso");

    } else {
        echo json_encode("LJE");
    }
?>