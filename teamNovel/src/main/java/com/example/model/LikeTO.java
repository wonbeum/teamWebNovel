package com.example.model;

public class LikeTO {
	private String like_seq;
	private String free_seq;
	private String user_email;
	private String user_nickname;
	private String free_like;

	public String getFree_like() {
		return free_like;
	}
	public void setFree_like(String free_like) {
		this.free_like = free_like;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getLike_seq() {
		return like_seq;
	}
	public void setLike_seq(String like_seq) {
		this.like_seq = like_seq;
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
