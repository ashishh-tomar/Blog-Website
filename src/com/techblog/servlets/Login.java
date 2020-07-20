package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.dao.UserDao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User user=dao.getUser(userEmail, userPassword);
		
		if(user==null)
		{
		 Message msg=new Message("Invalid User","error","alert-danger");
		 HttpSession s=request.getSession();
		 s.setAttribute("msg",msg);
		 response.sendRedirect("login.jsp");
		}
		else
		{
			HttpSession s=request.getSession();
			s.setAttribute("currentUser",user);
			response.sendRedirect("profile.jsp");
		}
	}

}
