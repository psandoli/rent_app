<?php 
include "conexao.php";
// REGISTER USER

  
    $name = mysqli_real_escape_string($connect, $_POST['nome']);
    $email = mysqli_real_escape_string($connect, $_POST['email']);
    $pass = mysqli_real_escape_string($connect, $_POST['senha']);
    $type = mysqli_real_escape_string($connect, $_POST['tipo']);  
 
        $query = "INSERT INTO login (nome, email, senha, tipo)
  			  VALUES('$name', '$email', '$pass', '$type')";
    $results = mysqli_query($connect, $query);
    if($results>0)
    {
        echo "Login ok";
    }
    
?>