package com.techblog.entities;

public class Message {
	private String content;
	private String type;
	private String cssClass;
	
	public Message(String content,String type,String cssClass) {
		// TODO Auto-generated constructor stub
		this.content=content;
		this.type=type;
		this.cssClass=cssClass;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

}
