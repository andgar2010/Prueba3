	<div class="col-6 offset-1">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Fecha</th>
					<th>descripcion</th>
					<th>respuesta</th>
					<th>estado</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($r as $d): ?>
					<tr>
						<td><?php echo $d->fecha_creado?></td>
						<td><?php echo $d->descripcion?></td>
						<td><?php echo $d->respuesta?></td>
						<td><?php echo $d->nombre?></td>
						<td><a href="index.php?c=tecnico&m=cambiar_estado&p=<?php echo $d->id_ticket ?>" class="btn btn-outline-info">Info</a></td>
						<div class="modal fade" id="m" role="dialog">
							<div class="modal-dialog">									
								<div class="modal-content">
									<div class="modal-header">
										<button class="close" data-dismiss="modal" arial-label="close">&times;</button>
									</div> 
									<div class="modal-body">
										
									</div>
				
									<div class="modal-footer">
										
									</div>
								</div>
							</div>
						</div>
					</tr>
				<?php endforeach ?>
			</tbody>
		</table>
	</div>
</div>