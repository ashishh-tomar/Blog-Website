<%@page import="com.techblog.dao.PostDao" %>
<%@page import="com.techblog.helper.ConnectionProvider" %>
<%@page import="java.util.*" %>
<%@page import="com.techblog.entities.Post" %>
<%@ page import="com.techblog.dao.LikeDao" %>
<%@ page import="com.techblog.entities.User" %>


<div class="row">
<%
User user=(User)session.getAttribute("currentUser");

	PostDao d=new PostDao(ConnectionProvider.getConnection());
	int cId=Integer.parseInt(request.getParameter("cId"));
	List<Post> post=null;
	if(cId==0){
	 post=d.getAllPost();
	}
	else{
		post=d.getPostByCatId(cId);
		
	}
	if(post.size()==0)
	{
		response.getWriter().println("<h3 class='display-3 text-center'>No Posts</h3>");
	}
	else{
		for (Post p : post) {
%>
		
		<div class="col-md-10 offset-1 mt-2">
			<div class="card">
			<img class="card-img-top" src="Blog_pics/<%=p.getpPic()%>" alt="image not found">
				<div class="card-body">
					<b><%=p.getpTitle() %></b>
					<p><%=p.getpContent() %></p>
					
				
				</div>
				<div class="card-footer primary-background text-center">
					<%
						LikeDao l=new LikeDao(ConnectionProvider.getConnection());
					%>
					<a href="#" onclick="doLike(<%=p.getpId()%>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=l.countLinkeOnPost(p.getpId()) %></span></a>
					<a href="showBlog.jsp?post_id=<%=p.getpId() %>" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> </span></a>
						<a href="showBlog.jsp?post_id=<%=p.getpId() %>" class="btn btn-outline-light btn-sm">Read More...</a>
				</div>
			
			</div>
		
		</div>
		
		
		<%
	}
	}

%>

</div>