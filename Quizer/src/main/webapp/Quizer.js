
function validate() {
	var radioErro1=document.getElementById("radioErro1");
	var radioErro2=document.getElementById("radioErro2");
	var radioErro3=document.getElementById("radioErro3");
	if(radioErro1.checked==true)
	alert("The radio select is::"+radioErro1.value);
	
	else if(radioErro2.checked==true)
	alert("The radio select is::"+radioErro2.value);
	
	else if(radioErro3.checked==true)
	alert("The radio select is::"+radioErro3.value);
	
	else if(radioErro3.checked==true)
	alert("The radio select is::"+radioErro3.value);
	
	
	else
	alert("No Option Selected..                                                         Alteast one Correct Answer has to be select...");
	
		
		
	
	
	}
	function addoptions() {
         var radiobox = document.createElement('input');
         radiobox.type = 'radio';
         radiobox.id = 'num';
         radiobox.value = 'Option4';
         var label = document.createElement('label')
         label.htmlFor = 'num';
         var description = document.createTextNode('Option4');
         label.appendChild(description);
         
         var newline = document.createElement('br');
         
         var container = document.getElementById('container');
         container.appendChild(radiobox);
         container.appendChild(label);
         container.appendChild(newline);
         
         



      }

