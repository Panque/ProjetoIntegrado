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
							<!--Ator-->
							<div class="form-group multiple-form-group col-xs-3" data-max=10>
								<label>Ator</label>

								<div class="form-group input-group">
									<input type="text" name="multiple[]" class="form-control"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-add">+</button>
									</span>
								</div>
							</div>
							
							<!--Personagem-->
							<div class="form-group multiple-form-group col-xs-3" data-max=10>
								<label>Personagem</label>

								<div class="form-group input-group">
									<input type="text" name="multiple[]" class="form-control"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-add">+</button>
									</span>
								</div>
							</div>
							
							<!--Genero-->
							<div class="form-group multiple-form-group col-xs-3" data-max=10>
								<label>Genero</label>

								<div class="form-group input-group">
									<input type="text" name="multiple[]" class="form-control"/>
									<span class="input-group-btn">
										<button type="button" class="btn btn-default btn-add">+</button>
									</span>
								</div>
							</div>							
							
							<div class="form-group col-xs-2">
								<label>&nbsp;</label>
								<button type="button" class="btn btn-default form-control">Filter</button>
							</div>
						</div>
					</form>
					    <div class="row">
    
							<div class="col-md-10 col-md-offset-1">

								<div class="panel panel-default panel-table">
								  <div class="panel-heading">
									<div class="row">
									  <div class="col col-xs-6">
										<h3 class="panel-title">Panel Heading</h3>
									  </div>
									  <div class="col col-xs-6 text-right">
										<button type="button" class="btn btn-sm btn-primary btn-create">Create New</button>
									  </div>
									</div>
								  </div>
								  <div class="panel-body table-responsive">
									<table class="table table-striped table-bordered table-list">
									  <thead>
										<tr>
											<th><em class="fa fa-cog"></em></th>
											<th class="hidden-xs">ID</th>
											<th>File Name</th>
											<th>Artist</th>
											<th>Composer</th>
											<th>Publisher</th>
											<th>Genre</th>
											<th>Bitrate</th>
										</tr> 
									  </thead>
									  <tbody id="myTable">

											  <tr>
												<td align="center">
												  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
												  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
												</td>
												<td class="hidden-xs">1</td>
												<td>myMp3</td>
												<td>amart</td>
												<td>am compo</td>
												<td>ampub</td>
												<td>amgen</td>
												<td>ambit</td>
											  </tr>
											  <tr>
												<td align="center">
												  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
												  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
												</td>
												<td class="hidden-xs">2</td>
												<td>myMp3</td>
												<td>amart</td>
												<td>am compo</td>
												<td>ampub</td>
												<td>amgen</td>
												<td>ambit</td>
											  </tr>
											  <tr>
												<td align="center">
												  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
												  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
												</td>
												<td class="hidden-xs">3</td>
												<td>myMp3</td>
												<td>amart</td>
												<td>am compo</td>
												<td>ampub</td>
												<td>amgen</td>
												<td>ambit</td>
											  </tr>              
											  <tr>
												<td align="center">
												  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
												  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
												</td>
												<td class="hidden-xs">4</td>
												<td>myMp3</td>
												<td>amart</td>
												<td>am compo</td>
												<td>ampub</td>
												<td>amgen</td>
												<td>ambit</td>
											  </tr>
											  <tr>
												<td align="center">
												  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
												  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
												</td>
												<td class="hidden-xs">5</td>
												<td>myMp3</td>
												<td>amart</td>
												<td>am compo</td>
												<td>ampub</td>
												<td>amgen</td>
												<td>ambit</td>
											  </tr>
																	   <tr>
												<td align="center">
												  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
												  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
												</td>
												<td class="hidden-xs">5</td>
												<td>myMp3</td>
												<td>amart</td>
												<td>am compo</td>
												<td>ampub</td>
												<td>amgen</td>
												<td>ambit</td>
											  </tr>
																	   <tr>
												<td align="center">
												  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
												  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
												</td>
												<td class="hidden-xs">5</td>
												<td>myMp3</td>
												<td>amart</td>
												<td>am compo</td>
												<td>ampub</td>
												<td>amgen</td>
												<td>ambit</td>
											  </tr>
																		<tr>
												<td align="center">
												  <a class="btn btn-default"><em class="fa fa-pencil"></em></a>
												  <a class="btn btn-danger"><em class="fa fa-trash"></em></a>
												</td>
												<td class="hidden-xs">5</td>
												<td>myMp3</td>
												<td>amart</td>
												<td>am compo</td>
												<td>ampub</td>
												<td>amgen</td>
												<td>ambit</td>
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
											<li><a href="#">«</a></li>
											<li><a href="#">»</a></li>
										</ul>
									  </div>
									</div>
								  </div>
								</div>
							</div>
						</div>
				</div> <!-- /#page-wrapper -->
			</div><!-- /.container -->
		</div>


		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
		<!--Multiple fields JavaScript-->
		<script src="js/MultipleFields.js"></script>
	</body>
</html>
