<%@page import="org.apache.catalina.core.ThreadLocalLeakPreventionListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.button {
	background-color: DodgerBlue;
	color: white;
	border-color: DodgerBlue;
	padding: 10px;
	width: 80px;
	border-radius: 3px;
	margin-left: 40%;
	margin-top: 10%;
}

p1 {
	margin-left: 35%;
	margin-top: 10%;
}

name {
	margin-left: 40%;
	margin-bottom: 30%;
}
</style>
</head>
<body>
	<%@ page import="jakarta.servlet.http.*"%>
	<%@ page import="com.database.*"%>

	<div class="name">
		<div>
			<h1 id='quizeCode'>
				<%
				HttpSession localSession = request.getSession(false);
				String quizCode = (String) localSession.getAttribute("current-quiz-code");
				String quizId = (String) localSession.getAttribute("current-quiz-id");
				QuizHostDAO quizHost = (QuizHostDAO) localSession.getAttribute("HostQuiz");
				boolean isQuizSessionStarted = false;
				boolean triedStartingQuizSession = false;
				Object isQuizSessionStartedObject = localSession.getAttribute("QuizSessionStarted");
				Object 	triedStartingQuizSessionObject = localSession.getAttribute("TriedStartingQuizSession");

				if (isQuizSessionStartedObject != null) {
					isQuizSessionStarted = (boolean) isQuizSessionStartedObject;
				}
				
				if (triedStartingQuizSessionObject != null) {
					triedStartingQuizSession = (boolean) triedStartingQuizSessionObject;
				}
				
				out.write(quizCode);				
				out.write("<br>quize id:"+quizId);
				
				if (isQuizSessionStarted && quizHost != null) {
					out.write("<br>Quiz started at: "+ quizHost.getHostedAt());
				} else if (triedStartingQuizSession){
					out.write("<br> Failed to start Quiz, please retry.");
				}
				%>
			</h1>
			<button onclick="copyElementText('quizeCode')">Copy</button>

		</div>
		<form action="StartQuizServlet" method="POST">
				<input type="submit" name="start-button" value="Start" onClick="myFunction()" class="button" />
		</form>

	</div>
	<script>
		function copyElementText(id) {
			var text = document.getElementById(id).innerText;
			var elem = document.createElement("textarea");
			document.body.appendChild(elem);
			elem.value = text;
			elem.select();
			document.execCommand("copy");
			document.body.removeChild(elem);
		}
	</script>
</body>
</html>