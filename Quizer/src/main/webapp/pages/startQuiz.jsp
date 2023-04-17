<%@page import="org.apache.catalina.core.ThreadLocalLeakPreventionListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start Quiz</title>
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
 <span id="timelapse"></span>
  <span id="abc">hello</span>
  <span id="test"></span>
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
		
		//timestamp
		var startDate = new Date();
           var myVar=setInterval(function () {myTimer()}, 1000);
           var counter = 0;

   function myTimer() {
      var date = new Date();
      var diff = date-startDate;
      var myvar = '<%=quizCode%>';

      var duration = diff/1000;//in seconds
    
      var hrs = duration/3600;
      var mins = (duration%3600)/60;//in min
      var secs = (duration%3600)%60;

      var timelapse = padZero(Math.floor(hrs)) + ":" + padZero(Math.floor(mins)) + ":" + padZero(Math.round(secs));
      document.getElementById("timelapse").innerHTML = timelapse;
      document.getElementById("test").innerHTML = myvar;
}

     function padZero(number){
         let result = number.toString().padStart(2, '0');
         return result;
}
	</script>
</body>
</html>