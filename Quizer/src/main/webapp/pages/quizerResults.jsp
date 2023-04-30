<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Results</title>
<link href="styles/style.css" rel="stylesheet" />
<link
	href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"
	rel="icon" class="headericon">
<title>CodePen - Collapse + Table with Bootstrap</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel="stylesheet" href="./style.css">

</head>
<body style="background-color: transparent;">
	<!-- partial:index.partial.html -->
	<div class="container" style="margin-top: 5%;">
		<div class="col-md-12">
			<div class="panel panel-default" style="border-color: rebeccapurple;">
				<div class="panel-heading" style="color: white; background-color: rebeccapurple;border-color: rebeccapurple; font-size: x-large;">Results</div>
				<div class="panel-body">
					<table class="table table-condensed table-striped" style="color: rebeccapurple;">
						<thead style="font-size: large;">
							<tr>
								<th></th>
								<th>Quiz Name</th>
								<th>Quiz Code</th>
								<th>Hosted On</th>
								<th>Status</th>
								<th>Participants</th>
							</tr>
						</thead>

						<tbody>
							<tr data-toggle="collapse" data-target="#demo1"
								class="accordion-toggle">
								<td><button class="btn btn-default btn-xs">
										<span class="glyphicon glyphicon-eye-open"></span>
									</button></td>
								<td>Carlos</td>
								<td>Mathias</td>
								<td>Leme</td>
								<td>SP</td>
								<td>new</td>
							</tr>

							<tr>
								<td colspan="12" class="hiddenRow">
									<div class="accordian-body collapse" id="demo1">
										<table class="table table-striped">
											<thead>
												<tr class="info">
													<th>Job</th>
													<th>Company</th>
													<th>Salary</th>
													<th>Date On</th>
													<th>Date off</th>
													<th>Action</th>
												</tr>
											</thead>

											<tbody>

												<tr data-toggle="collapse" class="accordion-toggle"
													data-target="#demo10">
													<td><a href="#">Enginner Software</a></td>
													<td>Google</td>
													<td>U$8.00000</td>
													<td>2016/09/27</td>
													<td>2017/09/27</td>
													<td><a href="#" class="btn btn-default btn-sm"> <i
															class="glyphicon glyphicon-cog"></i>
													</a></td>
												</tr>

												<tr>
													<td colspan="12" class="hiddenRow">
														<div class="accordian-body collapse" id="demo10">
															<table class="table table-striped">
																<thead>
																	<tr>
																		<td><a href="#"> XPTO 1</a></td>
																		<td>XPTO 2</td>
																		<td>Obs</td>
																	</tr>
																	<tr>
																		<th>item 1</th>
																		<th>item 2</th>
																		<th>item 3</th>
																		<th>item 4</th>
																		<th>item 5</th>
																		<th>Actions</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>item 1</td>
																		<td>item 2</td>
																		<td>item 3</td>
																		<td>item 4</td>
																		<td>item 5</td>
																		<td><a href="#" class="btn btn-default btn-sm">
																				<i class="glyphicon glyphicon-cog"></i>
																		</a></td>
																	</tr>
																</tbody>
															</table>

														</div>
													</td>
												</tr>

												<tr>
													<td>Scrum Master</td>
													<td>Google</td>
													<td>U$8.00000</td>
													<td>2016/09/27</td>
													<td>2017/09/27</td>
													<td><a href="#" class="btn btn-default btn-sm"> <i
															class="glyphicon glyphicon-cog"></i>
													</a></td>
												</tr>


												<tr>
													<td>Back-end</td>
													<td>Google</td>
													<td>U$8.00000</td>
													<td>2016/09/27</td>
													<td>2017/09/27</td>
													<td><a href="#" class="btn btn-default btn-sm"> <i
															class="glyphicon glyphicon-cog"></i>
													</a></td>
												</tr>


												<tr>
													<td>Front-end</td>
													<td>Google</td>
													<td>U$8.00000</td>
													<td>2016/09/27</td>
													<td>2017/09/27</td>
													<td><a href="#" class="btn btn-default btn-sm"> <i
															class="glyphicon glyphicon-cog"></i>
													</a></td>
												</tr>


											</tbody>
										</table>

									</div>
								</td>
							</tr>



							<tr data-toggle="collapse" data-target="#demo2"
								class="accordion-toggle">
								<td><button class="btn btn-default btn-xs">
										<span class="glyphicon glyphicon-eye-open"></span>
									</button></td>
								<td>Silvio</td>
								<td>Santos</td>
								<td>São Paulo</td>
								<td>SP</td>
								<td>new</td>
							</tr>
							<tr>
								<td colspan="6" class="hiddenRow"><div id="demo2"
										class="accordian-body collapse">Demo2</div></td>
							</tr>
							<tr data-toggle="collapse" data-target="#demo3"
								class="accordion-toggle">
								<td><button class="btn btn-default btn-xs">
										<span class="glyphicon glyphicon-eye-open"></span>
									</button></td>
								<td>John</td>
								<td>Doe</td>
								<td>Dracena</td>
								<td>SP</td>
								<td>New</td>
							</tr>
							<tr>
								<td colspan="6" class="hiddenRow"><div id="demo3"
										class="accordian-body collapse">Demo3 sadasdasdasdasdas</div></td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>

		</div>
	</div>
	<!-- partial -->
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
</body>

</html>