     function openForm() {
	     document.getElementById("join-quiz-form").style.display = "block";
      }

    function closeForm() {
      	document.getElementById("join-quiz-form").style.display = "none";
   }

     function openCreateQuizPage() {
		  window.location.href = "createquiz.jsp";
		    } 
		    

    // Quizer Validator
    
  
   function quizerValidator(form) {
	
	document.getElementById("validatorQuizerNameError").innerHTML = "";
	document.getElementById("validatorQuizerIdError").innerHTML = "";
	
	

	  var quizername = form.quizername.value;
	  var quizerid = form.quizerid.value;
	
	let vflag = true;
	if (quizername == "") {
		vflag = false;
		document.getElementById("validatorQuizerNameError").innerHTML = "Quzer name is requred.";
		
	}
	else if (quizername.length < 5 || quizername.length > 50) {
		vflag = false;
		document.getElementById("validatorQuizerNameError").innerHTML = "<br></br> Quiz name must have min 5 letters and max of 50.";
	}
	else {
		document.getElementById("validatorQuizerNameError").innerHTML = "";
	}
	// add id
	if (quizerid == "") {
		vflag = false;
		document.getElementById("validatorQuizerIdError").innerHTML = "Quiz id is required.";
	}
	else if (quizerid.length == 6) {
		vflag = false;
		document.getElementById("validatorQuizerIdError").innerHTML = "Quiz id must have  6 letters ";
	}
	else {
		document.getElementById("validatorQuizerIdError").innerHTML = "";
	}

	return vflag;
}