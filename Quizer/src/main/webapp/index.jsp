<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body{
background-image: url("https://www.ltjss.net/images/college-list/pcenagpur.jpg");
}
.button{
      background-color:DodgerBlue;
      color:white;
      border-color: DodgerBlue;
      padding:10px;
      width: 100px;
      border-radius:3px; 
      margin-left:30%;
      margin-bottom:0%;
      margin-top:20%;
      padding-bottom: 10px;
      } 
</style>
<title>Quizer</title>
</head>
<body>
 
 
<input type="submit" onClick="openCreateQuizPage()" value="Create Quiz"class="button" />
<input type="submit" onClick="openQuizListPage()" value="Show Quizes"class="button" />

	<script>
    function openCreateQuizPage() {
      window.location.href = "login.html";
    }
    
    function openQuizListPage() {
        window.location.href = "QuizList.jsp";
      }
  </script>
</body>
</html>