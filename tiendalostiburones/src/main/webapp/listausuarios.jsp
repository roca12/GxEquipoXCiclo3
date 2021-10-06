<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description"
	content="Proyecto de entrenamiento en desarrollo web" />
<meta name="author" content="Ing. Diego Rodriguez" />
<title>Lista de usuarios</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script>
	
	window.addEventListener('DOMContentLoaded', event => {
	    // Simple-DataTables
	    // https://github.com/fiduswriter/Simple-DataTables/wiki
		let table=null;
	    if (datatablesuers) {
	        table=new simpleDatatables.DataTable("#datatablesuers", {
	            searchable: true,
	            labels: {
	                placeholder: "Buscar...",
	                perPage: "{select} registros por pagina",
	                noRows: "No hay registros",
	                info: "Mostrando {start} a {end} de {rows} registros",
	            }
	        });
	    }
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "http://localhost:8080/listarusuarios", true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {

					var usuarios = JSON.parse(xmlhttp.responseText);
					
					for (i = 0; i < usuarios.length; i++) {
						let fila = [
							usuarios[i].cedula_usuario.toString(), 
							usuarios[i].email_usuario, 
							usuarios[i].nombre_usuario, 
							usuarios[i].password, 
							usuarios[i].usuario
						];

					    table.rows().add(fila);
					}
				}
			};
			
			xmlhttp.send();
	});
</script>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

</head>
<body class="sb-nav-fixed sb-sidenav-toggled">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html"><i
			class="fas fa-fish"></i> Tienda Los Tiburones </a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars fa-2x"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

		</form>
	</nav>

	<div w3-include-html="/snippets/sidenav.html"></div>

	<div id="layoutSidenav_content">
		<main>
			<div
				class="container-fluid px-4 animate__animated animate__bounceInLeft">
				<h1 class="mt-4">Lista de usuarios</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Muestra una tabla
						conteniendo todos los usuarios registrados en el sistema</li>
				</ol>
				<div class="row">
					<div class="col-xl-12 col-md-12">
						<div class="card  text-black mb-4">

							<div class="container">

								<h1>
									<i class="fas fa-cogs"></i> Operaciones
								</h1>
								<div class="row">
									<div class="col-sm-2 col-md-2 me-2">

										<button type="button" class="btn btn-success"
											onclick="window.location.href='/insertarusuario.jsp'">
											<i class="fas fa-plus-circle"></i> Agregar usuario
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-danger"
											onclick="window.location.href='/eliminarusuario.jsp'">
											<i class="fas fa-trash"></i> Eliminar usuario
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-4">
										<button type="button" class="btn btn-warning"
											onclick="window.location.href='/actualizarusuario.jsp'">
											<i class="fas fa-pen-alt"></i> Actualizar usuario
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-primary"
											onclick="window.location.href='/buscarusuario.jsp'">
											<i class="fas fa-search"></i> Buscar usuario
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-primary"
											onclick="window.location.href='/listausuarios.jsp'">
											<i class="fas fa-search"></i> Listado completo
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xl-12">
						<div class="card mb-4">
							<div class="card-header text-white bg-dark">
								<i class="fas fa-table"></i> Tabla de usuarios
							</div>
							<div class="card-body">
								<table id="datatablesuers">
									<thead>
										<tr>
											<th>Cedula</th>
											<th>Email</th>
											<th>Nombre</th>
											<th>Password</th>
											<th>Usuario</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Cedula</th>
											<th>Email</th>
											<th>Nombre</th>
											<th>Password</th>
											<th>Usuario</th>
										</tr>
									</tfoot>
									<tbody id="usuariosinfo">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</main>

		<div w3-include-html="/snippets/footer.html"></div>

	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

	<script>
		includeHTML();
	</script>

	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
</body>
</html>
