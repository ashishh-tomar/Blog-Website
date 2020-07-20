<%@page import="com.techblog.helper.ConnectionProvider"%>
<%@ page import="com.techblog.entities.User" %>
<%@ page import="com.techblog.dao.PostDao" %>
<%@ page import="com.techblog.dao.UserDao" %>
<%@ page import="com.techblog.dao.LikeDao" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="com.techblog.entities.Categories" %>
<%@ page import="com.techblog.entities.Post" %>
<%@ page errorPage="error.jsp" %>
<%
	User user=(User)session.getAttribute("currentUser");
	if(user==null)
	{
		response.sendRedirect("login.jsp");
	}
	
%>
<%
	int postId=Integer.parseInt(request.getParameter("post_id"));
	PostDao d=new PostDao(ConnectionProvider.getConnection());
	


	Post p=d.getPostByPostId(postId);

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle() %> || TechBlog</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">

<!-- Font Awsome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.post-title
	{
	font-weight:100;
	font-size:30px;
	}	
	
	.post-content
	{
	font-weight:100;
	font-size:25px;
	}	
	.post-user-info{
		font-size:20px;
		font-weight:200;
	}
	.post-date{
		font-style:italic;
		font-weight:bold;
	}
	.row-user{
	border:1px solid #e91e63;
	padding-top:15px;
	
	}
	
	body{
		background:url(img/Background.jpg);
		background-size:cover;
		background-attachment:fixed;
	
	}

</style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v7.0" nonce="M29j3eO7"></script>
</head>
<body>

<!-- NavBar  Start -->
<nav class="navbar navbar-expand-lg navbar-light primary-background">
  <a class="navbar-brand" href="#"><span class="fa fa-gitlab"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span> <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-bars"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="	fa fa-address-book"></span>Contact</a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">Post <span class="	fa fa-plus-square-o"></span></a>
      </li>
     
    </ul>
    <ul class="navbar-nav mr-right">
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%=user.getName() %></a>
      </li>
    	<li class="nav-item">
        <a class="nav-link" href="Logout"><span class="fa fa-paper-plane-o"></span>Logout</a>
      </li>
    	
    </ul>
  </div>
</nav>

<!-- End of NavBar -->


<!-- Main Content of Body -->

<div class="container">
	<div class="row my-4">
		<div class="col-md-8 offset-md-2">
			<div class="Card">
				<div class="card-header primary-background text-white">
					<h4 class="post-title"><%=p.getpTitle() %></h4>
					
				</div>
				<div class="card-body bg-white">
					<img class="card-img-top my-2" src="Blog_pics/<%=p.getpPic()%>" alt="Image not found"> 
					<div class="row my-3 row-user">
						<div class="col-md-8 post-user-info">
						<%
						//to create user Dao object
						
						UserDao dao=new UserDao(ConnectionProvider.getConnection());
						
						
						
						%>
							<p><a href="#"><%=
							
							dao.getUserByUserId(p.getUserId()).getName()
							
							
							%> </a>Posted</p>
						</div>
						<div class="col-md-4 post-date">
							<p><%=DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
						</div>
						
					
					</div>
					<p class="post-content"> <%=p.getpContent() %></p>
					
					<br>
					<br>
					
					<pre class="post-code"><%=p.getpCode() %></pre>
					
				</div>
				
				<div class="card-footer primary-background text-center">
					<%
						LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
					%>
					<a href="#" onclick="doLike(<%=p.getpId()%>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLinkeOnPost(p.getpId()) %></span></a>
					<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span></span></a>
					
				</div>
				<div class="card-footer bg-light">
					<div class="fb-comments" data-href="http://localhost:8080/TechBlog/showBlog.jsp?post_id=<%=p.getpId() %>" data-numposts="5" data-width=""></div>
				</div>
			
			</div>
		</div>
	</div>
</div>

<!-- End of Main Content of Body -->

<!-- Profile Modal start -->



