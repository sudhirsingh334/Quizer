<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="styles/style.css" rel="stylesheet" />
<script language="javascript" src="../scripts/Quizervalidator.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<script
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
</Style>
</head>
<body>
	<div class="container-center">
		<button class="button" onclick="openForm()">Join</button>


		<form   name="f1" action="addQuizerDetails" method="post" class="form" id="join-quiz-form" onsubmit="return quizerValidator()">
			<img src="https://cdn-icons-png.flaticon.com/128/6807/6807025.png"alt="Avatar" class="avatar">
				
		<div class="input-container"><i class="fa fa-user icon"></i> <input type="text"	placeholder="enter your name" name="quizername"><br></br>
				<span id="validatorQuizerNameError" style="color:palevioletred"></span><br></br>
			</div>
			<div class="input-container">
				<i class="fa fa-key icon"></i> 
					<input type="text" placeholder="enter quiz code" name="quizerid"><br></br> <span
					id="validatorQuizerIdError" style="color:palevioletred"></span><br></br>
			</div>

			<button type="submit" class="button-extended">Join</button>
				
			<button type="button" class="button-error-extended"
				onclick="closeForm()">Close</button>

		</form>
	</div>

</body>
</html>
