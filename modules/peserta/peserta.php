<?php

	$action = "modules/peserta/act_peserta.php";
	$act = @$_GET['act'];

	switch ($act) {
		case 'form':
			echo"<form action='".$action."' class='form' method='post'>
				<table width='100%'>
					<tr>
						<td width='120px'>NIK</td>
						<td width='10px'>:</td>
						<td><input type='text' name='nik' placeholder='nik...'></td>
					</tr>
					<tr>
						<td>NAMA</td>
						<td>:</td>
						<td><input type='text' name='nama' placeholder='nama...'></td>
					</tr>
					<tr>
						<td>TGL. LAHIR</td>
						<td>:</td>
						<td><input type='text' name='tgl_lahir' id='datepicker' placeholder='99/99/1999'></td>
					</tr>
					<tr>
						<td>Email</td>
						<td>:</td>
						<td><input type='text' name='email' placeholder=''></td>
					</tr>
					<tr>
						<td>HP</td>
						<td>:</td>
						<td><input type='text' name='hp' placeholder=''></td>
					</tr>
					<tr>
						<td>Organisasi</td>
						<td>:</td>
						<td><input type='text' name='org' placeholder=''></td>
					</tr>
					<tr>
					<td>Lokasi</td>
					<td>:</td>
					<td><select name='lokasi'>
					";
					$query=mysql_query("Select * from tb_lokasi");
					while(	$a=mysql_fetch_assoc($query)) {

						echo "<option value=$a[id_lok]>$a[tuk]</<option>";
						}

						echo"
					</select>
					</td>
					</tr>
					<tr>
					<td>Skema Sertifikasi</td>
					<td>:</td>
					<td><select name='skema'>
					";
					$query2=mysql_query("Select * from tb_skema");
						while($b=mysql_fetch_assoc($query2)) {

						echo "<option value=$b[id_skema]>$b[nama_skema]</<option>";
						}

						echo"
					</select>
					</td>
					</tr>
					<tr><td colspan=2><input type=submit value=Simpan>
													<input type=button value=Batal onclick=self.history.back()></td></tr>

				</table>
			</form>";


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
							<td>".$data['nama']."</td>
							<td>".$data['tgl_lahir']."</td>
							<td>".$data['hp']."</td>
							<td>".$data['email']."</td>
							<td>".$data['organisasi']."</td>
							<td>".$data['rekomendasi']."</td>
						</tr>";

						$no++;
					}
				}
			echo"</table>";


			break;
	}
?>
