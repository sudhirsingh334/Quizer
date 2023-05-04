<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.8.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
	      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer"/>

<title>Quizer</title>
<link href="pages/styles/style.css" rel="stylesheet" />
    <link href="https://companieslogo.com/img/orig/KAHOT.OL-e50e329b.png?t=1603470544"rel="icon" class="headericon">


<style type="text/css">

.headericon{
	size: 20px;
}
   .headerName{
         width:10%;
         height: auto;
         margin-left:240px;
         
      
}
/* css of footer */

ul {
    margin: 0px;
    padding: 0px;
}
.footer-section {
  background:purple;
  position: relative;
}
.footer-cta {
  border-bottom: 1px solid #fff;
  margin-left: 20px;
  margin-right: 20px;
}
.single-cta i {
  color:white;
  font-size:20px;
  float: left;
  margin-top:30px;
  margin-left: 10px;
}
.cta-text {
  padding-left: 15px;
  display: inline-block;
}
.cta-text h4 {
  color: #fff;
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 2px;
}
.cta-text span {
  color: #fff;
  font-size: 15px;
}
.footer-content {
  position: relative;
  z-index: 2;
}
.footer-pattern img {
  position: absolute;
  top: 0;
  left: 0;
  height: 330px;
  background-size: cover;
  background-position: 100% 100%;
}
.footer-logo {
  margin-bottom: 30px;
}
.footer-logo img {
    max-width:50px;
}
.footer-text p {
  margin-bottom: 14px;
  font-size: 14px;
      color:white;
  line-height: 28px;
  margin-left: 20px;	
}
.footer-social-icon span {
  color: #fff;
  display: block;
  font-size: 20px;
  font-weight: 700;
  font-family: 'Poppins', sans-serif;
  margin-bottom: 20px;
    margin-left: 15px;
  
  
}
.footer-social-icon a {
  color: #fff;
  font-size:25px;
  margin-left: 15px;
}
.footer-social-icon i {
  height: 40px;
  width: 40px;
  text-align: center;
  line-height: 38px;
  border-radius: 50%;
}
.facebook-bg{
  background: white;
}
.twitter-bg{
  background: #fff;
}
.google-bg{
  background: white;
}
.footer-widget-heading h3 {
  color: #fff;
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 40px;
  position: relative;
  margin-left:25px; 
}
.footer-widget-heading h3::before {
  content: "";
  position: absolute;
  left: 0;
  bottom: -15px;
  height: 2px;
  width: 50px;
  background: #fff;
  
  
}
.footer-widget ul li {
  display: inline-block;
  float: left;
  width: 50%;
  margin-bottom: 12px;
    text-decoration: none;
  
}
.footer-widget ul li a:hover{
  color: #fff;
}
.footer-widget ul li a {
  color: #fff;
  text-transform: capitalize;
  text-decoration: none;
  margin-left: 20px;
  
}
.subscribe-form {
  position: relative;
  overflow: hidden;
}
.subscribe-form input {
  width:90%;
  margin-left:10px;
  margin-right:10px;  
  
  padding: 14px 28px;
  background: #fff;
  border: 1px solid ;
  border-radius:10px;
  color: purple;
}
.subscribe-form button {
    position: absolute;
    right: 0;
    background: #0088cc;
    padding: 17px 20px;
    top: 0;
}
.subscribe-form button i {
  color: #fff;
  font-size: 22px;
  transform: rotate(-6deg);
}
.copyright-area{
  background: perpule;
  padding: 25px 0;
}
.copyright-text p {
  margin: 0;
  font-size: 14px;
  color: #fff;
  margin-left: 15px;
}
.copyright-text p a{
  color: #fff;
  font-size: 25px;
  text-decoration: none;
  
  
}
.footer-menu li {
  display: inline-block;
  margin-left: 20px;
}
.footer-menu li:hover a{
  color: #ff5e14;
}
.footer-menu li a {
  font-size: 14px;
  color: #fff;
  text-decoration: none;
}


}
.social-media,ul,li{
font-size:100px;
margin-right: 15px;
}
.header{
background-color: white;
}


