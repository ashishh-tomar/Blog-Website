<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TechBlog</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">

<!-- Font Awsome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
	.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 99% 0, 100% 92%, 59% 100%, 21% 93%, 0 100%, 0 0);
	}

</style>

</head>
<body>
<!-- Navbar  -->
<%@include file="navbar.jsp" %>


<div class="container-fluid p-0 m-0 banner-background">
	<div class="jumbotron primary-background">
		<div class="container">
			<h3 class="display-3">Welcome To Tech Blog</h2>
		
			<p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
			<p>Thousands of different programming languages have been created, and more are being created every year. Many programming languages are written in an imperative form (i.e., as a sequence of operations to perform) while other languages use the declarative form (i.e. the desired result is specified, not how to achieve it).</p>
			<a href="register.jsp" class="btn btn-outline-light text-white btn-lg "><span class="fa fa-user-plus"></span> Free Trial</a>
			<a href="login.jsp" class="btn btn-outline-light text-white btn-lg "><span class="fa fa-user"></span> Login</a>
		</div>
	</div>

</div>

<!-- Cards -->


<div class="container">
	<div class="row mb-4">
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				
  				<div class="card-header primary-background"><h5 class="card-title">JAVA</h5>
  				</div>
  					
  				<div class="card-body">
    		
    					<p class="card-text">Java is a high-level programming language developed by Sun Microsystems. ... Instead, Java programs are interpreted by the Java Virtual Machine, or JVM, which runs on multiple platforms</p>
    					<a href="#" class="btn btn-outline-light primary-background">more</a>
  				</div>
			</div>
		
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				
  				<div class="card-header primary-background"><h5 class="card-title">C++</h5>
  				</div>
  					
  				<div class="card-body">
    		
    					<p class="card-text">uses of C++ allows procedural programming for intensive functions of CPU and to provide control over hardware, and this language is very fast because of which it is widely used in..</p>
    					<a href="#" class="btn btn-outline-light primary-background">more</a>
  				</div>
			</div>
		
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				
  				<div class="card-header primary-background"><h5 class="card-title">Python</h5>
  				</div>
  					
  				<div class="card-body">
    		
    					<p class="card-text">It's often used as a “scripting language” for web applications. This means that it can automate specific series of tasks, making it more efficient. Consequently, Python (and languages like it)..</p>
    					<a href="#" class="btn btn-outline-light primary-background">more</a>
  				</div>
			</div>
		
		</div>
	
	</div>
	
	
	
	
	<div class="row mb-4">
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				
  				<div class="card-header primary-background"><h5 class="card-title">C</h5>
  				</div>
  					
  				<div class="card-body">
    		
    					<p class="card-text">The C programming language is a computer programming language that was developed to do system programming for the operating system UNIX and is an imperative programming language. </p>
    					<a href="#" class="btn btn-outline-light primary-background">more</a>
  				</div>
			</div>
		
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				
  				<div class="card-header primary-background"><h5 class="card-title">Bootstrap 4</h5>
  				</div>
  					
  				<div class="card-body">
    		
    					<p class="card-text">Bootstrap 4 is the newest version of Bootstrap, which is the most popular HTML, CSS, and JavaScript framework for developing responsive, mobile-first web sites. Bootstrap 4 is completely.</p>
    					<a href="#" class="btn btn-outline-light primary-background">more</a>
  				</div>
			</div>
		
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 18rem;">
  				
  				<div class="card-header primary-background"><h5 class="card-title">J2EE</h5>
  				</div>
  					
  				<div class="card-body">
    		
    					<p class="card-text">Short for Java 2 Platform Enterprise Edition. J2EE is a platform-independent, Java-centric environment from Sun for developing, building and deploying Web-based enterprise applications online.</p>
    					<a href="#" class="btn btn-outline-light primary-background">more</a>
  				</div>
			</div>
		
		</div>
	
	</div>



</div>
<!-- Carosoule start -->
<div class="container">
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/author-blog-create-creative-267569.jpg" alt="First slide" style="height: 600px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/photo-of-women-using-laptops-3178744.jpg" alt="Second slide" style="height: 600px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/beach-beautiful-blue-child-267403.jpg" alt="Third slide" style="height:600px;">
    
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div>

<!-- Carosuoule End  -->

