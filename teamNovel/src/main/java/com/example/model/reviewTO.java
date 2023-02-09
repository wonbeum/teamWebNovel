package com.example.model;

public class reviewTO {
	private String review_seq;
	private String review_content;
	private String review_date;
	private String review_ip;
	private String review_star_grade;
	
	private String user_email;
	private String user_nickname;
	
	private String novel_title;
	
	public String getReview_seq() {
		return review_seq;
	}
	
	public void setReview_seq(String review_seq) {
		this.review_seq = review_seq;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getReview_ip() {
		return review_ip;
	}
	public void setReview_ip(String review_ip) {
		this.review_ip = review_ip;
	}
	public String getReview_star_grade() {
		return review_star_grade;
	}
	public void setReview_star_grade(String review_star_grade) {
		this.review_star_grade = review_star_grade;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getNovel_title() {
		return novel_title;
	}
	public void setNovel_title(String novel_title) {
		this.novel_title = novel_title;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	
}
