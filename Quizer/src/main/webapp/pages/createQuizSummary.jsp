<%@page import="java.lang.*"%>
<%@page import="com.itextpdf.*"%>
<%@page import="org.apache.pdfbox.pdmodel.*"%>
<%@page import="org.apache.pdfbox.pdmodel.font.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Invoice</title>
<link
	href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"
	rel="icon" class="headericon">
<style>
body {
	padding: 40px;
}

button {
	padding: 12px 50px;
	border: none;
	background-color:purple;
	color: white;
	cursor: pointer;
	display: inline-block;
}

input {
	padding: 12px 20px;
}
</style>
</head>
<body>

<%
//path where the PDF file will be store  
String downloadFolder = System.getProperty("user.home") + "/Downloads/QuizSummary.pdf";

PDDocument pdfdoc= new PDDocument();  

PDPage page1 = new PDPage();

pdfdoc.addPage(page1);

PDPageContentStream contentStream = new PDPageContentStream(pdfdoc, page1);  

//Begin the Content stream   
contentStream.beginText();   
  
//Setting the font to the Content stream    
contentStream.setFont(PDType1Font.TIMES_BOLD_ITALIC, 14);  

//Setting the position for the line   
contentStream.newLineAtOffset(20, 450);  

String text = "Quiz Summary";  

//Adding text in the form of string   
contentStream.showText(text);        

//Ending the content stream  
contentStream.endText();  

//Closing the content stream  
contentStream.close();  

try {
	System.out.println("saving:");
	pdfdoc.save(downloadFolder); 
	System.out.println("saved:");
} catch(Exception ex) {
	System.out.println("Exception:"+ex);
}
//prints the message if the PDF is created successfully   
System.out.println("PDF created");  
//closes the document  
pdfdoc.close();  
%>
	<button>Invoice</button>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"
		integrity="sha256-vIL0pZJsOKSz76KKVCyLxzkOT00vXs+Qz4fYRVMoDhw="
		crossorigin="anonymous">
	</script>

	<script>
		const pdf = new jsPDF();
		let button = document.querySelector('button');
		let input = document.querySelector('input');
		button.addEventListener('click', printPDF)
		function printPDF() {
			pdf.text(10,10, "QUIZ SUMMARY");
			<%
			%>
			pdf.save();

		}

	</script>
</body>
</html>