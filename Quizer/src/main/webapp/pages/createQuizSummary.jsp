<%@page import="java.lang.*"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.*"%>
<%@page import="com.itextpdf.*"%>
<%@page import="com.itextpdf.kernel.pdf.*"%>
<%@page import="com.itextpdf.layout.*"%>
<%@page import="com.itextpdf.layout.element.*"%>
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
	String downloadFolder = System.getProperty("user.home") + "/Downloads/"+candidate.getName()+"-quiz_summary.pdf";

	PdfWriter writer = new PdfWriter(downloadFolder); 
	   
	PdfDocument pdf = new PdfDocument(writer);              
    
    // Creating a Document        
    Document document = new Document(pdf);              
    String para1 = "Quiz Summary.";  
    
    String para2 = "Candidate\t\t\t:"+candidate.getName(); 
    String para3 = "Code\t\t\t:"+"XXXX"; 
    String para4 = "Joined At\t\t: "+candidate.getJoinedAt(); 
    String para5 = "Completed At\t: "+candidate.getCompletedAt(); 
    
    
    // Adding paragraphs to document       
    document.add(new Paragraph(para1));       
    document.add(new Paragraph(para2));
	document.add(new Paragraph(para3));
	document.add(new Paragraph(para4));
	document.add(new Paragraph(para5));
	
	Iterator<CandidateQuestionDTO> it = candidate.getAttemptedQuestionList().iterator();
	
				while (it.hasNext()) {
					CandidateQuestionDTO qsn = it.next();
					document.add(new Paragraph(qsn.getTitle()));
				}
    
    // Closing the document       
    document.close();             
    System.out.println("Paragraph added"); 
	%>
</body>
</html>