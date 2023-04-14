<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Quizer</title>
<!-- <link rel="stylesheet" href="quizer.css">
 -->
<script language="javascript" src="Quizer.js"></script>
<style type="text/css">

body{
	background-image: url(https://images.shiksha.com/mediadata/images/1616134515phpy6KjFI.jpeg);
}
input {
	text-align: center;
	padding: 8px;
	border-radius: 20px solid red;
	margin-left: 10%;
}

.addoptions {
	margin-left: 26%;
	margin-bottom: 3%;
}

.button {
	background-color: DodgerBlue;
	color: white;
	border-color: DodgerBlue;
	width: 65px;
	border-radius: 3px;
	margin-left: 70%;
	margin-bottom: 30%;
}

.nextButton {
	background-color: DodgerBlue;
	color: white;
	border-color: DodgerBlue;
	padding: px;
	width: 0px;
	border-radius: 3px;
	margin-left: 15%;
	margin-bottom: 2%;
	margin-top: 10%;
}

.add {
	margin-left: 40%;
}

h1 {
	margin-left: 29%;
}

input {
	margin-left: 25%;
}
.validation{
            margin-left:37%;
            margin-right: 30%;	
            margin-top:10%;
            margin-bottom:30%;
            border-radius:3px; 
            background-color:lavender;
             opacity:0.8;
             padding: 50px;
             padding-bottom: 1px;
             padding-top: 10px;
             border: 1px solid white;
             
              
             
      
      }
      
      
     .quizColor{
    /*  background-color:lavender; */
    margin-left: 50%;
    margin-top: 3%;
    opacity:0.9;
    font-size:15px;
    color:red;
    font-size: 20px;
      }
</style>



</head>
<body>
	<%@ page import="com.quizer.pojo.*"%>
	<%@ page import="java.util.*"%>
	<%
	out.write("<html>");
	 out.write("<head>");
	 out.write("</head>");
	 out.write("<body>");
	 out.write("<div class='quizColor'>");
Quiz quiz = (Quiz)request.getSession().getAttribute("Quiz");  
out.print("<p1 style='color:Black'>Welcome </p1>,"+quiz.getName()); 
    out.write("</div>");
    out.write("</body>");
    out.write("</html>");
%>
<div class="validation">
	<form action="QuizerAnswerURL" method="post" action="QuizerName.html">
		<div id="container">
			<%
			ArrayList<Question> questionList = quiz.getQuestionList();
			String quetionNumber = "Q";
			if (questionList == null) {
				quetionNumber += "1";
			} else {
				quetionNumber += questionList.size()+1;
			}
			out.print(quetionNumber); 
			%>
			<input type="text" name="question" placeholder="Type Quetion Here"><br></br>

			<div>
				<input type="radio" name="answer-radio1"><input type="text" name="answer1"  placeholder="Type Answer Here" id="radioErro1" value=""><br></br>
				<input type="radio" name="answer-radio2"><input type="text" name="answer2"  placeholder="Type Answer Here" id="radioErro1" value=""><br></br>
				
				<div class="add">
					<a href="#" onClick="return addoptions(this)">+Add Option</a>
				</div>

			</div>
		</div>

		<div class="nextButton">
			<input type="submit" name="action-button" value="Next" class="button" />
		</div>

		<input type="submit" name="action-button" value="Done" class="button" />
	</form>
	</div>
</body>
</html>