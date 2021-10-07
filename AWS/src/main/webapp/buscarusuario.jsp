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
<title>Buscar Usuario</title>

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

	<div w3-include-html="snippets/sidenav.html"></div>

	<div id="layoutSidenav_content">
		<main>
			<div
				class="container-fluid px-4 animate__animated animate__bounceInLeft">
				<h1 class="mt-4">Eliminar usuario</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Permite eliminar un usuario
						existente</li>
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
											onclick="window.location.href='<%=request.getContextPath()%>/insertarusuario.jsp'">
											<i class="fas fa-plus-circle"></i> Agregar usuario
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-danger"
											onclick="window.location.href='<%=request.getContextPath()%>/eliminarusuario.jsp'">
											<i class="fas fa-trash"></i> Eliminar usuario
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-4">
										<button type="button" class="btn btn-warning"
											onclick="window.location.href='<%=request.getContextPath()%>/actualizarusuario.jsp'">
											<i class="fas fa-pen-alt"></i> Actualizar usuario
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-primary"
											onclick="window.location.href='<%=request.getContextPath()%>/buscarusuario.jsp'">
											<i class="fas fa-search"></i> Buscar usuario
										</button>
									</div>
									<div class="col-sm-2 col-md-2 me-2">
										<button type="button" class="btn btn-primary"
											onclick="window.location.href='<%=request.getContextPath()%>/listausuarios.jsp'">
											<i class="fas fa-search"></i> Listado completa
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
								<i class="fas fa-table"></i> Formulario de registro de usuario
							</div>
							<div class="card-body">

								<h1>
									<i class="fas fa-search m-1"></i>Username del usuario a buscar
								</h1>
								<div class="container">

									<div class="container">


										<div id="error" class="alert alert-danger visually-hidden"
											role="alert">Error al buscar el usuario, el usuario no
											existe</div>

										<div id="correcto" class="alert alert-success visually-hidden"
											role="alert">Usuario encontrado con exito</div>

										<form id="form1">

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon4">Usuario
													a buscar</span> <input type="text" class="form-control"
													placeholder="Inserte username aqui..."
													aria-describedby="basic-addon4" required id="usersearch">
											</div>
											<br> <br> <br>
											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon1">Cedula</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon1" required
													id="cedula_usuario" disabled="disabled">
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon2">Email</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon2" required id="email_usuario"
													disabled="disabled">
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon3">Nombrecompleto</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon3" required
													id="nombre_usuario" disabled="disabled">
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon4">Username</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon4" required id="user"
													disabled="disabled">
											</div>

											<div class="input-group mb-3">
												<span class="input-group-text" id="basic-addon5">Password</span>
												<input type="text" class="form-control"
													aria-describedby="basic-addon5" required id="password"
													disabled="disabled">
											</div>
										</form>

										<button type="button" class="btn btn-primary"
											onclick="enviar()">
											<i class="fas fa-search"></i> Buscar usuario
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
			var user = document.getElementById("usersearch").value;
			req
					.open(
							'GET',
							'http://ec2-3-95-37-63.compute-1.amazonaws.com:8080/tiendalostiburones-0.0.1/consultarusuario?usuario='
									+ user, false);
			req.send(null);
			var usuario = null;
			if (req.status == 200)
				usuario = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			var element = document.getElementById("error");
			element.classList.add("visually-hidden");
			var element2 = document.getElementById("correcto");
			element2.classList.remove("visually-hidden");

			console.log(usuario.toString());

			if (usuario.toString() != "") {

				document.getElementById("cedula_usuario").value = usuario[0].cedula_usuario;
				document.getElementById("email_usuario").value = usuario[0].email_usuario;
				document.getElementById("nombre_usuario").value = usuario[0].nombre_usuario;
				document.getElementById("password").value = usuario[0].password;
				document.getElementById("user").value = usuario[0].usuario;

				document.getElementById("usersearch").value = "";

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
			}
		}
	</script>
</body>
</html>
