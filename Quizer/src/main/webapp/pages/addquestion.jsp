<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quizer</title>
<!-- <link rel="stylesheet" href="quizer.css">
 -->
<script language="javascript" src="Quizer.js"></script>
<style type="text/css">

td {
margin-left: 10%;
}


input {
	text-align: center;
	padding: 8px;
	border-radius: 20px solid red;
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

.button {
	background-color: DodgerBlue;
	color: white;
	border-color: DodgerBlue;
	width: 65px;
	border-radius: 3px;
	margin-left:10%;
	margin-bottom:10%;
	margin-top:7%;
}


 img.background {
      position: absolute;
      left: 0px;
      top: 0px;
      z-index: -1;
      width: 100%;
      height: 100%;
      -webkit-filter: black(5px);
      filter: blur(5px);
      }

.add {
	margin-left: 50%;
}

h1 {
	margin-left: 29%;
}

input {
	margin-left: 25%;
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
	color:white;
	font-size:30px;
}
</style>



</head>
<body>
    <img class="background" src="https://images.shiksha.com/mediadata/images/1616134515phpy6KjFI.jpeg">

	<%@ page import="com.quizer.pojo.*"%>
	<%@ page import="java.util.*"%>
	<%
	out.write("<html>");
	 out.write("<head>");
	 out.write("</head>");
	 out.write("<body>");
	 out.write("<div class='quizColor'>");
	 out.write("<em>");
Quiz quiz = (Quiz)request.getSession().getAttribute("Quiz");  
out.print(quiz.getName()); 
out.write("</em>");
    out.write("</div>");
    out.write("</body>");
    out.write("</html>");
%>
	<div class="validation">
		<form action="addquestion" method="post">
			<table id="answer-options-table" style="width:100%">
				<tr>
					<td style="text-align:right">
						<%
						ArrayList<Question> questionList = quiz.getQuestionList();
						String quetionNumber = "Q";
						if (questionList == null) {
							quetionNumber += "1";
						} else {
							quetionNumber += questionList.size()+1;
						}
						out.print(quetionNumber); 
						%>
					</td>
					<td><input type="text" name="question"	placeholder="Type Quetion Here" class="resizedTextbox" ><br></br>
					</td>
				</tr>
				<tr>
					<td style="text-align:right">
						<input type="radio" name="answer-radio1" >
					</td>
					<td><input type="text" name="answer1" placeholder="Type Answer Here" id="radioErro1" value="" style="margin: auto">
						</div></td>

				</tr>
					<tr>
					<td style="text-align:right">
						<input type="radio" name="answer-radio2" >
					</td>
					<td><input type="text" name="answer2" placeholder="Type Answer Here" id="radioErro1" value="" style="margin: auto">
						</div></td>

				</tr>
				
					</tr>
					<tr>
					<td style="text-align:right">
						<input type="radio" name="answer-radio3" >
					</td>
					<td><input type="text" name="answer3" placeholder="Type Answer Here" id="radioErro1" value="" style="margin: auto">
						</div></td>

				</tr>
				
					</tr>
					<tr>
					<td style="text-align:right">
						<input type="radio" name="answer-radio4" >
					</td>
					<td><input type="text" name="answer4" placeholder="Type Answer Here" id="radioErro1" value="" style="margin: auto">
						</div></td>

				</tr>
				</td>
				</tr>
				</div>		
			</table>
					<input type="submit" name="action-button" value="Next"
						class="button" />

				<input type="submit" name="action-button" value="Done"
					class="button" />
		</form>

		<script type="text/javascript">

	function createOption() {
		alert("Hello");
        var table = document.getElementById("answer-options-table");
        var row = table.insertRow(0);
        var cell1 = row.insertCell(0);
        cell1.outerHTML = "<input type=\"radio\" name=\"answer-radio2\"><input type=\"text\" name=\"answer2\"  placeholder=\"Type Answer Here\" id=\"radioErro1\" value=\"\"><br></br>";
	}
     </script>
</body>
</html>