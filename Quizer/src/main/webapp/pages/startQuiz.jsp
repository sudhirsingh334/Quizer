<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<%@ page import="java.util.*"%>

	<%
	class QuizCodeHelper {
		String generateQuizCode(int len) {
			String numbers = "0123456789";
			Random rndm_method = new Random();

			String quizCode = "";

			for (int i = 0; i < len; i++) {
				quizCode += numbers.charAt(rndm_method.nextInt(numbers.length()));
			}

			return quizCode;
		}
	}
	%>
	<div class="name">
		<div>
			<h1 id='quizeCode'>
				<%
				String code = (new QuizCodeHelper()).generateQuizCode(9);
				out.write(code);
				String quizeId = request.getParameter("start-button");
				
				out.write("quize id:"+quizeId);
				
				%>
			</h1>
			<button onclick="copyElementText('quizeCode')">Copy</button>

		</div>
		<input type="submit" onClick="myFunction()" value="Start"
			class="button" />

	</div>
	<script>
		function myFunction() {
			window.location.href = "new.html";
		}

		function copyElementText(id) {
			var text = document.getElementById(id).innerText;
			var elem = document.createElement("textarea");
			document.body.appendChild(elem);
			elem.value = text;
			elem.select();
			document.execCommand("copy");
			document.body.removeChild(elem);
		}
	</script>

</body>
</html>