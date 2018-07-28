<div class="row justify-content-center" style="margin-top: 8%;">
	<div class="col-4 ">
		<div class="card">
			<div class="card-header">
				<h3 class="card-tittle">Reporte equipo</h3>
			</div>
			<div class="card-body">
				<form method="post" action="index.php?c=instructor&m=send_reporte">
					<label>Serial equipos</label>
					<select name="serial" class="form-control">
						<option></option>
						<?php 
							foreach ($r as $d) { ?>
						<option value="<?php echo $d->id_equipo?>"><?php echo  $d->serial_equipo?></option>
						<?php } ?>
					</select>
					<label>Descripción</label>
					<textarea name="desc" class="form-control"></textarea>	
					<button class="mt-1 btn btn-outline-success">Enviar</button>
				</form>
			</div>
		</div>
	</div>