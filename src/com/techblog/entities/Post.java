package com.techblog.entities;

import com.sun.jmx.snmp.Timestamp;

public class Post {

	private int pId;
	private String pTitle;
	private String pContent;
	private java.sql.Timestamp pDate;
	private String pPic;
	private String pCode;
	private int catId;
	private int userId;
	public Post(int pId, String pTitle, String pContent,String pCode,String pPic, java.sql.Timestamp pDate, int catId,int userId) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode=pCode;
		this.pDate = pDate;
		this.catId = catId;
		this.userId=userId;
		this.pPic=pPic;
	}
	public Post(String pTitle, String pContent,String pCode,String pPic ,java.sql.Timestamp pDate, int catId,int userId) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode=pCode;
		this.pDate = pDate;
		this.catId = catId;
		this.userId=userId;
		this.pPic=pPic;
	}
	
	public Post() {
		// TODO Auto-generated constructor stub
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public java.sql.Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(java.sql.Timestamp pDate) {
		this.pDate = pDate;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	
	
	
}