<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="container text-center">
      	<img src="<%=user.getProfile()%>" style="width:80px;border-radius: 50%;">
      	<h5 class="modal-title" id="exampleModalLabel"><%=user.getName() %></h5>
      	
      	<!-- Details -->
      	<div id="profile-detail">
      		<table class="table">
 
  				<tbody>
    				<tr>
     					 <th scope="row">Email</th>
      					 <td><%=user.getEmail() %></td>
      
    				</tr>
    				<tr>
      						<th scope="row">Gender</th>
      						<td><%=user.getGender() %></td>
      
    				</tr>
    				<tr>
      						<th scope="row">About</th>
      						<td><%=user.getAbout() %></td>
     
    				</tr>
  				</tbody>
			</table>
		</div>
		
		
	
		
		<!-- Profile Edit Section -->
		
		<div id="profile-edit" style="display:none;">
		
		<h3 class="mt-2">Please Edit Carefully</h3>
		<form action="EditServlet" method="post" enctype="multipart/form-data">
		
			<table class="table"> 
				
				<tr>
					<td>Email : </td>
					<td><%=user.getEmail() %></td>
				</tr>
				<tr>
					<td>Name : </td>
					<td><input type="text" class="form-control" name="name" placeholder="Enter New Name" required="required" ></td>
				</tr>
				<tr>
					<td>Password : </td>
					<td><input type="text" class="form-control" name="password" placeholder="Enter New Password" required="required"></td>
				</tr>
				
				<tr>
					<td>About : </td>
					<td><textarea  class="form-control" name="about"rows="2" cols="3"required="required" ></textarea></td>
				</tr>
				
				<tr>
					<td>Profile pic : </td>
					<td><input type="file" class="form-control" name="image"></td>
				</tr>
				<tr>
					<td>Gender : </td>
					<td><%=user.getGender().toUpperCase() %></td>
				</tr>
				
			</table>
			<div class="container">
				<button type="submit" class="btn primary-background">Save</button>
			</div>
		</form>
		
		</div>
      	
      	</div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-light text-black" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-btn"class="btn primary-background">Edit</button>
      </div>
    </div>
  </div>
</div>


<!-- Profile Modal End -->

<!-- Add post modal -->
		
		<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center ">
        <h5 class="modal-title" id="exampleModalLabel">Add Post</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="add-post-form"action="PostServlet" method="post" enctype="multipart/form-data">
        <div class="form-group">
        <select class="form-control" name="cId">
        	<option selected disabled>--select category--</option>
        	
        	<%
        		PostDao pd=new PostDao(ConnectionProvider.getConnection()); 
        		ArrayList <Categories> list=pd.getAllCategories();
        		for(Categories c:list)
        		{
        		%>
        		<option value="<%= c.getcId() %>"><%=c.getName() %></option>
        		
        		<%	
        		}
        	
        	%>
        	
        </select>
        </div>
        	<div class="form-group">
        	
        		<input type="text" name="pTitle"placeholder="Enter Post Title">
        	
        	</div>
        	<div class="form-group">
        		<textarea rows="2" cols="3" name="pContent"class="form-control">Enter your Content</textarea>
        	</div>
        	
        	<div class="form-group">
        		<textarea rows="4" cols="3" name="pCode"class="form-control">Enter your Program(if any)</textarea>
        	</div>
        	
        	<div class="form-group">
        	<label>Enter your Pic</label>
        	<br>
        		<input type="file" name="pic">
        	</div>
        	<div class="container text-center">
        		<button type="submit" class="btn btn-outline-primary">Post</button>
        	</div>
        
        </form>
      </div>
    
    </div>
  </div>
</div>
		
		<!-- End add post modal -->


<!-- Java Script -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="js/myjs.js"></script>


<script>
	$(document).ready(function(){
		
		let editStatus=false;
		$('#edit-profile-btn').click(function()
		{
			if(editStatus==false)
				{
					$("#profile-detail").hide()
				
					$("#profile-edit").show()
				
					editStatus=true;
					$(this).text("Back")
				}
			else
				{
				$("#profile-detail").show()
				
				$("#profile-edit").hide()
				
				editStatus=false;
				}
			
			
		})
	});
</script>

<!-- Now Javascript for add post/blog-->

<script>
	
		//We added listener to the form
		$(document).ready(function (e){
		
		$("#add-post-form").on("submit",function (event) 
				{
			
					//this code get called when form is submitted
			
					event.preventDefault();
					console.log("Submitted")
					
			
					let form=new FormData(this);
			
					//Now AJAX to send data of form
			
					$.ajax({
							url: "PostServlet",
							type:'POST',
							data:form,
				
							success:function (data,textStatus,jqXHR)
							{
								
								alert("Succeess")
							},
							error:function(jqXHR,textStatus,errorThrown)
							{
								//Error
					
							},
							processData:false;
							contentType:false;
						})
			
				})
			})
</script>



</body>
</html>