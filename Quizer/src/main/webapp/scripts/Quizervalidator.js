function openForm() {
	document.getElementById("join-quiz-form").style.display = "block";
}

function closeForm() {
	document.getElementById("join-quiz-form").style.display = "none";
}

function quizerValidator() {
	var quizername = document.f1.quizername.value;
	var quizerid = document.f1.quizerid.value;

	let status = true;
	if (quizername == "") {
		 status = false;
		 alert("Quzer name is requred");
		//document.getElementById("validatorQuizerNameError").innerHTML = "Quzer name is requred.";
      
	}
	else if (quizername.length < 5 || quizername.length > 20) {
     	status = false;
     			 alert("Quiz name must have min 5 letters and max of 20.");

		//document.getElementById("validatorQuizerNameError").innerHTML ="Quiz name must have min 5 letters and max of 20.";
			
	}
	else {
		document.getElementById("validatorQuizerNameError").innerHTML = "";
	
			
	}
	
	
	if (quizerid == "") {
	   status = false;
	   alert("Quiz code is required");
		//document.getElementById("validatorQuizerIdError").innerHTML =  " Quiz code is required.";
		   
			
	}
	else if (quizerid.length < 6 || quizerid.length > 6) {
		status = false;	
		 alert("Quiz code must have  6 letters");	
		//document.getElementById("validatorQuizerIdError").innerHTML = "Quiz code must have  6 letters ";
		
	}
	else {
		document.getElementById("validatorQuizerIdError").innerHTML = "";
	}
   return status;
	
}

f