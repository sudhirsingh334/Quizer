<%@page
	import="org.apache.catalina.core.ThreadLocalLeakPreventionListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Start Quiz</title>
<link href="styles/style.css" rel="stylesheet" />
</head>
<body>
	<%@ page import="jakarta.servlet.http.*"%>
	<%@ page import="com.database.*"%>
	<div class=container-center>
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
					out.write("<div class='container-center-blured' style='margin-top:100px;'>");

					out.write("<div class='container-center'>");
					out.write("<span id='timelapse'></span>");
					out.write("</div>");
					
					out.write("<div class='container-center'>");
					out.write("<span id='quizeCode' style='font-size: 250%; background: #ff0000;'>"+quizHost.getQuizCode()+ "</span><button onclick=\"copyElementText('quizeCode')\">Copy</button>");
					out.write("</div>");
					out.write("</div>");

				}
				
				out.write("<div class='container-center-blured'>");
				out.write("<form action=\"StartQuizServlet\" method=\"POST\">");
				if (quizHost.getState() == QuizHostState.NotStarted) {
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Start\" onClick=\"myFunction()\" class=\"button\"/>");
				} else if (quizHost.getState() == QuizHostState.Started || quizHost.getState() == QuizHostState.Resumed){
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Pause\" onClick=\"myFunction()\" class=\"button\"/>");
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Stop\" onClick=\"myFunction()\" class=\"button-error\"/>");
				} else if (quizHost.getState() == QuizHostState.Paused) {
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Resume\" onClick=\"myFunction()\" class=\"button\"/>");
					out.write("<input type=\"submit\" name=\"quiz-start-button\" value=\"Stop\" onClick=\"myFunction()\" class=\"button-error\"/>");
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
      var startTimeString = '<%=quizHost.getHostedAt()%>';
      
      if (startTimeString.length === 0) {
    	  document.getElementById("timelapse").innerHTML = '00:00:00';
    	  return;
      }
      
      var startDateString = '<%=quizHost.getHostedAt()%>';
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
</body>
</html>