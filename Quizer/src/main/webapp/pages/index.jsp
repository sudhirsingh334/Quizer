<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quizer</title>
<link href="pages/styles/style.css" rel="stylesheet" />
</head>
<body>
	<div class="container-center" style="margin-top:10%;">
		<div class="container-center">
			<img alt="" src="assets/quizer-white-XS.png" style="width:1200px;margin-left:36%; margin-bottom:5%;"/>
		</div>
		<input type="submit" onClick="openCreateQuizPage()"
			value="Create Quiz" class="button" /> <input type="submit"
			onClick="openQuizListPage()" value="Show Quizes" class="button" />
	</div>
	<script>
		function openCreateQuizPage() {
			window.location.href = "pages/createquiz.jsp";
		}completeQuizRedirect

		function openQuizListPage() {
			window.location.href = "pages/QuizList.jsp";
		}
	</script>
</body>
</html>