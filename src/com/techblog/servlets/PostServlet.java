package com.techblog.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sun.jmx.snmp.Timestamp;
import com.techblog.dao.PostDao;
import com.techblog.entities.Post;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
@MultipartConfig
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String pTitle=request.getParameter("pTitle");
		int cId=Integer.parseInt(request.getParameter("cId"));
		String pContent=request.getParameter("pContent");
		String pCode=request.getParameter("pCode");
		
		Part part=request.getPart("pic");
		
		
		//Getting current user iD
		
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		
		
		
		Post post=new Post( pTitle, pContent, pCode,part.getSubmittedFileName() ,null,cId,user.getId());
		
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(post))
		{
			
		//	String path=request.getRealPath("/")+"Blog_pics"+File.separator+part.getSubmittedFileName();
		//	Helper.saveFile(part.getInputStream(), path);
			

			String path="C:"+File.separator+"Users"+File.separator+"Ashish"+File.separator+"eclipse-workspace"+File.separator+"TechBlog"+File.separator+"WebContent"+File.separator+"Blog_pics"+File.separator+part.getSubmittedFileName();
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
			response.sendRedirect("profile.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
		else
		{
			response.getWriter().println("not Updated");
		}
	}

}
