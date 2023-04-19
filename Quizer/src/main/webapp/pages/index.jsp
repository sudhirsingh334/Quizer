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
	<div class="container-center">
		<div class="container-center">
			<img alt="" src="assets/quizer-white-XS.png" style="width: 1200px;"/>
		</div>
		<input type="submit" onClick="openCreateQuizPage()"
			value="Create Quiz" class="button" /> <input type="submit"
			onClick="openQuizListPage()" value="Show Quizes" class="button" />
	</div>
	<script>
		function openCreateQuizPage() {
			window.location.href = "pages/createquiz.jsp";
		}

		function openQuizListPage() {
			window.location.href = "pages/QuizList.jsp";
		}
	</script>
</body>
</html>