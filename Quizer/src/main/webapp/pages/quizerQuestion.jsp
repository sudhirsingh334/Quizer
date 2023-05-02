<%@page import="com.quiz.dto.CandidateDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="styles/style.css" rel="stylesheet" />
<script language="javascript" src="Quizer.js"></script>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.8.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  

<title>Quizer</title>
    <link href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"rel="icon" class="headericon">


<style type="text/css">
.radioLeft {
	text-align: left;
	display: inline;
}

.resizedTextbox {
	width: 95%;
	height: 60px;
	margin: auto;
}

.addoptions {
	margin-left: 26%;
	margin-bottom: 3%;
}

.add {
	margin-left: 50%;
}

.validation {
	margin-left: 5%;
	margin-right: 5%;
	margin-top: 5%;
	margin-bottom: 5%;
	background-color: white;
	opacity: 0.8;
	padding: 50px;
	padding-bottom: 1px;
	padding-top: 10px;
	border: 1px solid white;
}

.quizColor {
	margin-left: 40%;
	margin-top: 4%;
	opacity: 0.9;
	font-size: 15px;
	color: white;
	font-size: 30px;
}

.timedate {
	color: white;
	margin-left:70%;
	
}

</style>
</head>
<body>
	<h1 id="timelapse" class="timedate"></h1>

	<%@ page import="com.quizer.pojo.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="com.quizer.utilities.*"%>
	<%@ page import="com.database.*"%>
	<%@ page import="com.quiz.dto.*"%>

	<%
	CandidateDTO candidate = (CandidateDTO) session.getAttribute("CandidateDTO");

	if (candidate == null) {
		session.setAttribute("User-Tried-To-Join", false);
		session.setAttribute("QuizHost", null);
		Alert.show("Something went wrong, please restart the quiz or contact the admin.", out);
		return;
	}

	QuizDTO quiz = candidate.getQuiz();

	Integer qsnPointer = (Integer) session.getAttribute("QuestionPointer");

	if (qsnPointer == null) {
		qsnPointer = 0;
		session.setAttribute("QuestionPointer", qsnPointer);
	}

	System.out.println("\na	:" + qsnPointer + "seesion id: " + session.getId());

	out.write("<html>");
	out.write("<head>");
	out.write("</head>");
	out.write("<body>");
	out.write("<div class='container-center'>");
	out.write("<h1 class='header-center'>");
	out.write("<em>");
	out.print(quiz.getName());
	out.write("</em>");
	out.write("</h1>");
	out.write("</div>");
	out.write("</body>");
	out.write("</html>");
	%>

	<div class="validation">
	
	
		<form action="QuizerManager" method="post" name="completeQuizRedirect"
		
			id="completeQuizRedirect">

			<table id="answer-options-table" style="width: 100%">
				<tr>
					<td style="width:5%">
						<%
						System.out.println("b 	:" + qsnPointer + "seesion id: " + session.getId());

						ArrayList<CandidateQuestionDTO> questionList = quiz.getCondidateQuestionDTOList();

						CandidateQuestionDTO question = questionList.get(qsnPointer);

						ArrayList<AnswerDTO> answerList = question.getAnswerDTOList();

						AnswerDTO selectedAnswer = question.getSelectedAnswerDTO();

						String quetionNumber = String.format("%02d", (qsnPointer + 1)) + ".";
						out.write(String.format("<p class='text-large' style='text-align:right'>%s</p>", quetionNumber));

						//Should hide next button
						String nextButtonStatus = (qsnPointer == (questionList.size() - 1)) ? "none" : "block";
						//should hide back button
						String prevButtonStatus = (qsnPointer == 0) ? "none" : "block";
						%>
					</td>
					<td><p class="text-large">
							<%out.write(question.getTitle());%>
						</p></td>
				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-option" id="0" value="0"
						<%if (selectedAnswer != null && answerList.get(0).getId().equalsIgnoreCase(selectedAnswer.getId())) {
	out.write("checked");
}%>></td>
					<td><p class="text-medium" style="margin: auto">
							<%out.write(answerList.get(0).getTitle());%>
						</p></td>

				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-option" id="1" value="1"
						<%if (selectedAnswer != null && answerList.get(1).getId().equalsIgnoreCase(selectedAnswer.getId())) {
	out.write("checked");
}%>>
					</td>

					<td><p class="text-medium" style="margin: auto">
							<%out.write(answerList.get(1).getTitle());%>
						</p></td>

				</tr>

				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-option" id="2" value="2"
						<%if (selectedAnswer != null && answerList.get(2).getId().equalsIgnoreCase(selectedAnswer.getId())) {
	out.write("checked");
}%>>
					</td>
					<td><p class="text-medium" style="margin: auto">
							<%out.write(answerList.get(2).getTitle());%>
						</p></td>

				</tr>

				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-option" id="3" value="3"
						<%if (selectedAnswer != null && answerList.get(3).getId().equalsIgnoreCase(selectedAnswer.getId())) {
	out.write("checked");
}%>>
					</td>
					<td><p class="text-medium" style="margin: auto">
							<%out.write(answerList.get(3).getTitle());%>
						</p></td>

				</tr>
				</td>
				</tr>
				</div>
			</table>
			<div class='container-center'>
				<Button type="submit" name="QuizerManager-Button"
					value="Quiz-Question-Back" class="button"
					style="display: <%out.write(prevButtonStatus);%>">Back</Button>


				<Button type="submit" name="QuizerManager-Button"
					value="Quiz-Question-Next" class="button"
					style="display: <%out.write(nextButtonStatus);%>">Next</Button>
				<Button class="button" type="submit" name="QuizerManager-Button"
					onclick="completeAndRedirect();" value="Quiz-Done"
					style="color: white; margin-left: 50%">Done</Button>

			</div>
		</form>
	</div>

</body>
<script type="text/javascript">
	function createOption() {
		var table = document.getElementById("answer-options-table");
		var row = table.insertRow(0);
		var cell1 = row.insertCell(0);
		cell1.outerHTML = "<input type=\"radio\" name=\"answer-radio2\"><input type=\"text\" name=\"answer2\"  placeholder=\"Type Answer Here\" id=\"radioErro1\" value=\"\"><br></br>";
	}

	function completeAndRedirect() {
		var completeQuiz = confirm("Do you want to Complete the quiz ?");
		if (completeQuiz == true) {
			document.getElementById("completeQuizRedirect").action = "QuizerManager";
			document.getElementById("completeQuizRedirect").submit();
		} else {
			return false;
		}
	}
	
    var startDateString = '<%=candidate.getJoinedAt()%>';
	var myVar=setInterval(function () {myTimer()}, 1000);
	var counter = 0;

	   function myTimer() {      
	      if (startDateString.length === 0) {
	    	  document.getElementById("timelapse").innerHTML = '00:00:00';
	    	  return;
	      }
	      
	      var startDate = new Date(startDateString);
	      var currentDate = new Date();
	      var diff = currentDate-startDate;
	      
	      var duration = diff/1000;//in seconds
	    
	      var hrs = duration/3600;
	      var mins = (duration%3600)/60;//in min
	      var secs = (duration%3600)%60;

	      var timelapse = padZero(Math.floor(hrs)) + ":" + padZero(Math.floor(mins)) + ":" + padZero(Math.round(secs));
	      document.getElementById("timelapse").innerHTML = timelapse;
	}

	     function padZero(number){
	         let result = number.toString().padStart(2, '0');
	         return result;
	}
</script>
</html>