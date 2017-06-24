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

		<!-- Font Awesome -->
		<link href="css/font-awesome.min.css" rel='stylesheet' type='text/css'>

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
							<li><a href="${pageContext.request.contextPath}/busca2.jsp">Ranking Gêneros</a></li>
							<li><a href="${pageContext.request.contextPath}/about.jsp">Sobre</a></li>
						</ul>
					</div><!--/.nav-collapse -->
				</div>
			</nav>

			<div class="container">
				<div id="page-wrapper">
					<h1 class="page-header">Busca Avançada de filmes</h1>
					<form role="form" id="formBusca" action="Busca1" method="post">
						<div class="row">
							<!--Ator-->
							<div class="form-group multiple-form-group col-xs-3 col-sm-offset-1" data-max=3>
								<label>Ator</label>

								<div class="form-group input-group">
									<input type="text" name="ator[]" class="form-control" value="DeGeneres, Ellen"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-add">+</button>
									</span>
								</div>
							</div>

							<!--Personagem-->
							<div class="form-group multiple-form-group col-xs-3" data-max=3>
								<label>Personagem</label>

								<div class="form-group input-group">
									<input type="text" name="personagem[]" class="form-control"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-add">+</button>
									</span>
								</div>
							</div>

							<!--Genero-->
							<div class="form-group multiple-form-group col-xs-3">
								<label>Genero</label>

								<div class="form-group">
									<input type="text" name="genero" class="form-control"/>
								</div>
							</div>							

							<div class="form-group col-xs-1">
								<label>&nbsp;</label>
								<button type="submit" id="btn-busca" class="btn btn-default form-control">
									<span class="glyphicon glyphicon-search"/>
								</button>
							</div>
						</div>
					</form>
					<!--/form-->

					<!--Tabela paginada-->
					<div class="row">
						<div class="panel panel-default panel-table">
							<div class="panel-heading">
								<div class="row">
									<div class="col col-xs-6">
										<h3 class="panel-title">Resultados</h3>
									</div>
								</div>
							</div>
							<div class="panel-body table-responsive">
								<table class="table table-striped table-bordered table-list">
									<thead>
										<tr>
											<th class="hidden-xs">ID</th>
											<th>Título</th>
											<th>Ano</th>
										</tr> 
									</thead>
									<tbody id="myTable">
										<tr>
											<td class="hidden-xs"></td>
											<td></td>
											<td></td>
										</tr>										
									</tbody>
								</table>
							</div>
							<div class="panel-footer">
								<div class="row">

									<div class="col col-xs-4">Page 1 of 5
									</div>
									<div class="col col-xs-8">
										<ul class="pagination hidden-xs pull-right" id="myPager">
										</ul>
										<ul class="pagination visible-xs pull-right">
											<li><a href="#">'<'</a></li>
											<li><a href="#">'>'</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--/Tabela Paginada-->
					
				</div> <!-- /#page-wrapper -->
			</div><!-- /.container -->
		</div> <!-- /.Wrapper -->


		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>

		<!--Multiple fields JavaScript-->
		<script src="js/multipleFields.js"></script>

		<!-- Table JavaScript -->
		<script src="js/tablePagination.js"></script>
		
		<script type="text/javascript">  
			$(document).on("submit", "#someform", function(event) {
				var $form = $(this);

				event.preventDefault();

				$.ajax({
					type: $form.attr("method"),					
					url: $form.attr("action"),
					data: $form.serialize(),
					success: function(responseXml) {
						$("#myTable").html($(responseXml).find("data").html());
					}
				});
			});
		</script>

	</body>
</html>
