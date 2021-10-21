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
				<h1 class="mt-4">Registro de usuarios</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">Permite registrar un nuevo
						usuario en el sistema</li>
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
									<i class="fas fa-plus-circle"></i> Datos del nuevo usuario
								</h1>
								<div class="container">


									<div id="error" class="alert alert-danger visually-hidden"
										role="alert">Error al crear el usuario, verifique que no
										exista un usuario con la cedula y usuario dados</div>

									<div id="correcto" class="alert alert-success visually-hidden"
										role="alert">Usuario creado con exito</div>

									<form>

										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon1">Cedula</span>
											<input type="text" class="form-control"
												placeholder="Inserte cedula aqui..."
												aria-describedby="basic-addon1" required id="cedula_usuario">
											<div class="invalid-feedback">Agregue una cedula</div>
										</div>


										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon2">Email</span>
											<input type="text" class="form-control"
												placeholder="Inserte email aqui..."
												aria-describedby="basic-addon2" required id="email_usuario">
										</div>

										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon3">Nombrecompleto</span>
											<input type="text" class="form-control"
												placeholder="Inserte nonbre aqui..."
												aria-describedby="basic-addon3" required id="nombre_usuario">
										</div>

										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon4">Username</span>
											<input type="text" class="form-control"
												placeholder="Inserte username aqui..."
												aria-describedby="basic-addon4" required id="user">
										</div>

										<div class="input-group mb-3">
											<span class="input-group-text" id="basic-addon5">Password</span>
											<input type="text" class="form-control"
												placeholder="Inserte password aqui..."
												aria-describedby="basic-addon5" required id="password">
										</div>
									</form>

									<button type="button" class="btn btn-success"
										onclick="enviar()">
										<i class="fas fa-check"></i> Insertar nuevo usuario
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>

		<div w3-include-html="/snippets/footer.html"></div>

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
			var getUrl = window.location;
			var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
	
			
			var x = document.getElementById("user").value;
			var y = document.getElementById("cedula_usuario").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', baseUrl+'/listarusuarios', false);
			req.send(null);
			var usuarios = null;
			if (req.status == 200)
				usuarios = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < usuarios.length; i++) {
				console.log(usuarios[i].usuario);
				console.log(usuarios[i].cedula_usuario);
				if (usuarios[i].usuario == x) {
					console.log(usuarios[i].usuario + " " + x);
					coincidencia = true
					break;
				}

				if (usuarios[i].cedula_usuario == y) {
					console.log(usuarios[i].cedula_usuario + " " + y);
					coincidencia = true
					break;
				}
			}

			console.log(coincidencia);

			if (coincidencia == false) {
				var formData = new FormData();
				formData.append("cedula_usuario", document
						.getElementById("cedula_usuario").value);
				formData.append("email_usuario", document
						.getElementById("email_usuario").value);
				formData.append("nombre_usuario", document
						.getElementById("nombre_usuario").value);
				formData.append("password",
						document.getElementById("password").value);
				formData.append("usuario",
						document.getElementById("user").value);
				var xhr = new XMLHttpRequest();
				xhr.open("POST", baseUrl+"/registrarusuario");

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_usuario").value = "";
				document.getElementById("email_usuario").value = "";
				document.getElementById("nombre_usuario").value = "";
				document.getElementById("password").value = "";
				document.getElementById("user").value = "";
				xhr.send(formData);

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