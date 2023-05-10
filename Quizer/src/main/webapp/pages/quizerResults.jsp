<%@page import="java.util.stream.Collectors"%>
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
	<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="com.quizer.servlet.*"%>
	
	<%
//Fetch QuizHosts
QuizResults results = PersistentHelper.singleton.getQuizResults();
	session.setAttribute("Results", results);
ArrayList<QuizHostDTO> hosts = new ArrayList<QuizHostDTO>();
	if (results != null) {
		ArrayList<QuizHostDTO> hostTemp = results.getHostList();
		if (hostTemp != null) {
			hosts = hostTemp;
		}
	}
%>

	<div class="container" style="margin-top:5%;zoom:110%;margin-top:4%; ">
				  <input type="submit" onClick="getQuizerBack()" value="Back" class="button"/>
	
		<div class="col-md-12">
			<div class="panel panel-default" style="border-color: rebeccapurple;">
				<div class="panel-heading"
					style="color: white; background-color: rebeccapurple; border-color: rebeccapurple; font-size: x-large;">Results</div>
					<div class="table-responsive">
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

						<body>
						<% 
						
						
						
						
						if (hosts == null || hosts.size() <1) {
							String noHostRecordRow = "<tr data-toggle='collapse' data-target='#%s' class='accordion-toggle'>" +
									"<td colspan='12' style='text-align: center;'> No Quiz Hosted Yet</td></tr>";
									out.write(noHostRecordRow);
									
						}
						
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
								
							int participantsCount = 0;
							ArrayList<ResultCandidate> candidateList = host.getCandidateList();
							
							if (candidateList != null) {
								participantsCount = candidateList.size();
							}
							
							String hostRowHTMLFormated = String.format(hostRowHTML, dataTarget, host.getQuizName(), host.getCode(), host.getHostedAt(), host.getStatus(), participantsCount);
							out.write(hostRowHTMLFormated);
							
							String hiddenRowHeader = "<tr>"+
									"<td colspan='12' class='hiddenRow'>"+
									"<div class='accordian-body collapse' id=\"%s\">"+
									"<form action='preparQuizSummary' method='post'>"+
										"<table class='table table-striped'>"+
											"<thead>"+
												"<tr class='info'>"+
												    "<th>Candidate</th>"+
													"<th>Time Taken</th>"+
													"<th>Attempted</th>"+
													"<th>Correct</th>"+
													"<th>Score</th>"+
													"<th>Action</th>"+
												"</tr>"+
											"</thead>"+
											"<tbody>";
							
							String hiddenRowHeaderFormated = String.format(hiddenRowHeader, dataTarget);
							
							out.write(hiddenRowHeaderFormated);
							
							Iterator<ResultCandidate> rcIT = candidateList.iterator();
							
							String candidateRow = "<tr data-toggle='collapse' class='accordion-toggle'"+
									"data-target='#demo10'>"+
									"<td><a href='#'>%s</a></td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td>%s</td>"+
									"<td><button type='submit' class='btn btn-default btn-sm' name='download' value='%s'> download</button>"+
									"<i class='glyphicon glyphicon-cog'></i>"+
									"</a></td>"+
								"</tr>";
								
								while (rcIT.hasNext()) {
									ResultCandidate rsltCand = rcIT.next();
									//Calculate Number of Attempted Questions
									//Attempted Questions -> The question which has selected answer is attempted question.
									//Calculate Total Correct Questions
									// Correct Question -> if the id of slected Answer is equal to the id of answer from OptionList of question which is correct

									
									
									int totalQuestion = 0;
									int attemptedQsnCount = 0;
									int correctAnswers = 0;
									String scorePerc = "NA";
									
									if (rsltCand.getAttemptedQuestionList() != null) {
									Iterator<CandidateQuestionDTO> candQsnIT = rsltCand.getAttemptedQuestionList().iterator();
									Quiz quiz = PersistentHelper.singleton.getQuizById(host.getQuizId());
									
									if (quiz != null && quiz.getQuestionList() != null) {
										totalQuestion = quiz.getQuestionList().size();
									}
									
									while (candQsnIT.hasNext()) {
										CandidateQuestionDTO candQsn = candQsnIT.next();
										
										if (candQsn.getSelectedAnswerDTO() != null) {
											++attemptedQsnCount;
											
											AnswerDTO selectedAnswr = candQsn.getSelectedAnswerDTO();
											
											ArrayList<AnswerDTO> correctOptionList = candQsn.getAnswerDTOList();
											
											if (correctOptionList != null && !correctOptionList.isEmpty()) {
												
												Iterator<AnswerDTO> answerIT = candQsn.getAnswerDTOList().iterator();
												AnswerDTO correctOption = null;
												
												while (answerIT.hasNext()) {
													AnswerDTO correctOptionTemp = answerIT.next();
													if (correctOptionTemp.isCorrect()) {
														correctOption = correctOptionTemp;
														break;
													}
												}
												
												if (correctOption != null && correctOption.getId().equalsIgnoreCase(selectedAnswr.getId())){
													++correctAnswers;
												}
											}
										}
									}
									//Calculate Score
									if (totalQuestion > 0) {
										double score = (((double)correctAnswers)/totalQuestion) * 100;
										scorePerc =  score + "%";
									}
								}
									//Calculate Time Take
									String duration = "NA";
									String joinedAt = rsltCand.getJoinedAt();
									String completedAt = rsltCand.getCompletedAt();
									
									if (joinedAt != null && completedAt != null) {
										Date joinedAtDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").parse(joinedAt);
										Date completedAtDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").parse(completedAt);
										long timeDiff = completedAtDate.getTime() - joinedAtDate.getTime();
										   
										 // Calucalte time difference in seconds  
							            long secDiff = (timeDiff / 1000)% 60;   
							            // Calucalte time difference in minutes  
							            long minDiff = (timeDiff / (1000*60)) % 60;      
							            // Calucalte time difference in hours  
							            long hrDiff = (timeDiff / (1000*60*60)) % 24; 
							         	// Calucalte time difference in days  
							            long dayDiff = (timeDiff / (1000*60*60*24)) % 365;
							         	if (dayDiff>=1) {
							         		duration = ">"+dayDiff;
							         	} else {
							         		duration = String.format("%02d:%02d:%02d", hrDiff, minDiff, secDiff);
							         	}
									}
									String attemptedQsnStr = attemptedQsnCount+"/"+totalQuestion;
									String candidateRowFormated = String.format(candidateRow, rsltCand.getName(), duration, attemptedQsnStr,correctAnswers, scorePerc,rsltCand.getId());
									out.write(candidateRowFormated);
								}
								
								out.write("</body> </table> </form> </div></td></tr>");
								++hostRowCounter;	
						}
						
						%>
						
						</body>
						</div>
					</table>
				</div>
					
				</div>

			</div>

		</div>
	</div>
	<!-- partial -->
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
		<script type="text/javascript">

		function getQuizerBack() {
			window.location.href = "/Quizer";
		}
		</script>
</body>

</html>