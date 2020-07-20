package com.techblog.dao;
import java.sql.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sun.jmx.snmp.Timestamp;
import com.techblog.entities.Categories;
import com.techblog.entities.Post;
public class PostDao {
	
	Connection con;
	public PostDao(Connection con) {
		// TODO Auto-generated constructor stub
		
		this.con=con;
	}
	
	public ArrayList<Categories> getAllCategories()
	{
		 ArrayList<Categories> list=new ArrayList<Categories> ();
		 
		 try {
			 
			 String sql="select * from categories";
			 Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery(sql);
			 while(rs.next())
			 {
				 int cid=rs.getInt(1);
				 String name=rs.getString(2);
				 String description=rs.getString(3);
				 
				 Categories c=new Categories(cid,name,description);
				 list.add(c);
			 }
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 
		 return list;
	}
	
	public boolean savePost(Post p)
	{
		boolean flag=false;
		try {
			
			String sql="insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			
			PreparedStatement pst=con.prepareStatement(sql);
			
			String pTitle=p.getpTitle();
			String pContent=p.getpContent();
			String pCode=p.getpCode();
			String pPic=p.getpPic();
			int catId=p.getCatId();
			int userId=p.getUserId();
			
			pst.setString(1,pTitle);
			pst.setString(2,pContent);
			pst.setString(3,pCode);
			pst.setString(4,pPic);
			pst.setInt(5,catId);
			pst.setInt(6,userId);
			
			pst.executeUpdate();
			
			flag=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			
		
		return flag;
	}
	
	
	public List<Post> getAllPost()
	{
		List<Post> list=new ArrayList<Post>();
		
		try {
			String sql="select * from post order by pId Desc";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next())
			{
				int pId=rs.getInt(1);
				String pTitle=rs.getString(2);
				String pContent=rs.getString(3);
				String pPic=rs.getString(4);
				java.sql.Timestamp pDate=rs.getTimestamp(5);
				int catId=rs.getInt(6);
				int userId=rs.getInt(7);
				String pCode=rs.getString(8);
				Post p=new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				
				list.add(p);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
		
	}
	
	public List<Post> getPostByCatId(int catId)
	{
		//fetch post by id
		List<Post> list=new ArrayList<Post>();
		
		try {
			String sql="select * from post where catId=?";
			
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1,catId);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next())
			{
				int pId=rs.getInt(1);
				String pTitle=rs.getString(2);
				String pContent=rs.getString(3);
				String pPic=rs.getString(4);
				java.sql.Timestamp pDate=rs.getTimestamp(5);
				
				int userId=rs.getInt(7);
				String pCode=rs.getString(8);
				Post p=new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				
				list.add(p);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return list;
		
	}
	
	public Post getPostByPostId(int postId)
	{
		String sql="select * from post where pid=?";
		Post p=null;
		try {
		PreparedStatement pst=this.con.prepareStatement(sql);
		
		pst.setInt(1,postId);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			int pId=rs.getInt(1);
			String pTitle=rs.getString(2);
			String pContent=rs.getString(3);
			String pPic=rs.getString(4);
			java.sql.Timestamp pDate=rs.getTimestamp(5);
			int catId=rs.getInt(6);
			int userId=rs.getInt(7);
			String pCode=rs.getString(8);
			 p=new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
			
			
			
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return p;
	}
	
	
	
	

}
