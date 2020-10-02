package com.techblog.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

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
	private static final String SAVE_DIR="img";//This is our folder name
	  
    
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
			
			
			//String fileName=part.getSubmittedFileName();
		//	String savePath="E:\\Apache Software Foundation\\Tomcat 9.0\\wtpwebapps\\TechBlog"+File.separator+SAVE_DIR;
		//	File f=new File(savePath,image);
		//	if(f.exists()==false)
		//	{
		//		f.createNewFile();
		//	} 
			
			
			String path="C:"+File.separator+"Users"+File.separator+"Ashish"+File.separator+"eclipse-workspace"+File.separator+"TechBlog"+File.separator+"WebContent"+File.separator+"pics"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			//Now we are writing imge using file i/o in particular folder
			try {
			FileOutputStream fos=new FileOutputStream(path);
			
			
			InputStream is=part.getInputStream();
			
			//Reading data
			
			byte[] data=new byte[is.available()];
			is.read(data);
			
			//Writing data
			
			fos.write(data);
			fos.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
			response.sendRedirect("profile.jsp");
			    
				
			
		}
		
		
		
		
		
	}

}
