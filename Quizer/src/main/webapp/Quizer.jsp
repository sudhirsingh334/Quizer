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
  input {
        text-align: center;
          padding:8px;
          border-radius:2px solid red; 
          
          
      }
      .addoptions{
      margin-left:26%;
      margin-bottom:3%;
      }	
 
  .button{
      background-color:DodgerBlue;
      color:white;
      border-color: DodgerBlue;
      padding:10px;
      width: 80px;
      border-radius:3px; 
      margin-left:40%;
      margin-bottom:40%;
      }
      .nextButton{
       background-color:DodgerBlue;
      color:white;
      border-color: DodgerBlue;
      padding:10px;
      width:70px;
      border-radius:3px; 
      margin-left:20%;
      margin-bottom:-2%;
      }
      .add{
            margin-left:40%;
      
      }
	
h1{
  margin-left:29%;

}
input{
  margin-left:25%;

}
 </style>
 
 
 
</head>
<body>
<%
String name=(String)request.getAttribute("quizerName");  
out.print("welcome "+name);  
%> 

<form action="QuizerAnswerURL" method="post" onsubmit="return validate(this)">
<div id="container">
<input type="text"name="question"placeholder="Type here question here"><br></br>

   <div>
 <input type="radio" name = "ans" id="radioErro1"value="OPtion1">Option1<br></br>
       <input type="radio" name = "ans" id="radioErro2"value="OPtion2"> Option2<br></br>
       <input type="radio" name = "ans" id="radioErro3"value="OPtion3" > Option3<br></br>
       
       <div class="add">
      
       <a href="#"onClick="return addoptions(this)">+add Options</a>
</div>

   </div>
       
       
       
       </div>
       
       
       
       <div class="nextButton">
              <button type="submit">Next</button>
              </div> 
        <input type="submit" value="Done" class="button" />

</div>
</form>

            

 
 
</body>
</html>