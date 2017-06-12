<%-- 
    Document   : busca1
    Created on : Jun 7, 2017, 2:05:34 PM
    Author     : renan
--%>

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
	<link href="css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles -->
	<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<div id="wrapper">
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
						<li class="active"><a href="${pageContext.request.contextPath}/busca1.jsp">Busca Avançada</a></li>
						<li><a href="/busca2">Ranking Gêneros</a></li>
						<li><a href="/about">Sobre</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container">
			<div id="page-wrapper">
				<h1 class="page-header">Busca 1</h1>
				<form role="form">
					<div class="row">
						<div class="form-group col-sm-1">
							<button type="button" class="btn btn-success btn-add">+</button>
						</div>
						<div class="form-group col-sm-3">
							<label>Text Input</label>
							<input class="form-control">
							<p class="help-block">Example block-level help text here.</p>
						</div>
						<div class="form-group col-md-3">
							<label>Text Input</label>
							<input class="form-control">
							<p class="help-block">Example block-level help text here.</p>
						</div>
						<div class="form-group col-md-3">
							<label>Text Input</label>
							<input class="form-control">
							<p class="help-block">Example block-level help text here.</p>
						</div>
						<div class="form-group col-md-2">
							<button type="submit" class="btn btn-default">Buscar</button>
						</div>
					<div>
			</div> <!-- /#page-wrapper -->
		</div><!-- /.container -->
	</div>


	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
