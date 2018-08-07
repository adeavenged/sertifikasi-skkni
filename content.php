<?php 
	include"config/database.php";

	$mod = @$_GET['mod'];
	$act = @$_GET['act'];

	if ($mod == 'peserta') {
		include"modules/peserta/peserta.php";
	}
?>