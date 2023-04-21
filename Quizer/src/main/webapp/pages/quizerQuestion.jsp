<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quizer</title>
<link href="styles/style.css" rel="stylesheet" />
<script language="javascript" src="Quizer.js"></script>
<!-- <script language="javascript" src="../scripts/Quizervalidator.js"></script>
 -->
<style type="text/css">
td {
	margin-left: 10%;
}

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
	border-radius: 3px;
	background-color: lavender;
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
</style>



</head>
<body>
	<%@ page import="com.quizer.pojo.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="com.quizer.utilities.*"%>

	<%
	Quiz quiz = (Quiz) session.getAttribute("Quiz");
	if (quiz == null) {
		session.setAttribute("User-Tried-To-Join", false);
		session.setAttribute("QuizHost", null);
		Alert.show("Something went wrong, please restart the quiz or contact the admin.", out);
		return;
	}

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
	out.print(quiz.getName());
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
					<td style="text-align: right">
						<%
						System.out.println("b 	:" + qsnPointer + "seesion id: " + session.getId());

						ArrayList<Question> questionList = quiz.getQuestionList();
						Question question = questionList.get(qsnPointer);
						ArrayList<Answer> answerList = question.getAnswers();
						String quetionNumber = "Q" + (qsnPointer + 1);
						out.print(quetionNumber);

						//Should hide next button
						String nextButtonStatus = (qsnPointer == (questionList.size() - 1)) ? "none" : "block";
						//should hide back button
						String prevButtonStatus = (qsnPointer == 0) ? "none" : "block";
						%>
					</td>
					<td><input type="text" name="question"
						placeholder="Type Quetion Here" class="resizedTextbox"
						value="<%out.write(question.getTitle());%>" readonly><br></br>
					</td>
				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-radio1"></td>
					<td><input type="text" name="answer1"
						placeholder="Type Answer Here" id="radioErro1"
						style="margin: auto"
						value="<%out.write(answerList.get(0).getTitle());%>" readonly>
						</div></td>

				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-radio2"></td>
					<td><input type="text" name="answer2"
						placeholder="Type Answer Here" id="radioErro1"
						value="<%out.write(answerList.get(1).getTitle());%>" readonly
						style="margin: auto">
						</div></td>

				</tr>

				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-radio3"></td>
					<td><input type="text" name="answer3"
						placeholder="Type Answer Here" id="radioErro1"
						value="<%out.write(answerList.get(2).getTitle());%>" readonly
						style="margin: auto">
						</div></td>

				</tr>

				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-radio4"></td>
					<td><input type="text" name="answer4"
						placeholder="Type Answer Here" id="radioErro1"
						value="<%out.write(answerList.get(3).getTitle());%>" readonly
						style="margin: auto">
						</div></td>

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
					onclick="completeAndRedirect();" value="Quiz-Done">Done</Button>
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
			document.getElementById("completeQuizRedirect").action = "addquestion";
			document.getElementById("completeQuizRedirect").submit();
		} else {
			return false;
		}
	}

<%-- 	function showPrevQuetion() {
		alert(
<%=qsnPointer%>
	)
		var qsnPTR =
<%=qsnPointer%>
	;
		var qsnCount =
<%=questionList.size()%>
	;

		if (qsnPTR > 0) {
			var save =
<%=questionList.size()%>
	;
			alert("saved<");
		}
		window.location.reload();
	}

	function showNextQuetion() {
		alert(
<%=session.getAttribute("QuestionPointer")%>
	)
		alert(
<%=qsnPointer%>
	)
		var qsnPTR =
<%=qsnPointer%>
	;
		var qsnCount =
<%=QuestionPointer.decrease(session)%>
	;

		if (qsnPTR < (qsnCount - 1)) {
			var save =
<%=QuestionPointer.increase(session)%>
	;
		}

		window.location.reload();
	} --%>
</script>
</html>