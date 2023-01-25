package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class commentTO {
	private String cmt_seq;
	private String cmt_content;
	private String cmt_date;
	private String cmt_status;
	private String user_email;
	private String free_seq;
}
