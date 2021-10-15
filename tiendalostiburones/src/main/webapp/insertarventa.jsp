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
<title>Registrar venta</title>

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
	window.onload = function() {
		var req = new XMLHttpRequest();
		req.open('GET', 'http://localhost:8080/contadorventa', false);
		req.send(null);
		var cont = null;
		if (req.status == 200)
			cont = JSON.parse(req.responseText);
		console.log(cont.toString());
		document.getElementById("consecutivo").value=cont;
	};
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
				<h1 class="mt-4">Registrar venta</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Permite ingresar una venta
						realizada a un cliente especifico, realizado por un usuario
						especifico</li>
				</ol>


				<div class="col-xl-12 col-lg-12 col-md-12">
					<div class="card mb-4">
						<div class="card-header text-white bg-dark">
							<i class="fas fa-table"></i> Registro de venta

						</div>

						<div class="card-body">

							<h1>
								<i class="fas fa-file-invoice-dollar"></i> Datos de la venta
							</h1>

							<form>
								<div class="col-xl-4 col-lg-4 col-md-8 col-sm-8">
									<div class="input-group input-group-lg mb-3">
										<span class="input-group-text" id="basic-addon1">Consecutivo</span>
										<input type="text" class="form-control" readonly="readonly"
											id="consecutivo">
									</div>
								</div>
								<h3>Datos del cliente</h3>
								<div class="row ">
									<div class="col-xl-3 col-lg-4 col-md-4 col-sm-5">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text"> <i id="checkcliente"
												class="fas fa-times text-danger"></i></span> <span
												class="input-group-text" id="basic-addon1">Cedula
												cliente</span> <input type="text" class="form-control"
												id="cedula_cliente" oninput="traerNombreCliente()">
										</div>
									</div>
									<div class="col-xl-9 col-lg-8 col-md-8 col-sm-7">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Nombre</span>
											<input type="text" class="form-control" readonly="readonly"
												id="nombre_cliente">
										</div>
									</div>
								</div>
								<div class="border-top "></div>
								<h3>Datos del Usuario</h3>
								<div class="row ">
									<div class="col-xl-3 col-lg-4 col-md-4 col-sm-5">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text"><i id="checkusuario"
												class="fas fa-times text-danger"></i></span> <span
												class="input-group-text" id="basic-addon1">Username
												usuario</span> <input type="text" class="form-control"
												id="cedula_usuario" oninput="traerNombreUsuario()">
										</div>
									</div>
									<div class="col-xl-9 col-lg-8 col-md-8 col-sm-7">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Nombre</span>
											<input type="text" class="form-control" readonly="readonly"
												id="nombre_usuario">
										</div>
									</div>
								</div>
								<div class="border-top"></div>
								<h3>Datos de los productos</h3>


								<!-- Producto 1 -->
								<div class="row ">
									<div class="col-xl-2 col-lg-2 col-md-3 col-sm-3">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text"><i id="checkitem1"
												class="fas fa-times text-danger"></i></span> <span
												class="input-group-text" id="basic-addon1">Cod.</span> <input
												type="text" class="form-control" id="codigo_producto1">
										</div>
									</div>

									<div class="col-xl-1 col-lg-1 col-md-1 col-sm-1">
										<button type="button" class="btn btn-info text-white" onclick="cargarProducto1()">
											<i class="fas fa-search-dollar"></i>
										</button>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-8 col-sm-8">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Nombre</span>
											<input type="text" class="form-control" id="nombre_producto1"
												readonly="readonly">
										</div>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-4 col-sm-4">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Cant.</span>
											<input type="text" class="form-control" id="cant1">
										</div>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Valor
												total</span> <input type="text" class="form-control" id="valtotal1">
										</div>
									</div>

								</div>

								<!-- producto 2 -->
								<div class="row ">
									<div class="col-xl-2 col-lg-2 col-md-3 col-sm-3">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text"><i id="checkitem2"
												class="fas fa-times text-danger"></i></span> <span
												class="input-group-text" id="basic-addon1">Cod.</span> <input
												type="text" class="form-control" id="codigo_producto2">
										</div>
									</div>

									<div class="col-xl-1 col-lg-1 col-md-1 col-sm-1">
										<button type="button" class="btn btn-info text-white" onclick="cargarProducto2()">
											<i class="fas fa-search-dollar"></i>
										</button>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-8 col-sm-8">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Nombre</span>
											<input type="text" class="form-control" id="nombre_producto2"
												readonly="readonly">
										</div>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-4 col-sm-4">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Cant.</span>
											<input type="text" class="form-control" id="cant2">
										</div>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Valor
												total</span> <input type="text" class="form-control" id="valtotal2">
										</div>
									</div>

								</div>

								<!-- producto 3 -->
								<div class="row ">
									<div class="col-xl-2 col-lg-2 col-md-3 col-sm-3">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text"><i id="checkitem3"
												class="fas fa-times text-danger"></i></span> <span
												class="input-group-text" id="basic-addon1">Cod.</span> 
												<input
												type="text" class="form-control" id="codigo_producto3">
										</div>
									</div>

									<div class="col-xl-1 col-lg-1 col-md-1 col-sm-1">
										<button type="button" class="btn btn-info text-white" onclick="cargarProducto3()">
											<i class="fas fa-search-dollar"></i>
										</button>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-8 col-sm-8">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Nombre</span>
											<input type="text" class="form-control" id="nombre_producto3"
												readonly="readonly">
										</div>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-4 col-sm-4">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Cant.</span>
											<input type="text" class="form-control" id="cant3">
										</div>
									</div>

									<div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Valor
												total</span> <input type="text" class="form-control" id="valtotal3">
										</div>
									</div>

								</div>
								<div class="border-top"></div>

								<div class="row justify-content-end mt-3">
									<div class="col-xl-3 col-lg-3 col-md-7 col-sm-8">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Total
												venta</span> <input type="text" class="form-control"
												id="total_venta">
										</div>
									</div>
								</div>

								<div class="row justify-content-end mt-3">
									<div class="col-xl-3 col-lg-3 col-md-7 col-sm-8">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Total
												IVA</span> <input type="text" class="form-control" id="total_iva">
										</div>
									</div>
								</div>

								<div class="row justify-content-end mt-3">
									<div class="col-xl-3 col-lg-3 col-md-7 col-sm-8">
										<div class="input-group input-group-sm mb-3">
											<span class="input-group-text" id="basic-addon1">Total
												venta + IVA</span> <input type="text" class="form-control"
												id="total_iva">
										</div>
									</div>
								</div>

								<div class="row justify-content-center">
									<div class="col-4">
										<button type="button" class="btn btn-success">
											<i class="fas fa-plus-circle"></i> Registrar venta
										</button>
									</div>

								</div>

							</form>

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
		function traerNombreCliente() {
			var client = document.getElementById("cedula_cliente").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/consultarcliente?cedula='
					+ client, false);
			req.send(null);
			var cliente = null;
			if (req.status == 200)
				cliente = JSON.parse(req.responseText);
			console.log(cliente);

			
			var icono = document.getElementById("checkcliente");
			if (cliente.toString() != "") {

				document.getElementById("nombre_cliente").value = cliente[0].nombre_cliente;
				
				icono.classList.replace("text-danger", "text-success");
				icono.classList.replace("fa-times", "fa-check");

			} else {
				document.getElementById("nombre_cliente").value = "";
				icono.classList.replace("text-success", "text-danger");
				icono.classList.replace("fa-check", "fa-times");
			}
		}
		
		function traerNombreUsuario() {
			var user = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/consultarusuario?usuario='
					+ user, false);
			req.send(null);
			var usuario = null;
			if (req.status == 200)
				usuario = JSON.parse(req.responseText);
			console.log(usuario);

			
			var icono2 = document.getElementById("checkusuario");
			if (usuario.toString() != "") {

				document.getElementById("nombre_usuario").value = usuario[0].nombre_usuario;
				
				icono2.classList.replace("text-danger", "text-success");
				icono2.classList.replace("fa-times", "fa-check");

			} else {
				document.getElementById("nombre_usuario").value = "";
				icono2.classList.replace("text-success", "text-danger");
				icono2.classList.replace("fa-check", "fa-times");
			}
		}
		var precio1=0.0;
		function cargarProducto1(){
			var prod1 = document.getElementById("codigo_producto1").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/consultarproducto?code='
					+ prod1, false);
			req.send(null);
			var producto1 = null;
			if (req.status == 200)
				producto1 = JSON.parse(req.responseText);
			
			
			
			var icono = document.getElementById("checkitem1");
			if (producto1.toString() != "") {

				console.log(producto1);
				document.getElementById("nombre_producto1").value=producto1[0].nombre_producto;
				precio1=parseFloat(producto1[0].precio_venta);
				console.log("Precio1: "+precio1)
				icono.classList.replace("text-danger", "text-success");
				icono.classList.replace("fa-times", "fa-check");

			} else {
				document.getElementById("nombre_producto1").value = "";
				icono.classList.replace("text-success", "text-danger");
				icono.classList.replace("fa-check", "fa-times");
			}
			
			
			
			
		}
		
		var precio2=0.0;
		function cargarProducto2(){
			var prod2 = document.getElementById("codigo_producto2").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/consultarproducto?code='
					+ prod2, false);
			req.send(null);
			var producto2 = null;
			if (req.status == 200)
				producto2 = JSON.parse(req.responseText);
			var icono = document.getElementById("checkitem2");
			if (producto2.toString() != "") {

				console.log(producto2);
				document.getElementById("nombre_producto2").value=producto2[0].nombre_producto;
				precio1=parseFloat(producto2[0].precio_venta);
				console.log("Precio2: "+precio2)
				icono.classList.replace("text-danger", "text-success");
				icono.classList.replace("fa-times", "fa-check");

			} else {
				document.getElementById("nombre_producto2").value = "";
				icono.classList.replace("text-success", "text-danger");
				icono.classList.replace("fa-check", "fa-times");
			}
		}
		
		var precio3=0.0;
		function cargarProducto3(){
			var prod3 = document.getElementById("codigo_producto3").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/consultarproducto?code='
					+ prod3, false);
			req.send(null);
			var producto3 = null;
			if (req.status == 200)
				producto3 = JSON.parse(req.responseText);
			var icono = document.getElementById("checkitem3");
			if (producto3.toString() != "") {

				console.log(producto3);
				document.getElementById("nombre_producto3").value=producto3[0].nombre_producto;
				precio1=parseFloat(producto3[0].precio_venta);
				console.log("Precio3: "+precio3)
				icono.classList.replace("text-danger", "text-success");
				icono.classList.replace("fa-times", "fa-check");

			} else {
				document.getElementById("nombre_producto3").value = "";
				icono.classList.replace("text-success", "text-danger");
				icono.classList.replace("fa-check", "fa-times");
			}
		}
		
		
	</script>



</body>
</html>











