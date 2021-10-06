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
<title>Insertar Usuario</title>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
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
				<div class="container-fluid px-4 animate__animated animate__bounceInLeft">
					<h1 class="mt-4">Insertar archivo de productos</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Permite cargar un archivo CSV con los productos que tiene la tienda</li>
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
									<i class="fas fa-table"></i> Carga de archivo de productos
								</div>
								<div class="card-body">
									<div class="container">

										<h1>
											<i class="fas fa-plus-circle"></i> Insertando archivo de
											productos
										</h1>
										<div class="container">


											<div id="error" class="alert alert-danger visually-hidden"
												role="alert">Archivo vacio, extensión no valida o
												datos corruptos (El separador debe ser coma ",")</div>

											<div id="correcto"
												class="alert alert-success visually-hidden" role="alert">Productos
												importados desde CSV con exito</div>

											<form id="form1">
												<div>
													<label for="formFileLg" class="form-label">Seleccionar
														archivo CSV con el inventario de productos</label> <input
														class="form-control form-control-lg" id="archivo"
														type="file" accept=".csv">
													<button type="button" class="btn btn-success"
														onclick="subirArchivo()">Subir archivo</button>
												</div>

											</form>

										</div>



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
	<script>
		function subirArchivo() {

			try {

				var csvFile = document.getElementById("archivo");

				var input = csvFile.files[0];
				var reader = new FileReader();

				reader.onload = function(e) {

					var text = e.target.result;

					var arrayLineas = text.split("\n");

					var xhr = new XMLHttpRequest();
					xhr.open("DELETE",
							"http://localhost:8080/eliminartodoproducto", true);
					xhr.send();

					for (var i = 0; i < arrayLineas.length; i += 1) {
						var arraydatos = arrayLineas[i].split(",");

						if (arrayLineas[i] == "") {
							continue;
						}

						for (var j = 0; j < arraydatos.length; j += 1) {
							console.log(i + " " + j + "->" + arraydatos[j]);
						}

						var formData = new FormData();
						formData.append("codigo_producto", arraydatos[0]);
						formData.append("nombre_producto", arraydatos[1]);
						formData.append("nit_proveedor", arraydatos[2]);
						formData.append("precio_compra", arraydatos[3]);
						formData.append("iva_compra", arraydatos[4]);
						formData.append("precio_venta", arraydatos[5]);
						var xhr = new XMLHttpRequest();
						xhr.open("POST",
								"http://localhost:8080/registrarproducto");

						xhr.send(formData);
					}

					var element = document.getElementById("error");
					element.classList.add("visually-hidden");
					var element2 = document.getElementById("correcto");
					element2.classList.remove("visually-hidden");

					document.getElementById("archivo").value = "";

				};

				reader.readAsText(input);
			} catch (error) {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");

				document.getElementById("archivo").value = "";
			}
		}
	</script>
</html>








