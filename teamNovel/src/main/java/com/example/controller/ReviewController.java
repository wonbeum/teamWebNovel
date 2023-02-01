package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.FreeBoardDAO;
import com.example.model.RegisterDAO;
import com.example.model.freeboardTO;
import com.example.model.kakao_rank;
import com.example.model.loginDAO;
import com.example.model.novelInfoTO;
import com.example.model.novel_insert;
import com.example.model.userInfoTO;
import com.example.model.user_adminDAO;

@RestController
public class ReviewController {
	
	
	@RequestMapping("review_list.do")
	public ModelAndView review_list() {
		return new ModelAndView( "review_list" );
	}
	
	@RequestMapping("novel_review.do")
	public ModelAndView review() {
		return new ModelAndView( "novel_review" );
	}

	
}
