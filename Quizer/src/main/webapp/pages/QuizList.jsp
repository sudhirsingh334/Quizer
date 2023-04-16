<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuizList</title>
<style type="text/css">
body{
background-image: url(https://www.collegedekho.com/_next/image?url=https%3A%2F%2Fimg.collegedekhocdn.com%2Fmedia%2Fimg%2Finstitute%2Fcrawled_images%2Fadmmvnelkwve.jpg&w=640&q=75);
}
button {
	background-color: DodgerBlue;
	color: white;
	border-color: DodgerBlue;
	padding: 10px;
	width: 80px;
	border-radius: 3px;
	margin-left: 40%;
	margin-top:5%;
	text-align: center;
}

p1 {
	margin-left: 20%;
	margin-bottom: 30%;
	margin-top: 20%;
}
.quizeListColor{
background-color:lavender;
opacity:0.9;
font-size:15px;
/* border-radius:10px;  */
margin-left: 15%;  
margin-right: 150px;
margin-top:1%;
text-align: ;
font-weight:10px;
}
h1{
color:white;
margin-left: 38%;
}
</style>
</head>

<body>
	<%@ page import="java.util.*"%>
	<%@ page import="com.quizer.service.*"%>
	<%@ page import="com.database.*"%>
	<h1>Welcom to The Quiz List</h1>
 <%
 ArrayList<QuizDAO> quizList = PersistentHelper.singleton.getQuizList();
 Iterator<QuizDAO> it = quizList.iterator();
 
 while (it.hasNext()) {
	 QuizDAO  quiz = it.next();
	
	 out.write("<html>");
	 out.write("<head>");
	 out.write("</head>");
	 out.write("<body>");
	 out.write("<div class='quizeListColor'>");
	 
	 out.write(String.format("<p1 style='color:none'>%s</p1><button name=\"start-button\" value=\"%s\" onclick=\"window.location.href = 'startQuiz.jsp';\">Start</button><br></br><br></br>", quiz.getTitle(), quiz.getId()));
	 out.write("</div>");
	 out.write("</body>");
	 out.write("</html>");
 }
%>
</body>
</html>