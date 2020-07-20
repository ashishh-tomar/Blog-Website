<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register to TechBlog</title>
<!-- Css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">

<!-- Font Awsome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
	.banner-background{
		clip-path: polygon(30% 0%, 70% 0%, 99% 0, 100% 92%, 59% 100%, 21% 93%, 0 100%, 0 0);
	}
	body{
		background:url(img/Background.jpg);
		background-size:cover;
		background-attachment:fixed;
	
	}

</style>
</head>
<body>
<!-- Navbar  -->
<%@include file="navbar.jsp" %>
<main>
	<div class="container">
		<div class="col-md-4 " style="margin-left: 35%">
			<div class="card">
				<div class="card-header text-center primary-background">
					<span class="fa fa-user-plus fa-2x"></span>
					<br>
					<p>Sign Up</p>
				
				</div>
				<div class="card-body">
					<form action="Register" method="post">
						<div class="form-group">
    						<label for="user_name">Name</label>
    						<input type="text" class="form-control" name="name" aria-describedby="emailHelp" placeholder="Enter username">
    						
  						</div>
						
  						<div class="form-group">
    						<label for="exampleInputEmail1">Email address</label>
    						<input type="email" class="form-control" name="email"id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
    						<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  						</div>
  						
  						
  						<div class="form-group">
    						<label for="exampleInputPassword1">Password</label>
    						<input type="password" class="form-control" name="password"id="exampleInputPassword1" placeholder="Enter password">
  						</div>
  						
  						<div class="form-group">
    						<label for="gender">Select Gender</label>
    						<br>
    						<input type="radio"  id="gender" name="gender" value="male">Male
    						<input type="radio"  id="gender" name="gender" value="female">Female
  						</div>
  						<div class="form-group">
  							<textarea name="about" name="about"id="" class="form-control" cols="3" rows="2" placeholder="tell something about urself"></textarea>
  							
  						</div>
  						
  						<div class="form-group form-check">
    						<input type="checkbox" class="form-check-input" name="check"id="exampleCheck1" required="required">
    						<label class="form-check-label" for="exampleCheck1">Terms and conditions</label>
  						</div>
  						
  						
  						<button type="submit" class="btn btn-outline-light primary-background">SignUp</button>
					</form>
				</div>	
			</div>
		</div>		
	</div>


</main>


<!-- Java Script -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/myjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
</body>
</html>