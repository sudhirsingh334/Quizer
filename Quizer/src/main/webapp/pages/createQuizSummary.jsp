<%@page import="java.lang.*"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.*"%>
<%@page import="com.itextpdf.*"%>
<%@page import="org.apache.pdfbox.pdmodel.*"%>
<%@page import="org.apache.pdfbox.pdmodel.font.*"%>
	<%@ page import="com.quizer.pojo.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="com.quizer.utilities.*"%>
	<%@ page import="com.database.*"%>
	<%@ page import="com.quiz.dto.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>
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
</head>
<body>

	<%
	ResultCandidate candidate = (ResultCandidate) session.getAttribute("Candidate");
	
	if (candidate == null) {
		//Show error alert
		Alert.show("Something went wront. Please try again", out);
		return;
	}
	 //path where the PDF file will be store  
	String downloadFolder = System.getProperty("user.home") + "/Downloads/QuizSummary.pdf";

	PDDocument pdfdoc = new PDDocument();

	PDPage page1 = new PDPage();

	pdfdoc.addPage(page1);

	PDPageContentStream contentStream = new PDPageContentStream(pdfdoc, page1);

	//Begin the Content stream   
	contentStream.beginText();

	//Setting the font to the Content stream    
	contentStream.setFont(PDType1Font.TIMES_BOLD_ITALIC, 14);

	//Setting the position for the line   
	contentStream.newLineAtOffset(10, 450);

	String text = "Quiz Summary";
	

	//Adding text in the form of string   
	contentStream.showText("Candidate: "+ candidate.getName());
	 
	//Ending the content stream  
	contentStream.endText();

	//Closing the content stream  
	contentStream.close();

	try {
		pdfdoc.save(downloadFolder);
	} catch (Exception ex) {
		System.out.println("Exception:" + ex);
	}
	//prints the message if the PDF is created successfully   
	System.out.println("PDF created");
	//closes the document  
	pdfdoc.close(); 
	%>
</body>
</html>