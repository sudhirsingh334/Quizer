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
	<%
	out.write("<html>");
	out.write("<head>");
	out.write("</head>");
	out.write("<body>");
	out.write("<div class='container-center'>");
	out.write("<h1 class='header-center'>");
	Quiz quiz = (Quiz) request.getSession().getAttribute("Quiz");
	out.print(quiz.getName());
	out.write("</h1>");
	out.write("</div>");
	out.write("</body>");
	out.write("</html>");
	%>
	<div class="validation">
		<form action="" method="post" name="completeQuizRedirect"
			id="completeQuizRedirect">
			<table id="answer-options-table" style="width: 100%">
				<tr>
					<td style="text-align: right">
						<%
						ArrayList<Question> questionList = quiz.getQuestionList();
						String quetionNumber = "Q";
						if (questionList == null) {
							quetionNumber += "1";
						} else {
							quetionNumber += questionList.size() + 1;
						}
						out.print(quetionNumber);
						%>
					</td>
					<td><input type="text" name="question"
						placeholder="Type Quetion Here" class="resizedTextbox"><br></br>
					</td>
				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-radio1"></td>
					<td><input type="text" name="answer1"
						placeholder="Type Answer Here" id="radioErro1" value=""
						style="margin: auto">
						</div></td>

				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-radio2"></td>
					<td><input type="text" name="answer2"
						placeholder="Type Answer Here" id="radioErro1" value=""
						style="margin: auto">
						</div></td>

				</tr>

				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-radio3"></td>
					<td><input type="text" name="answer3"
						placeholder="Type Answer Here" id="radioErro1" value=""
						style="margin: auto">
						</div></td>

				</tr>

				</tr>
				<tr>
					<td style="text-align: right"><input type="radio"
						name="answer-radio4"></td>
					<td><input type="text" name="answer4"
						placeholder="Type Answer Here" id="radioErro1" value=""
						style="margin: auto">
						</div></td>

				</tr>
				</td>
				</tr>
				</div>
			</table>
			<div class='container-center'>
				<input type="submit" name="action-button" value="Next"
					class="button" /> <input type="submit" name="action-button"
					onclick="javascript:completeAndRedirect();" value="Done"
					class="button" />
			</div>
		</form>

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
		</script>
</body>
</html>