<main>
	<div class="container">
	<!-- Cards Start -->
		
		<div class="row mb-4 mt-5">
		<div class="col-md-4">
			<div class="card" style="width: 25rem;border:none">
  				
  				
  					
  				<div class="card-body">
  					<b><span class="fa fa-bars"></span>  Blogging Helps in Shaping Career</b>
  					<p>Blogging, apart from being a great productive hobby, can be a good source of earning as well. It is noted that many articles try to make it look really easy – the truth is different; blogging is not really an easy way into an earning career..</p>
    		
    		</div>
			</div>
		
		</div>
		<div class="col-md-4">
			<div class="card " style="width: 25rem;border:none">
  				
  				<div class="card-body">
  					<b><span class="fa fa-line-chart"></span>  Blog Introduces To High Profile Recruiters</b>
  					<p>Recruitment refers to the overall process of identifying, attracting, screening, shortlisting, and interviewing, suitable candidates for jobs within an organization. Recruitment can also refer to processes involved in choosing individuals for unpaid roles..</p>
    		
    		</div>
			</div>
		
		</div>
		<div class="col-md-4">
			<div class="card " style="width: 25rem;border:none">
  				
  				<div class="card-body">
  					<b><span class="fa fa-tachometer"></span>  Speed Is Your Friend</b>
  					<p>An internet relationship is a relationship between people who have met online, and in many cases know each other only via the Internet</p>
    		
    		</div>
			</div>
		
		</div>
	
	</div>
	
	
	
	
	<div class="row mb-4">
		<div class="col-md-4">
			<div class="card " style="width: 25rem;border:none">
  				
  				<div class="card-body">
  					<b><span class="fa fa-star-o"></span>  Networking through Comments</b>
  					<p>Social networking is the use of Internet-based social media sites to stay connected with friends, family, colleagues, customers, or clients. Social networking can have a social purpose, a business purpose, or both, through sites such as Facebook, Twitter, LinkedIn, and Instagram, among others..</p>
    		
    		</div>
			</div>
		
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 25rem;border:none">
  				
  				<div class="card-body">
  					<b><span class="fa fa-thumbs-o-up"></span>  Your Blog Design Matters</b>
  					<p>Design Observer is a website devoted to a range of design topics including graphic design, social innovation, urbanism, popular culture, and criticism. The content of the site includes essays, articles, reviews, blog posts, and peer ... and the podcast Design Matters with Debbie Millman..</p>
    		
    		</div>
			</div>
		
		</div>
		<div class="col-md-4">
			<div class="card" style="width: 25rem;border:none;">
  				
  				<div class="card-body">
  					<b><span class="fa fa-file-word-o"></span>  Think of Content Strategically</b>
  					<p>Content strategy focuses on the planning, creation, delivery, and governance of content. ... Ensuring that you have useful and usable content, that is well structured, and easily found is vital to improving the user experience of a website.</p>
    		
    		</div>
			</div>
		
		</div>
	
	</div>
		
		<!-- Cards End -->	
		
</div>
</main>
<!-- Quotes Section Start -->

<div class="container-fluid">
<div class="jumbotron" style="background:white;">
	<span class="fa fa-quote-left fa-2x " style="margin-left: 20%;"></span>
	<div class="text-center">
	<p>I think most of the important stuff on the Internet has been built. There will be continued innovation,</p><p> for sure, but the great problems of the Internet have essentially been solved.

	</p>
	</div>
	<span class="fa fa-quote-right fa-2x " style="margin-left: 80%;"></span>
	<div class="text-center">
	<b>Elon Musk</b>
	</div>
	
	

</div>
</div>

<!-- Quotes section End -->
<!-- Footer -->


<div class="footer">

	<div class="jumbotron primary-background text-center" style="height: 200px;">
		<p>Copyright &copy; 2018,web company All rights reserved</p>
			<div>
				<a href="#">Terms of use</a> | <a href="#">Privacy Policy</a> 
				<br>
				<p>Have a Good Day</p>
				<span class="fa fa-facebook"></span>       <span class="fa fa-google-plus"></span>     <span class="fa fa-linkedin-square"></span>
			
			
			</div>
			
		
		</div>
	</div>



</div>

<!-- End of website -->








<!-- Java Script -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/myjs.js"></script>
</body>
</html>