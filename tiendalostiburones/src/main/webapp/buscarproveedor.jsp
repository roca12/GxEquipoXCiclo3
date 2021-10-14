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
<title>Buscar proveedor</title>

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


	<div id="layoutSidenav_content">
		<main>

			<div w3-include-html="snippets/sidenav.html"></div>

			<div
				class="container-fluid px-4 animate__animated animate__bounceInLeft">
				<h1 class="mt-4">Buscar proveedor</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active"> Permite buscar un proveedor por su NIT</li>
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
								<i class="fas fa-table"></i> Busqueda de proveedor
							</div>
							<div class="card-body">

								<h1>
									<i class="fas fa-search m-1"></i>NIT del proveedor a buscar
								</h1>
								<div class="container">

									<div class="container">


										<div id="error" class="alert alert-danger visually-hidden"
											role="alert">Error al buscar el proveedor, el proveedor no
											existe</div>

										<div id="correcto" class="alert alert-success visually-hidden"
											role="alert">Proveedor encontrado con exito</div>

										<form id="form1">

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon4">Proveedor a buscar
													a buscar</span> <input type="text" class="form-control"
													placeholder="Inserte NIT aqui..."
													aria-describedby="basic-addon4" required id="providersearch">
											</div>
											<br> <br> <br>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1">NIT</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon1" required
													id="nit_proveedor" disabled="disabled">
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon2">Ciudad</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon2" required id="ciudad_proveedor"
													disabled="disabled">
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon3">Dirección</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon3" required
													id="direccion_proveedor" disabled="disabled">
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon4">Nombre</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon4" required id="nombre_proveedor"
													disabled="disabled">
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon5">Telefono</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon5" required id="telefono_proveedor"
													disabled="disabled">
											</div>
										</form>

										<button type="button" class="btn btn-primary"
											onclick="enviar()">
											<i class="fas fa-search"></i> Buscar proveedor
										</button>

									</div>
								</div>
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
	<script>
		function enviar() {

			var req = new XMLHttpRequest();
			var coincidencia = false;
			var provider = document.getElementById("providersearch").value;
			req.open('GET','http://localhost:8080/consultarproveedor?nit='+ provider, false);
			req.send(null);
			var proveedor = null;
			if (req.status == 200)
				proveedor = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			var element = document.getElementById("error");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");

			console.log(proveedor.toString());

			if (proveedor.toString() != "") {

				document.getElementById("nit_proveedor").value = proveedor[0].nit_proveedor;
				document.getElementById("ciudad_proveedor").value = proveedor[0].ciudad_proveedor;
				document.getElementById("direccion_proveedor").value = proveedor[0].direccion_proveedor;
				document.getElementById("nombre_proveedor").value = proveedor[0].nombre_proveedor;
				document.getElementById("telefono_proveedor").value = proveedor[0].telefono_proveedor;

				document.getElementById("providersearch").value = "";

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("nit_proveedor").value = "";
				document.getElementById("ciudad_proveedor").value = "";
				document.getElementById("direccion_proveedor").value = "";
				document.getElementById("nombre_proveedor").value = "";
				document.getElementById("telefono_proveedor").value = "";
			}
		}
	</script>
</body>
</html>











