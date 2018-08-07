<?php 
	include"config/database.php";


	for($i=1;$i <= 10;$i++) {
		mysql_query("INSERT INTO tb_lokasi(id_lok, 
											tuk) 
									VALUES(NULL, 
											'LOKASI ".$i."')") or die(mysql_error());
	}
?>