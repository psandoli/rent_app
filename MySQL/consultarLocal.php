<?php 
include "conexao.php";
  
     
        $query = $connect->query("SELECT * FROM `localizacao`");
        $result = array();

	while ($rowData = $query->fetch_assoc()) {
		$result[] = $rowData;
	}

	echo json_encode($result);
?>