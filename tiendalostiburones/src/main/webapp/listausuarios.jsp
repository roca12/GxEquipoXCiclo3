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

</head>
<body class="sb-nav-fixed">
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
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Modulos</div>
						
						<!-- menu usuarios -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-users"></i>
							</div> Usuarios
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Operaciones
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="listausuarios.jsp"><i class="fas fa-list-ol m-1"></i>Listar</a> 
										<a class="nav-link" href="insertarusuario.jsp"><i class="far fa-plus-square m-1"></i>Registrar</a> 
										<a class="nav-link" href="eliminarusuario.jsp"><i class="fas fa-trash-alt m-1"></i>Eliminar</a>
										<a class="nav-link" href="actualizarusuario.jsp"><i class="fas fa-sync-alt m-1"></i>Actualizar</a>
										<a class="nav-link" href="buscarusuario.jsp"><i class="fas fa-search m-1"></i>Buscar</a>
									</nav>
								</div>
							</nav>	
						</div>
						<!-- --------------------------------- -->
						<!-- menu clientes -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages2" aria-expanded="false"
							aria-controls="collapsePages2">
							<div class="sb-nav-link-icon">
								<i class="fas fa-people-arrows"></i>
							</div> Clientes
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages2"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion2">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth2" aria-expanded="false"
									aria-controls="pagesCollapseAuth2"> Operaciones
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth2"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="listausuarios.jsp"><i class="fas fa-list-ol m-1"></i>Listar</a> 
										<a class="nav-link" href="insertarusuario.jsp"><i class="far fa-plus-square m-1"></i>Registrar</a> 
										<a class="nav-link" href="eliminarusuario.jsp"><i class="fas fa-trash-alt m-1"></i>Eliminar</a>
										<a class="nav-link" href="actualizarusuario.jsp"><i class="fas fa-sync-alt m-1"></i>Actualizar</a>
										<a class="nav-link" href="buscarusuario.jsp"><i class="fas fa-search m-1"></i>Buscar</a>
									</nav>
								</div>
							</nav>	
						</div>
						<!-- --------------------------------- -->
						<!-- menu proveedores -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages3" aria-expanded="false"
							aria-controls="collapsePages3">
							<div class="sb-nav-link-icon">
								<i class="fas fa-truck"></i>
							</div> Proveedores
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages3"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion3">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages3">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth3" aria-expanded="false"
									aria-controls="pagesCollapseAuth3"> Operaciones
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth3"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="listausuarios.jsp"><i class="fas fa-list-ol m-1"></i>Listar</a> 
										<a class="nav-link" href="insertarusuario.jsp"><i class="far fa-plus-square m-1"></i>Registrar</a> 
										<a class="nav-link" href="eliminarusuario.jsp"><i class="fas fa-trash-alt m-1"></i>Eliminar</a>
										<a class="nav-link" href="actualizarusuario.jsp"><i class="fas fa-sync-alt m-1"></i>Actualizar</a>
										<a class="nav-link" href="buscarusuario.jsp"><i class="fas fa-search m-1"></i>Buscar</a>
									</nav>
								</div>
							</nav>	
						</div>
						<!-- --------------------------------- -->
						<!-- menu productos -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages4" aria-expanded="false"
							aria-controls="collapsePages4">
							<div class="sb-nav-link-icon">
								<i class="fas fa-apple-alt"></i>
							</div> Productos
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages4"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion4">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages4">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth4" aria-expanded="false"
									aria-controls="pagesCollapseAuth4"> Operaciones
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth4"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="listausuarios.jsp"><i class="fas fa-list-ol m-1"></i>Listar</a> 
										<a class="nav-link" href="insertarproducto.jsp"><i class="far fa-plus-square m-1"></i>Registrar</a> 
									</nav>
								</div>
							</nav>	
						</div>
						<!-- --------------------------------- -->
						<!-- menu ventas -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages5" aria-expanded="false"
							aria-controls="collapsePages5">
							<div class="sb-nav-link-icon">
								<i class="fas fa-dollar-sign"></i>
							</div> Ventas
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages5"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion5">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages5">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth5" aria-expanded="false"
									aria-controls="pagesCollapseAuth5"> Operaciones
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth5"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="listausuarios.jsp"><i class="fas fa-list-ol m-1"></i>Listar</a> 
										<a class="nav-link" href="insertarusuario.jsp"><i class="far fa-plus-square m-1"></i>Registrar</a> 
									</nav>
								</div>
							</nav>	
						</div>
						<!-- --------------------------------- -->
						<!-- menu productos -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages6" aria-expanded="false"
							aria-controls="collapsePages6">
							<div class="sb-nav-link-icon">
								<i class="fas fa-file-export"></i>
							</div> Reportes
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages6"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion6">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages6">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth6" aria-expanded="false"
									aria-controls="pagesCollapseAuth6"> Operaciones
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth6"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="listausuarios.jsp"><i class="fas fa-list-ol m-1"></i>Crear Reporte</a>  
									</nav>
								</div>
							</nav>	
						</div>
						<!-- --------------------------------- -->
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Misión TIC 2022</div>
					Grupos 9, 38 y 53
				</div>
			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Lista de usuarios</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Muestra una tabla
							conteniendo todos los usuarios registrados en el sistema</li>
					</ol>
					<div class="row">
						<div class="col-xl-12 col-md-12">
							<div class="card  text-black mb-4">

								<div class="container">
									<div class="row">
										<h1>
											<i class="fas fa-cogs"></i> Operaciones
										</h1>
										<button type="button" class="btn btn-success"
											onclick="window.location.href='/insertarusuario.jsp'">
											<i class="fas fa-plus-circle"></i> Agregar usuario
										</button>
										<button type="button" class="btn btn-danger"
											onclick="window.location.href='/eliminarusuario.jsp'">
											<i class="fas fa-trash"></i> Eliminar usuario
										</button>
										<button type="button" class="btn btn-warning"
											onclick="window.location.href='/actualizarusuario.jsp'">
											<i class="fas fa-pen-alt"></i> Actualizar usuario
										</button>
										<button type="button" class="btn btn-primary"
											onclick="window.location.href='/buscarusuario.jsp'">
											<i class="fas fa-search"></i> Buscar un usuario
										</button>
										<button type="button" class="btn btn-primary"
											onclick="window.location.href='/listausuarios.jsp'">
											<i class="fas fa-search"></i> Listar todos los usuarios
										</button>
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

			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">
							<i class="fas fa-code"></i> Diseñado y programado por Diego
							Rodriguez <i class="fas fa-code-branch"></i>
						</div>
						<div>
							<a href="https://github.com/roca12/GxEquipoXCiclo3"><i
								class="fab fa-github fa-2x"></i></a> &middot; <a
								href="https://getbootstrap.com/docs/5.0/getting-started/introduction/"><i
								class="fab fa-bootstrap fa-2x"></i></a> &middot; <a
								href="https://www.oracle.com/java/technologies/downloads/"><i
								class="fab fa-java fa-2x"></i></a> &middot; <a
								href="https://developer.mozilla.org/es/docs/Web/JavaScript"><i
								class="fab fa-js-square fa-2x"></i></a> &middot; <a
								href="https://mariadb.org/"><i class="fas fa-database fa-2x"></i></a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
</body>
</html>
