<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Quizer</title>
<link rel="stylesheet" href="#">
<script language="javascript" src="CheckInputValidation.js"></script>

<style type="text/css">
body{
	background-image: url(https://www.nshm.com/wp-content/uploads/2021/04/bba01.jpg);
}

h1{
  margin-left:20%;
  margin-top:10%;
  margin-bottom: 1%;
  color:green;

}
 input {
        text-align: center;
          padding:8px;
          border-radius:2px solid red; 
          widows: 30px;
          margin-left: 22%;
          margin-top: 25%;
          
      }
      .button{
      background-color:DodgerBlue;
      color:white;
      border-color: DodgerBlue;
      padding:10px;
      width: 80px;
      border-radius:3px; 
      margin-left:42%;
      margin-bottom:60%;
      margin-top:5%;
      padding-bottom: 10px;
      }
      .validation{
            margin-left:37%;
            margin-right: 30%;	
            margin-top:10%;
            margin-bottom:30%;
            border-radius:3px; 
            background-color:lavender;
             opacity:0.9;
             padding: 50px;
             padding-bottom: 1px;
             padding-top: 10px;
             border: 1px solid white;
      
      }
</style>

</head>

<body>
<div class="validation">
	<h1><em>Welcome to Quizer</em></h1>
	
	<form action="quizmanager" method="post" onsubmit="return validate(this)">
			    <input type="text" name="quizname" placeholder="quize name"><br>
			    <span id="quizerError" style="color: red"><%=request.getAttribute("ERRORMESSAGE") != null ?  request.getAttribute("ERRORMESSAGE"):""%></span><br> <a href="#">
				<input type="submit" class="button" value="Submit"></a>
	</form>
	</div>
</body>
</html>