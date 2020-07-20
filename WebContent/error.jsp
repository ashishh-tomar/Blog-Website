<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry..!! Something went wrong</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<div class="container text-center">
		<img src="img/warning-sign.png" class="img-fluid" style="width:25%;">
		<h3 class="display-3">Sorry something went wrong...</h3>
		<%= exception %>
		<a href="index.jsp" class="btn btn-primary btn-lg text-white mt-4">Home Page</a>
	</div>

</body>
</html>