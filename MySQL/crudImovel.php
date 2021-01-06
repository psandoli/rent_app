<?php
include "conexao.php";

$action = $_POST['action'];

    if ($connect->connect_error) {
        die("Connection failed: " . $connect->connect_error);
    }


    if('EXIBIR' == $action){
        $dbdata = array();
        $sql = "SELECT id, nome, img, tamanho, quarto, banheiro, vaga, aluguel, condominio, bairro FROM imovel ORDER BY id ASC";
        $result = $connect->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $dbdata[]=$row;
            }
            echo json_encode($dbdata);
        } else {
            echo "error";
        }
        $connect->close();
        return;
    }

    if('NOVO' == $action){
        $nome = $_POST['nome'];
        $img = $_POST['img'];
        $tamanho = $_POST['tamanho'];
        $quarto = $_POST['quarto'];
        $banheiro = $_POST['banheiro'];
        $vaga = $_POST['vaga'];
        $aluguel = $_POST['aluguel'];
        $condominio = $_POST['condominio'];
        $bairro = $_POST['bairro'];

        $sql = "INSERT INTO `imovel` (`nome`, `img`, `tamanho`, `quarto`, `banheiro`, `vaga`, `aluguel`, 
            `condominio`, `bairro`) VALUES (NULL, '$nome', '$img', '$tamanho', '$quarto', '$banheiro', '$vaga', '$aluguel', '$condominio', '$bairro');";
        $result = $connect->query($sql);
        echo 'success';
        return;
    }

    if('ATUALIZAR' == $action){
        $imv_id = $_POST['imv_id'];
        $nome = $_POST['nome'];
        $img = $_POST['img'];
        $tamanho = $_POST['tamanho'];
        $quarto = $_POST['quarto'];
        $banheiro = $_POST['banheiro'];
        $vaga = $_POST['vaga'];
        $aluguel = $_POST['aluguel'];
        $condominio = $_POST['condominio'];
        $bairro = $_POST['bairro'];

        $sql = "UPDATE `imovel` SET nome = '$nome', img = '$img', tamanho = '$tamanho', quarto = '$quarto',
            banheiro = '$banheiro', vaga = '$vaga', aluguel = '$aluguel', condominio = '$condominio', bairro = '$bairro' WHERE id = $imv_id";
        if ($connect->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $connect->close();
        return;
    }

    if('EXCLUIR' == $action){
        $imv_id = $_POST['imv_id'];
        $sql = "DELETE FROM `imovel` WHERE id = $imv_id";
        if ($connect->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $connect->close();
        return;
    }
?>