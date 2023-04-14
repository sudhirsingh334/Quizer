

function validate(frm) {

	document.getElementById("quizerErr").innerHTML = "";
	
	var quizerName = frm.name.value;
	let vflag=true;
		if (quizerName == "") {
					vflag=false;
		document.getElementById("quizerErr").innerHTML=
		"name is required";
	}
	else if (quizerName.lenght < 5 || quizerName.lenght > 10) {
				vflag=false;
		document.getElementById("quizerErr").innerHTML = "Quizer name must have min 5 letters and max of 10 required";


	}
	else{
		document.getElementById("quizerErr").innerHTML = "";
	}
	return vflag;
	
}