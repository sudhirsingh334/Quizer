<%@page import="com.quizer.service.PersistentHelper"%>
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
	<%@ page import="com.quizer.pojo.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="com.quizer.utilities.*"%>
	<%@ page import="com.database.*"%>
	<%@ page import="com.quiz.dto.*"%>
	<%
//Fetch QuizHosts
QuizResults results = PersistentHelper.singleton.getQuizResults();
ArrayList<QuizHostDTO> hosts = new ArrayList<QuizHostDTO>();
	if (results != null) {
		ArrayList<QuizHostDTO> hostTemp = results.getHostList();
		if (hostTemp != null) {
			hosts = hostTemp;
		}
	}
%>
	<!-- partial:index.partial.html -->
	<div class="container" style="margin-top: 5%;">
		<div class="col-md-12">
			<div class="panel panel-default" style="border-color: rebeccapurple;">
				<div class="panel-heading"
					style="color: white; background-color: rebeccapurple; border-color: rebeccapurple; font-size: x-large;">Results</div>
				<div class="panel-body">
					<table class="table table-condensed table-striped"
						style="color: rebeccapurple;">
						<thead style="font-size: large;">
							<tr>
								<th></th>
								<th>Quiz Name</th>
								<th>Code</th>
								<th>Hosted On</th>
								<th>Status</th>
								<th>Participants</th>
							</tr>
						</thead>

						<tbody>
						<% 
						Iterator<QuizHostDTO> it = hosts.iterator();
						int hostRowCounter = 1;
						
						while (it.hasNext()) {
							QuizHostDTO host = it.next();
							
							String dataTarget = "demo"+hostRowCounter;
							
							String hostRowHTML = "<tr data-toggle='collapse' data-target='#%s'"+
									"class='accordion-toggle'>"+
									"<td><button class='btn btn-default btn-xs'>"+
											"<span class='glyphicon glyphicon-eye-open'></span>"+
										"</button></td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
								"</tr>";
							String hostRowHTMLFormated = String.format(hostRowHTML, dataTarget, host.getQuizName(), host.getCode(), host.getHostedAt(), host.getStatus(), "#");
							out.write(hostRowHTMLFormated);
							
							String hiddenRowHeader = "<tr>"+
									"<td colspan='12' class='hiddenRow'>"+
									"<div class='accordian-body collapse' id=\"%s\">"+
										"<table class='table table-striped'>"+
											"<thead>"+
												"<tr class='info'>"+
												    "<th>Candidate</th>"+
													"<th>Joined At</th>"+
													"<th>Attempted</th>"+
													"<th>Correct</th>"+
													"<th>score</th>"+
													"<th>Action</th>"+
												"</tr>"+
											"</thead>"+
											"<tbody>";
							
							String hiddenRowHeaderFormated = String.format(hiddenRowHeader, dataTarget);
							
							out.write(hiddenRowHeaderFormated);
							
							ArrayList<ResultCandidate> candidateList = host.getCandidateList();
							Iterator<ResultCandidate> rcIT = candidateList.iterator();
							
							String candidateRow = "<tr data-toggle='collapse' class='accordion-toggle'"+
									"data-target='#demo10'>"+
									"<td><a href='#'>%s</a></td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td><a href='#' class='btn btn-default btn-sm'> "+
									"<i class='glyphicon glyphicon-cog'></i>"+
									"</a></td>"+
								"</tr>";
								
								while (rcIT.hasNext()) {
									ResultCandidate rsltCand = rcIT.next();
									String candidateRowFormated = String.format(candidateRow, rsltCand.getName(), "#", "#","#", "#");
									out.write(candidateRowFormated);
								}
								
								out.write("</tbody> </table> </div></td></tr>");
								++hostRowCounter;	
						}
						
						%>
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