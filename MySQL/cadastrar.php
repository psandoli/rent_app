<?php 
include "conexao.php";
// REGISTER USER

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha =$_POST['senha'];
$tipo = $_POST['tipo'];  
 
        $query = "SELECT * FROM login WHERE email = '$email'";
        $results = mysqli_query($connect, $query);
        $count = mysqli_num_rows($results);

    if($count != 1){
        $query2 = "INSERT INTO login (id, nome, email, senha, tipo)
                VALUES(null, '$nome', '$email', '$senha', $tipo)";
        $results2 = mysqli_query($connect, $query2);

            echo json_encode("sucesso");

    } else {
        echo json_encode("CJE");
    }
?>