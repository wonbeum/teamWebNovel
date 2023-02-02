package com.example.model;

public class admin_origin_requestTO {

	private String request_seq;
	private String request_title;
	private String request_category;
	private String user_email;
	private String user_nickname;

	public String getRequest_seq() {
		return request_seq;
	}
	public void setRequest_seq(String request_seq) {
		this.request_seq = request_seq;
	}
	public String getRequest_title() {
		return request_title;
	}
	public void setRequest_title(String request_title) {
		this.request_title = request_title;
	}
	public String getRequest_category() {
		return request_category;
	}
	public void setRequest_category(String request_category) {
		this.request_category = request_category;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
}
