<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.8.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  

<title>Quizer</title>
<link href="pages/styles/style.css" rel="stylesheet" />
    <link href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"rel="icon" class="headericon">


<style type="text/css">

.headericon{
	size: 20px;
}
   .responsive{
         max-width: 100%;
         height: auto;
         margin-left:300px;
         
      
}
</style>
</head>



<body>
 <div class="container mt-4">
 
	<div class="container-center" style="margin-top: 10%;">
		<div class="container-center">
			<img  src="assets/quizer-white-XS.png" alt="Nature" class="responsive">
				<!-- style="width: 1200px; margin-left: 60%; margin-bottom: 5%;" /> -->
		</div>
		
		     <input  type="submit"onClick="openJoinQuizPage()" value="Join" class="button"/>
		     <input type="submit" onClick="openCreateQuizPage()" value="Create" class="button"/>
			 <input type="submit" onClick="openQuizListPage()" value="Library" class="button"/>
			 
			  <input type="submit" onClick="getQuizerResults()" value="Results" class="button"/>			 
			</div>
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
		
		
		function getQuizerResults() {
			window.location.href = "pages/quizerResults.jsp";
		}
		
		
	</script>
</body>
</html>