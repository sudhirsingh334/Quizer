<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quizer</title>
<link href="pages/styles/style.css" rel="stylesheet" />
    <link href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"rel="icon" class="headericon">


<style type="text/css">

.headericon{
	size: 20px;


</style>
</head>



<body>

	<div class="container-center" style="margin-top: 10%;">
		<div class="container-center">
			<img alt="" src="assets/quizer-white-XS.png"
				style="width: 1200px; margin-left: 60%; margin-bottom: 5%;" />
		</div>
		
		     <input type="submit"onClick="openJoinQuizPage()" value="Join" class="button"/>
		     <input type="submit" onClick="openCreateQuizPage()" value="Create" class="button"/>
			 <input type="submit" onClick="openQuizListPage()" value="Library" class="button"/>
			 
			  <input type="submit" onClick="testPage()" value="Test" class="button"/>
			 
			 
			
	</div>
	<script>
	function openJoinQuizPage() {
		window.location.href = "pages/joinQuiz.jsp";
	}
		function openCreateQuizPage() {
			window.location.href = "pages/createquiz.jsp";
		}
		completeQuizRedirect

		function openQuizListPage() {
			window.location.href = "pages/QuizList.jsp";
		}
		
		
		function testPage() {
			window.location.href = "pages/test.html";
		}
	</script>
</body>
</html>