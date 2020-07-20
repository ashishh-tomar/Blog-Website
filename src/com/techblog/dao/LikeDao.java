package com.techblog.dao;
import java.sql.*;
public class LikeDao {
	
	Connection con;
	
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}


	public boolean insertLike(int pid,int uid)
	{
		boolean flag=false;
		try {
			
			String sql="insert into liked(pid,uid) values(?,?)";
			
			PreparedStatement pst=this.con.prepareStatement(sql);
			
			pst.setInt(1,pid);
			pst.setInt(2,uid);
			
			pst.executeUpdate();
			flag=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public int countLinkeOnPost(int pid)
	{
		int count=0;
		
		String sql="select count(*) from liked where pid=?";
		try
		{
		PreparedStatement pst=this.con.prepareStatement(sql);
		
		pst.setInt(1,pid);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			count=rs.getInt("count(*)");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return count;
	}

	public boolean isLIkedByUser(int pid,int uid)
	{
		boolean flag=false;
		
		try {
			
			String sql="select * from liked where pid=? and uid=?";
			
			PreparedStatement pst=this.con.prepareStatement(sql);
			
			pst.setInt(1,pid);
			pst.setInt(2,uid);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				flag=true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return flag;
	}
	public boolean deleteLike(int pid,int uid)
	{
		boolean flag=false;
		
		try {
			
			String sql="delete from liked where pid=? and uid=?";
			PreparedStatement pst=this.con.prepareStatement(sql);
			
			pst.setInt(1,pid);
			pst.setInt(2,uid);
			pst.executeUpdate();
			
			flag=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return flag;
	
	}
	
	
}
