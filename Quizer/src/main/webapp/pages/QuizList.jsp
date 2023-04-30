<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QuizList</title>
<link href="styles/style.css" rel="stylesheet" />
<script type="text/javascript" src="../scripts/jquery.min.js"></script>
</head>

<body>
<form action="PrepareQuizServlet" method="POST">
	<%@ page import="java.util.*"%>
	<%@ page import="com.quizer.service.*"%>
	<%@ page import="com.database.*"%>
	<h1 class="header-center">Quiz Library</h1>
 <%
 ArrayList<QuizDAO> quizList = PersistentHelper.singleton.getQuizList();
 if (quizList == null || quizList.isEmpty()) {
	 out.write("<div class='container-center' style='text-align: center;display: block; color: white;'>");
	 out.write(String.format("<p style='text-align: center;display: block; color: white;'>%s</p>", "Empty Library."));
	 out.write("</div>");
	return;
 }
 
 Iterator<QuizDAO> it = quizList.iterator();

 while (it.hasNext()) {
	 QuizDAO  quiz = it.next();

	 out.write("<div class='container-center-blured-space-between' style=''>");
	 
	 out.write(String.format("<p class='p1'>%s</p><button name=\"start-button\" value=\"%s\" class='button'>Start</button>", quiz.getTitle(), quiz.getId()));
	 out.write("</div>");
 }
%>
</form>
</body>
</html>