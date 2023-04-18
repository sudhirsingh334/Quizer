<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Quizer</title>
<link href="styles/style.css" rel="stylesheet" />
<script language="javascript" src="../scripts/validator.js"></script>
</head>

<body>
	<div class="container-center">
		<h1 class="header-center">Create Quiz</h1>

		<form action="quizmanager" method="post"
			onsubmit="return validateQuizName(this)">
			<input type="text" name="quizname" placeholder="quize name"><br>
			<span id="quizerError" style="color: red"><%=request.getAttribute("ERRORMESSAGE") != null ?  request.getAttribute("ERRORMESSAGE"):""%></span><br>
			<a href="#"> <input type="submit" class="button" value="Submit"></a>
		</form>
	</div>
</body>
</html>