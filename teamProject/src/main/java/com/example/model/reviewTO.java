package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class reviewTO {
	private String review_seq;
	private String review_content;
	private String review_date;
	private String review_ip;
	private String review_star_grade;
	private String user_email;
	private String novel_title;
}
