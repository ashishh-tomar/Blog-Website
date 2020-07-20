<%@ page import="com.techblog.entities.Message" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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


<main class="d-flex align-items-center"  style="height:70vh">
	   <div class="container">
	   		<div class="row">
	   			<div class="col-md-4" style="margin-left: 35%">
	   				<div class="card">
	   					<div class="card-header primary-background text-white text-center">
	   						<span class="fa fa-user fa-3x"></span>
	   						<p>Login</p>
	   					</div>
	   					<%
	   					Message m=(Message)session.getAttribute("msg");
	   					if(m!=null){
	   					
	   					%>
	   					<div class="alert <%=m.getCssClass() %>" role="alert">
							  <%=m.getContent() %>
						</div>
	   					
	   					<%
	   						session.removeAttribute("msg");
	   					}
	   					
	   					%>
	   					
	   					
	   				
	   					
	   					
	   					<div class="card-body">
	   						<form action="Login" method="post"> 
  								<div class="form-group">
    								<label for="exampleInputEmail1">Email address</label>
    								<input type="email" class="form-control" name="email"id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
    								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  								</div>
  								<div class="form-group">
    								<label for="exampleInputPassword1">Password</label>
    								<input type="password" class="form-control" name="password" id="exampleInputPassword1">
  								</div>
  								
  									<div class="container text-center">
  										<button type="submit" class="btn btn-outline-light primary-background">Login</button>	
  									</div>
								</form>
	   					</div>
	   				
	   				
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
</body>
</html>