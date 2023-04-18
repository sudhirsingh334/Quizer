<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="styles/style.css" rel="stylesheet" />
<script language="javascript" src="../scripts/Quizervalidator.js"></script>
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
       margin-bottom: 15px;
}
.icon {
  padding:10px;
  height:25px;
  background: dodgerblue;
  color: white;
  min-width: 18px;
  text-align: center;
  margin-top: 9p0x;
  margin-left:10%;
}
.avatar {
  height:100px;
  border-radius: 50%;
  margin-top:-17%;
  margin-bottom: 10%;
  background-color:white;
  border-radius: none;
}

</Style>
</head>
<body>
  <div class="container-center">
	<button class="button" onclick="openForm()">Join</button>


		<form action="#" class="form" id="join-quiz-form" onsubmit="return quizerValidator(this)">
		
		<img src="https://cdn-icons-png.flaticon.com/128/6807/6807025.png" alt="Avatar" class="avatar">
		
		<div class="input-container">
              <i class="fa fa-user icon"></i>
			<input type="text"  placeholder="enter your name" name="quizername" ><span id="validatorQuizerNameError" style="color:red"></span><br></br>
			  </div>
			<div class="input-container">
			    <i class="fa fa-key icon"></i>
			<input type="text"  placeholder="enter quiz code" name="quizerid"><span id="validatorQuizerIdError" style="color: red"></span>	<br></br>
			</div>
			
			<button type="submit" class="button-extended" onClick="openCreateQuizPage()">Join</button>
			<button type="button" class="button-error-extended" onclick="closeForm()">Close</button>
				
		</form>
	</div>
</body>
</html>
