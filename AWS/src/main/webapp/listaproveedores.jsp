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
<title>Lista de proveedores</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<script>
	
var getUrl = window.location;
var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

	window.addEventListener('DOMContentLoaded', event => {
	    // Simple-DataTables
	    // https://github.com/fiduswriter/Simple-DataTables/wiki
		let table=null;
	    if (datatablesproveedores) {
	        table=new simpleDatatables.DataTable("#datatablesproveedores", {
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
			xmlhttp.open("GET", baseUrl+"/listarproveedores", true);
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {

					var usuarios = JSON.parse(xmlhttp.responseText);
					
					for (i = 0; i < usuarios.length; i++) {
						let fila = [
							usuarios[i].nit_proveedor.toString(), 
							usuarios[i].ciudad_proveedor, 
							usuarios[i].direccion_proveedor, 
							usuarios[i].nombre_proveedor, 
							usuarios[i].telefono_proveedor
						];

					    table.rows().add(fila);
					}
				}
			};
			
			xmlhttp.send();
	});
</script>
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


	<div id="layoutSidenav_content">
		<main>

			<div w3-include-html="snippets/sidenav.html"></div>

			<div
				class="container-fluid px-4 animate__animated animate__bounceInLeft">
				<h1 class="mt-4">Lista de proveedores</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active"> Muestra la lista de los proveedores registrados</li>
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
											onclick="window.location.href='<%=request.getContextPath()%>/insertarproveedor.jsp'">
											<i class="fas fa-plus-circle"></i> Agregar proveedor
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-danger"
											onclick="window.location.href='<%=request.getContextPath()%>/eliminarproveedor.jsp'">
											<i class="fas fa-trash"></i> Eliminar proveedor
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-4">
										<button type="button" class="btn btn-warning"
											onclick="window.location.href='<%=request.getContextPath()%>/actualizarproveedor.jsp'">
											<i class="fas fa-pen-alt"></i> Actualizar proveedor
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-primary"
											onclick="window.location.href='<%=request.getContextPath()%>/buscarproveedor.jsp'">
											<i class="fas fa-search"></i> Buscar proveedor
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-primary"
											onclick="window.location.href='<%=request.getContextPath()%>/listaproveedores.jsp'">
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
								<i class="fas fa-table"></i> Listado de proveedores
							</div>
							<div class="card-body">
								<table id="datatablesproveedores">
									<thead>
										<tr>
											<th>NIT</th>
											<th>Ciudad</th>
											<th>Dirección</th>
											<th>Nombre</th>
											<th>Telefono</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>NIT</th>
											<th>Ciudad</th>
											<th>Dirección</th>
											<th>Nombre</th>
											<th>Telefono</th>
										</tr>
									</tfoot>
									<tbody id="proveedoresinfo">

									</tbody>
								</table>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>

		<div w3-include-html="snippets/footer.html"></div>


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











