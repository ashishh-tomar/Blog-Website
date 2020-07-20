package com.techblog.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.techblog.dao.UserDao;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		
		String password=request.getParameter("password");
		String about=request.getParameter("about");
		
		//TO get Image from form
		Part part=request.getPart("image");
		String image=part.getSubmittedFileName();
		
	
		
		//get the user from the Session
		
		
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		user.setName(name);
		
		user.setAbout(about);
		user.setPassword(password);
		user.setProfile(image);
		
		//Update Database
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		boolean updateCount=dao.updateUser(user);
		
		if(updateCount)
		{
			
			
			@SuppressWarnings("deprecation")
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			
			    
			    
				if(Helper.saveFile(part.getInputStream(), path))
				{
					response.getWriter().println("Updated ");
					response.sendRedirect("profile.jsp");
				}
				else
				{
					
				}
			
		}
		
		
		
		
		
	}

}
