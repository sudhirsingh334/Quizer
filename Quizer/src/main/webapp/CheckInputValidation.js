

function validate(form) {
	document.getElementById("quizerError").innerHTML = "";
	
	var quizerName = form.quizname.value;
	let vflag = true;
	
	if (quizerName == "") {
		vflag = false;
		document.getElementById("quizerError").innerHTML = "Quiz name is required.";
	}
	else if (quizerName.length < 5 || quizerName.length > 50) {
		vflag = false;
		document.getElementById("quizerError").innerHTML = "Quiz name must have min 5 letters and max of 50.";
	}
	else {
		document.getElementById("quizerError").innerHTML = "";
	}
	
	return vflag;
}