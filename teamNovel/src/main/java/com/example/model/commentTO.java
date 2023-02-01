package com.example.model;

public class commentTO {
	private String cmt_seq;
	private String cmt_content;
	private String cmt_date;
	private String cmt_status;
	private String user_email;
	private String free_seq;
	private String user_nickname;

	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getCmt_seq() {
		return cmt_seq;
	}
	public void setCmt_seq(String cmt_seq) {
		this.cmt_seq = cmt_seq;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	public String getCmt_status() {
		return cmt_status;
	}
	public void setCmt_status(String cmt_status) {
		this.cmt_status = cmt_status;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getFree_seq() {
		return free_seq;
	}
	public void setFree_seq(String free_seq) {
		this.free_seq = free_seq;
	}
	
}
