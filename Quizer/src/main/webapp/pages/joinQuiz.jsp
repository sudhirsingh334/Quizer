<%@page import="com.quizer.service.PersistentHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"rel="icon" class="headericon">
    <meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="styles/style.css" rel="stylesheet" />
<script language="javascript" src="../scripts/Quizervalidator.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	
<script>
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"
	integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<Style>
img.background {
	position: absolute;
	left: 0px;
	top: 0px;
	z-index: -1;
	width: 100%;
	height: 100%;
	-webkit-filter: black(5px);
	filter: blur(5px);
}

.input-container {
	display: -ms-flexbox;
	display: flex;
	width: 100%;
	margin-bottom: 10px;
}

.icon {
	padding: 10px;
	height: 25px;
	background: dodgerblue;
	color: white;
	min-width: 20px;
	text-align: center;
	margin-top: 90x;
	margin-left: 10%;
	height: 34px;
}

.avatar {
	height: 100px;
	border-radius: 50%;
	margin-top: -17%;
	margin-bottom: 10%;
	background-color: white;
	border-radius: none;
}

.form-container{
	border-radius: 10px;
	padding: 30px;
		
		display: none;
	background-color: lightblue;
	margin: auto;
	width: 25%;
	position: absolute;
	left: 40%;
	margin-top:5%;
	margin-bottom: 10px;

	border-radius: 2px solid red;
	padding: 1%;
	
}

 
</Style>
</head>


<body>
<%@ page import="com.quizer.pojo.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="com.database.*"%>
	<%@ page import="com.quizer.utilities.*" %>
	<%
	response.setContentType("text/html");
	Object userTriedToJoin  = session.getAttribute("User-Tried-To-Join");

	if (userTriedToJoin != null) {
		boolean userTried = (boolean) userTriedToJoin;

		if (userTried == true) {
			//fetch Quiz Host from session
			QuizHostDAO  quizHost = (QuizHostDAO) session.getAttribute("QuizHost");

			if (quizHost != null) {
				//Fetch Quiz
				Quiz quiz = PersistentHelper.singleton.getQuizById(quizHost.getQuizId());
				
				if (quiz == null) {
					session.setAttribute("User-Tried-To-Join", false);
					session.setAttribute("QuizHost", null);
					Alert.show("something went wrong. please contact the admin.", out);
					return;
				} 
				
				session.setAttribute("Quiz", quiz);
				
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
	}
	%>
	
	
	 <section class="container-fluid">
     <section class="row justify-content-center">
      <section class="col-12 col-sm-6 col-md-4">
	
	<div class="container-center">
		<button class="button" onclick="openForm()">Join</button>


		<form  class="form-container" name="f1" action="QuizerManager" method="post" class="form" id="join-quiz-form" onsubmit="return quizerValidator()">
		 <div class="form-group">
			<img src="https://cdn-icons-png.flaticon.com/128/6807/6807025.png"alt="Avatar" class="avatar">
				
		<div class="input-container"><i class="fa fa-user icon"></i> <input type="text"	placeholder="enter your name" name="quizername"><br></br>
				<span id="validatorQuizerNameError" style="color:palevioletred"></span><br></br>
			</div>
			<div class="input-container">
				<i class="fa fa-key icon"></i> 
					<input type="text" placeholder="enter quiz code" name="QuizCode"><br></br> <span
					id="validatorQuizerIdError" style="color:palevioletred"></span><br></br>
			</div>

			<button type="submit" class="button-extended" name="QuizerManager-Button" value="Join-Quiz">Join</button>
				
			<button type="button" class="button-error-extended"
				onclick="closeForm()">Close</button>
        </div>

		</form>
		</div>
		 </section>
    </section>
  </section>
  
	
	
	
	
	
	
	 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
  </body>
</html>
