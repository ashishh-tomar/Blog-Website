package com.techblog.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.dao.UserDao;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//Fetch Form data
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String gender=request.getParameter("gender");
		String about=request.getParameter("about");
		
		
	
		User user=new User(name,email,password,gender,about);
		
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		boolean flag=dao.saveUser(user);
		if(flag==true)
		{
			RequestDispatcher r=request.getRequestDispatcher("login.jsp");
			r.forward(request, response);
		}
		else
		{
			response.getWriter().println("data is not stored in database");
			//response.sendRedirect("register.jsp");
		}
			
			
		}
		
		
		
		
		
	

}
