<?php 
	
	$act = "modules/peserta/act_peserta.php";

	switch ($act) {
		case 'value':
			# code...
			break;
		
		default:
			echo"<table class='table'>
				<tr>
					<th>#</th>
					<th>NIK</th>
					<th>NAMA</th>
					<th>TGL. LAHIR</th>
					<th>NO. HP</th>
					<th>EMAIL</th>
					<th>ORGANISASI</th>
					<th>REKOMENDASI</th>
				</tr>";

				$query = "SELECT * FROM tb_peserta";
				$result = mysql_query($query) or die(mysql_error());
				$temukan = mysql_num_rows($result);

				if ($temukan > 0) {
					$no = 1;
					while ($data = mysql_fetch_assoc($result)) {
						echo"<tr>
							<td>".$no."</td>
							<td>".$data['nik']."</td>
						</tr>";

						$no++;
					}
				}
			echo"</table>";


			break;
	}
?>