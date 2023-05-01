<%@page import="com.quizer.service.PersistentHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"required
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="styles/style.css" rel="stylesheet" />
<script language="javascript" src="../scripts/Quizervalidator.js"></script>
    <link href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"rel="icon" class="headericon">

</head>
<body>
	<%@ page import="com.quizer.pojo.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="com.database.*"%>
	<%@ page import="com.quizer.utilities.*"%>
	<%@ page import="com.quiz.dto.*"%>
	<%
	response.setContentType("text/html");
	Object userTriedToJoin = session.getAttribute("User-Tried-To-Join");

	if (userTriedToJoin != null) {
		boolean userTried = (boolean) userTriedToJoin;

		if (userTried == true) {
			//fetch Quiz Host from session
			CandidateDTO candidate = (CandidateDTO) session.getAttribute("CandidateDTO");

			if (candidate == null) {
		session.setAttribute("User-Tried-To-Join", false);
		Alert.show("something went wrong. please contact the admin.", out);
		return;
			}

			out.println("<script type=\"text/javascript\">");
			out.println("location='quizerQuestion.jsp';");
			out.println("</script>");
		} else {
			session.setAttribute("User-Tried-To-Join", false);
			session.setAttribute("QuizHost", null);
			//QuizHost not available with supllied quiz code.
			Alert.show("Invalid quiz code. Please contact the admin.", out);
		}
	}
	%>
	<div class="container-center">
		<form class="form-container" name="f1" action="QuizerManager"
			method="post" class="form" id="join-quiz-form"
			onsubmit="return quizerValidator()">
			<div class="form-group">

				<div class="container-center,">
					<input type="text" placeholder="Your Name" name="quizername" required><br></br>
				</div>

				<div class="container-center">
					<input type="text" placeholder="Quiz PIN" name="QuizCode" required><br></br>
				</div>
				<button type="submit" class="button-extended"
					name="QuizerManager-Button" value="Join-Quiz">Join</button>

				<button type="button" class="button-error-extended"
					onclick="openHomePage()">Close</button>
			</div>

		</form>
	</div>
	<script type="text/javascript">
		function openHomePage() {
			location = '/Quizer';
		}
	</script>
</body>
</html>
