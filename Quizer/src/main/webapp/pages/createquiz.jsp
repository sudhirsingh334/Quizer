<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Quizer</title>
<link href="styles/style.css" rel="stylesheet" />
<script language="javascript" src="../scripts/validator.js"></script>
    <link href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"rel="icon" class="headericon">
    <meta name="viewport" 
              content="width=device-width,
                       initial-scale=1" />
<link rel="stylesheet"required
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="styles/style.css" rel="stylesheet" />

<script language="javascript" src="../scripts/Quizervalidator.js"></script>
<link href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"rel="icon" class="headericon">

    

</head>

<body>
	<div class="container-center" style="margin-top:10%;">
		<h1 class="header-center">Create Quiz</h1>

		<form action="quizmanager" method="post"
			onsubmit="return validateQuizName(this)" style="margin-top:5%;">
			<input type="text" name="quizname" placeholder="quize name"><br><br>
			<span id="quizerError" style="color: palevioletred"><%=request.getAttribute("ERRORMESSAGE") != null ?  request.getAttribute("ERRORMESSAGE"):""%></span><br>
			<a href="#"> <input type="submit" class="button" value="Submit"></a>
		</form>
	</div>
</body>
</html>