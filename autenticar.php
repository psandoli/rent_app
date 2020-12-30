<?php 
include "conexao.php";
// autenticar usuário

    $email = $_POST['email'];
    $senha = $_POST['senha'];
 
    $query = "SELECT * FROM login WHERE email = '$email' AND senha = '$senha'";
    $results = mysqli_query($connect, $query);
    $count = mysqli_num_rows($results);

    if ($count != 1){
        echo json_encode("Erro!");
    } else {
        echo json_encode("Sucesso!");
    }
?>