package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class requestTO {
	private String request_seq;
	private String request_title;
	private String request_category;
	private String free_like;
	private String user_email;
}
