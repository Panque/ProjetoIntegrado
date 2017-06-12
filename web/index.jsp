<!DOCTYPE html>
<html lang="en">
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
					<li class="active"><a href="#">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/busca1.jsp">Busca Avan�ada</a></li>
					<li><a href="${pageContext.request.contextPath}/busca2">Ranking G�neros</a></li>
					<li><a href="${pageContext.request.contextPath}/about">Sobre</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">
		<div class="starter-template">
			<div id="jumbo" class="jumbotron">
				<h1 class="display-3">CineData</h1>
				<p class="lead">Gerenciamento de filmes, diretores e artistas</p>
			</div>
		</div>
	</div><!-- /.container -->


	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>