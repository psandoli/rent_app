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
        $query = "INSERT INTO login (id, nome, email, senha, tipo)
                VALUES(null, '$nome', '$email', '$senha', '$tipo')";
        $results = mysqli_query($connect, $query);
        $data = mysqli_fetch_array($results);

        if ($data[0] > 1){
            echo json_encode("true");
        } else {
            echo json_encode("false");
        }
    } else {
        echo json_encode("Conta já existe.");
    }
?>