</style>
</head>




 <div class="container mt-4">
 <div class="header"></div>
 
 
	<div class="container-center" style="margin-top:16%;zoom:133%;">
		<div class="container-center">
			<!-- <img  src="assets/quizer-white-XS.png" alt="Nature" class="headerName"> -->
			<h1 style="color:white";><em>Quizer</em></h1>
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
		
		
	</script><br></br><br></br>
	
	<footer class="footer-section">
  <div class="container">
    <div class="footer-cta pt-5 pb-5">
      <div class="row">
        <div class="col-xl-4 col-md-4 mb-30">
          <div class="single-cta">
            <i class="fas fa-map-marker-alt"></i>
            <div class="cta-text">
              <h4>Find us</h4>
              <span>Bangaluru, KA-560033</span>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-md-4 mb-30">
          <div class="single-cta">
            <i class="fas fa-phone"></i>
            <div class="cta-text">
              <h4>Call us</h4>
              <span>+91-8597146172</span>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-md-4 mb-30">
          <div class="single-cta">
            <i class="far fa-envelope-open"></i>
            <div class="cta-text">
              <h4>Mail us</h4>
              <span>sudhir.manojsingh@gmail.com</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-content pt-5 pb-5">
      <div class="row">
        <div class="col-xl-4 col-lg-4 mb-50">
          <div class="footer-widget">
            <div class="footer-logo">
            <!--   <a href="index.html"><img src="https://o.quizlet.com/rf4Z75KT8VcPAR4FX-oxVw.png" class="img-fluid" alt="logo"></a> -->
            </div>
            <div class="footer-text">
              <p>Quiz! is a game-based learning platform that makes it easy to create, share and play learning quiz or trivia quizzes in minutes. Played around the world in classrooms, offices and living rooms!</p>
            </div>
            <div class="footer-social-icon">
              <span>Follow us</span>
              <a href="https://www.linkedin.com/in/sudhir-kumar-singh-583429209/"><i class="fab fa-linkedin-in"></i></a>
              <a href="https://twitter.com/SudhirK16283397"><i class="fab fa-twitter twitter"></i></a>
              <a href="https://www.instagram.com/aryank_730_/"><i class="fab fa-instagram"></i></a>
               <a href="https://www.facebook.com/profile.php?id=100035853871948"><i class="fab fa-facebook-f"></i></a>
                <a href="https://github.com/sudhirsingh334"><i class="fab fa-github"></i></a>
                 <a href="https://www.hackerrank.com/sudhir_manjsingh"><i class="fab fa-hackerrank"></i></a>
                   <a href="https://google.com"><i class="fab fa-google-plus-g google"></i></a>
              
              
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-lg-4 col-md-6 mb-30">
          <div class="footer-widget">
            <div class="footer-widget-heading">
              <h3>Useful Links</h3>
            </div>
            <div class="social-media">
            <ul>
              <li><a href="#">Home</a></li>
              <li><a href="#">about</a></li>
              <li><a href="#">services</a></li>
              <li><a href="#">portfolio</a></li>
              <li><a href="#">Contact</a></li>
              <li><a href="#">About us</a></li>
              <li><a href="#">Our Services</a></li>
              <li><a href="#">Expert Team</a></li>
              <li><a href="#">Contact us</a></li>
              <li><a href="#">Latest News</a></li>
            </ul>
            </div>
          </div>
        </div>
        <div class="col-xl-4 col-lg-4 col-md-6 mb-50">
          <div class="footer-widget">
            <div class="footer-widget-heading">
              <h3>Subscribe</h3>
            </div>
            <div class="footer-text mb-25">
              <p>Don’t miss to subscribe to our new quiz, kindly fill the form below.</p>
            </div>
            <div class="subscribe-form">
              <form action="#">
              <em>
                <input type="text" placeholder="Email Address">
                </em>
                <button><i class="fab fa-telegram-plane"></i></button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="copyright-area">
    <div class="container">
      <div class="row">
        <div class="col-xl-6 col-lg-6 text-center text-lg-left">
          <div class="copyright-text">
            <p>Copyright &copy; 2023, All Right Reserved <a href="https://codepen.io/anupkumar92/"><em>@SudhirK</em></a></p>
          </div>
        </div>
        <div class="col-xl-6 col-lg-6 d-none d-lg-block text-right">
          <div class="footer-menu">
            <ul>
              <li><a href="#">Home</a></li>
              <li><a href="#">Terms</a></li>
              <li><a href="#">Privacy</a></li>
              <li><a href="#">Policy</a></li>
              <li><a href="#">Contact</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
</body>
</html>