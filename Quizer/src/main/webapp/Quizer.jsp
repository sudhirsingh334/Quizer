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
input {
	text-align: center;
	padding: 8px;
	border-radius: 2px solid red;
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
	margin-left: 40%;
	margin-bottom: 40%;
}

.nextButton {
	background-color: DodgerBlue;
	color: white;
	border-color: DodgerBlue;
	padding: px;
	width: 0px;
	border-radius: 3px;
	margin-left: 20%;
	margin-bottom: -2%;
}

.add {
	margin-left: 40%;
}

h1 {
	margin-left: 29%;
}

input {
	margin-left: 25%;
}
</style>



</head>
<body>
<%@ page import="com.quizer.pojo.*"%>
<%@ page import="java.util.*"%>
<%
Quiz quiz = (Quiz)request.getSession().getAttribute("Quiz");  
out.print("welcome "+quiz.getName());  
%>
	<form action="QuizerAnswerURL" method="post" action="QuizerName.html">
		<div id="container">
			<%
			ArrayList<Question> questionList = quiz.getQuestionList();
			String quetionNumber = "Q";
			if (questionList == null) {
				quetionNumber += "1";
			} else {
				quetionNumber += questionList.size()+1;
			}
			out.print(quetionNumber); 
		/* 	out.print("Q"+quiz.getQuestionList().size()+1);   */
			%>
			<input type="text" name="question" placeholder="Type Quetion Here"><br></br>

			<div>
				<input type="text" name="ans" id="radioErro1" value="OPtion1">Option1<br></br>
				<div class="add">
					<a href="#" onClick="return addoptions(this)">+Add Option</a>
				</div>

			</div>
		</div>

		<div class="nextButton">
			<input type="submit" name="action-button" value="Next" class="button" />
		</div>

		<input type="submit" name="action-button" value="Done" class="button" />
	</form>





</body>
</html>