<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="styles/style.css" rel="stylesheet" />
</head>
<body>

  <div class="container-center">
	<button class="button" onclick="openForm()">Join</button>

<!-- 	<div class="container-center-form-popup" id="join-quiz-form">
 -->		<form action="#" class="form" id="join-quiz-form">
			<input type="text" placeholder="enter your name" name="quizername"required> 
			<input type="text" placeholder="quize code"name="quizerid" required>	
			<button type="submit" class="button-extended">Join</button>
			<button type="button" class="button-error-extended"
				onclick="closeForm()">Close</button>
		</form>
	</div>
<!--   </div>
 -->	<script>
		function openForm() {
			document.getElementById("join-quiz-form").style.display = "block";
		}

		function closeForm() {
			document.getElementById("join-quiz-form").style.display = "none";
		}
		
	</script>
</body>
</html>
