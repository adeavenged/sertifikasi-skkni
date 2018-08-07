<?php 
	include"../../config/database.php";


	$mod = @$_GET['mod'];
	$act = @$_GET['act'];


	if ($mod == 'peserta' AND $act == 'simpan') {

		mysql_query("INSERT INTO tb_peserta(id, 
											nik, 
											id_skema, 
											id_lokasi, 
											nama, 
											tgl_lahir, 
											hp, 
											email, 
											organisasi, 
											rekomendasi,
											tgl_terbit)
									VALUES(NULL, 
											'".$_POST['nik']."', 
											'".$_POST['skema']."', 
											'".$_POST['lokasi']."', 
											'".$_POST['nama']."', 
											'".$_POST['tgl_lahir']."', 
											'".$_POST['hp']."', 
											'".$_POST['email']."', 
											'".$_POST['organisasi']."', 
											'".$_POST['rekomendasi']."', 
											'".$_POST['tgl_terbit']."')") or die(mysql_error());
		echo"<script>
			alert('Berhasil melakukan input data peserta...');
			window.location=('../../index.php')
		</script>";
	}
?>