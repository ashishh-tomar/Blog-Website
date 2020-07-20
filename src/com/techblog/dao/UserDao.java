package com.techblog.dao;
import java.sql.*;


import com.techblog.entities.User;
public class UserDao {
	
	private Connection con;
	
	public UserDao(Connection con) {
		// TODO Auto-generated constructor stub
		this.con=con;
	}
	
	
	public boolean saveUser(User user)
	{
		boolean flag=false;
		try {
			
			String sql="insert into user values(?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,user.getName());
			pst.setString(2,user.getEmail());
			pst.setString(3,user.getPassword());
			pst.setString(4,user.getGender());
			pst.setString(5,user.getAbout());
			
			
			pst.executeUpdate();
			flag=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	public User getUser(String email,String password)
	{
		User user=null;
		
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1,email);
			pst.setString(2,password);
			
			ResultSet rs=pst.executeQuery();
			
			if(rs.next())
			{
				user=new User();
				
				String name=rs.getString(1);
				String email1=rs.getString(2);
				String gender=rs.getString(4);
				String about=rs.getString(5);
				String profile=rs.getString(6);
				int id=rs.getInt(7);
				
				user.setName(name);
				user.setEmail(email1);
				user.setGender(gender);
				user.setAbout(about);
				user.setProfile(profile);
				user.setId(id);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	
	
	public boolean updateUser(User user)
	{
		boolean flag=false;
		try {
			
			String sql="update user set name=?,password=?,gender=?,about=?,profile=? where email=?";
			
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,user.getName());
			
			pst.setString(2,user.getPassword());
			pst.setString(3,user.getGender());
			pst.setString(4,user.getAbout());
			pst.setString(5,user.getProfile());
			pst.setString(6,user.getEmail());
			
			pst.executeUpdate();
			
			flag=true;
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}

	
	public User getUserByUserId(int postId)
	{
		User user=null;
		String sql="select * from user where uId=?";
		try {
		PreparedStatement pst=this.con.prepareStatement(sql);
		pst.setInt(1,postId);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			user=new User();
			
			String name=rs.getString(1);
			String email1=rs.getString(2);
			String password=rs.getString(3);
			String gender=rs.getString(4);
			String about=rs.getString(5);
			String profile=rs.getString(6);
			int id=rs.getInt(7);
			
			user.setName(name);
			user.setEmail(email1);
			user.setPassword(password);
			user.setGender(gender);
			user.setAbout(about);
			user.setProfile(profile);
			user.setId(id);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		return user;
	}
}
