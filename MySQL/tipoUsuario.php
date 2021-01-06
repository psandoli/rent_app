<?php

include "conexao.php";

$email = $_POST['email'];

$query = "SELECT tipo FROM `login` WHERE email = '$email'";

    $result = mysqli_query($connect, $query);

$number_of_row = mysqli_num_rows($result);

if($number_of_row > 0){
while($row = mysqli_fetch_assoc($result)){
    $temp = $row;
}
}

echo json_encode($temp);
?>	