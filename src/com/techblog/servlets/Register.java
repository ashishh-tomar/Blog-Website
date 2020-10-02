package com.techblog.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
		String sql="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
		
		try {
				Connection con=ConnectionProvider.getConnection();
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setString(1,name);
				pst.setString(2,email);
				pst.setString(3,password);
				pst.setString(4,gender);
				pst.setString(5,about);
				int i=pst.executeUpdate();
				if(i!=0)
					{
					RequestDispatcher r=request.getRequestDispatcher("login.jsp");
					r.forward(request, response);
					}
				else
				{
					//response.getWriter().println("data is not stored in database");
					response.sendRedirect("register.jsp");
				}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
			
			
		}
		
		
		
		
		
	

}
