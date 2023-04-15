<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

.form-popup {
	display: none;
	border: 1px solid white;
	z-index: 1;
	margin: auto;
	margin-top: 5%;
	color: white;
	border-radius: 3px;
}

.form-container {
	max-width: 300px;
	padding: 10px;
	background-color: #20B2AA;
}

.form-container input[type=text], .form-container input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	border: none;
	background: white;
}

.form-container input[type=text]:focus, .form-container input[type=password]:focus
	{
	background-color: #ddd;
	outline: none;
}

.theme_blue_button {
	background-color: blue;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
	border-radius: 4px;
}

 .theme_blue_button_cancel {
	background-color: red;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
	border-radius: 4px;
}

.form-container .theme_blue_button:hover, .open-button:hover {
	opacity: 1;
}
</style>
</head>
<body>

	<button class="theme_blue_button" onclick="openForm()">Join</button>

	<div class="form-popup" id="join-quiz-form">
		<form action="/action_page.php" class="form-container">
			<input type="text" placeholder="enter your name" name="quizername"
				required> <input type="text" placeholder="quize name"
				name="quizerid" required>
			<button type="submit" class="theme_blue_button">Join</button>
			<button type="button" class="theme_blue_button_cancel" onclick="closeForm()">Close</button>
		</form>
	</div>

	<script>
function openForm() {
  document.getElementById("join-quiz-form").style.display = "block";
}

function closeForm() {
  document.getElementById("join-quiz-form").style.display = "none";
}
</script>

</body>
</html>
