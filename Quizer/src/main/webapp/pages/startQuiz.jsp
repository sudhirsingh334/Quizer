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
	<%@ page import="jakarta.servlet.http.*"%>
	<%@ page import="com.database.*"%>
	<div class="name">
				<%
				HttpSession localSession = request.getSession(false);
				if (localSession == null) {
					response.getWriter().print(
							"Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
					return;
				}
				
				QuizHostDAO quizHost = (QuizHostDAO) localSession.getAttribute("HostQuiz");

				if (localSession == null || quizHost == null) {
					response.getWriter().print(
							"Session expired. <a href='login.html'><input type='submit'class='button' value='Submit'>Click here to restart.</a>");
					return;
				}
				
				if (quizHost.getState() != QuizHostState.Stopped) {
					out.write("<div>");
					out.write("<span id='timelapse'></span>");
					out.write("</div>");
					
					out.write("<div>");
					out.write("<h1 id='quizeCode'>"+quizHost.getQuizCode()+ "</h1>");
					out.write("<button onclick=\"copyElementText('quizeCode')\">Copy</button>");
					out.write("</div>");
				}
				
				out.write("<div>");
				out.write("<form action=\"StartQuizServlet\" method=\"POST\">");
				if (quizHost.getState() == QuizHostState.NotStarted) {
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Start\" onClick=\"myFunction()\" class=\"button\"/>");
				} else if (quizHost.getState() == QuizHostState.Started || quizHost.getState() == QuizHostState.Resumed){
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Pause\" onClick=\"myFunction()\" class=\"button\"/>");
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Stop\" onClick=\"myFunction()\" class=\"button\"/>");
				} else if (quizHost.getState() == QuizHostState.Paused) {
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Resume\" onClick=\"myFunction()\" class=\"button\"/>");
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Stop\" onClick=\"myFunction()\" class=\"button\"/>");
				} else if (quizHost.getState() == QuizHostState.Stopped) {
					out.write("<h1>Quiz Completed successfully.</h1>");
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Show Result\" onClick=\"myFunction()\" class=\"button\"/>");
				}
				out.write("</form>");
				out.write("</div>");
				%>
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
      var myvar = '<%=quizHost.getHostedAt()%>';

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
</body>
</html>