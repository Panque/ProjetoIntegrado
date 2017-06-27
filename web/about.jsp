<%-- 
    Document   : sobre
    Created on : Jun 14, 2017, 11:42:55 PM
    Author     : renan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="favicon.ico">

		<title>CineData</title>

		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

		<!-- Custom styles -->
		<link href="css/style.css" rel="stylesheet">
		
	</head>
	<body class="full background-tint">
		<!-- Nav Bar -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
						<span class="glyphicon glyphicon-facetime-video" aria-hidden="true" style="color: gold; top:2px"></span> CineData
					</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/busca1.jsp">Busca Avançada</a></li>
						<li><a href="${pageContext.request.contextPath}/busca2.jsp">Ranking Gêneros</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/about.jsp">Sobre</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</nav>	

		<div class="container">
			<div class="starter-template">
				<div id="jumbo" class="jumbotron">
					<div class="row">
						<h1 id="title" class="display-3">Trabalho Integrado</h1>
						<h2 class="lead">Web, ES2 e Lab de BD</h2>
					</div>
					<div class="row">
						<div class="col-xs-3">
							<figure class=figure">
								<img src="${pageContext.request.contextPath}/img/joao.jpg" class="figure-img ratio img-responsive img-circle">
								<figcaption class="figure-caption text-center">
									João Marcos Costa Salles
								</figcaption>
							</figure>
						</div>
						<div class="col-xs-3">
							<figure class=figure">
								<img src="${pageContext.request.contextPath}/img/luan.jpg" class="figure-img ratio img-responsive img-circle">
								<figcaption class="figure-caption text-center">
									Luan Gustavo Maia Dias
								</figcaption>
							</figure>
						</div>					
						<div class="col-xs-3">
							<figure class=figure">
								<img src="${pageContext.request.contextPath}/img/renan.jpg" class="figure-img ratio img-responsive img-circle">
								<figcaption class="figure-caption text-center">
									Renan Rossignatti de França
								</figcaption>
							</figure>
						</div>							
						<div class="col-xs-3">
							<figure class=figure">
								<img src="${pageContext.request.contextPath}/img/stefany.jpg" class="figure-img ratio img-responsive img-circle">
								<figcaption class="figure-caption text-center">
									Stefany Noriko Tengan Pires
								</figcaption>
							</figure>
						</div>						
					</div>	
				</div><!-- /.container -->
			</div>
		</div>		
	</body>
</html>
