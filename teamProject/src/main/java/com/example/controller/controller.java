package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.loginDAO;
import com.example.model.userInfoTO;

@RestController
public class controller {
	
	@Autowired
	private loginDAO dao;
	
	@RequestMapping("main.do")
	public ModelAndView main() {
		return new ModelAndView( "main" );
	}
	@RequestMapping("board_list.do")
	public ModelAndView board_list() {
		return new ModelAndView( "board_list" );
	}

	@RequestMapping("novel_list.do")
	public ModelAndView novel_list() {
		return new ModelAndView( "novel_list" );
	}

	@RequestMapping("rank_list.do")
	public ModelAndView rank_list() {
		return new ModelAndView( "rank_list" );
	}
	@RequestMapping("origin_list.do")
	public ModelAndView orgin_list() {
		return new ModelAndView( "origin_list" );
	}
	@RequestMapping("review_list.do")
	public ModelAndView review_list() {
		return new ModelAndView( "review_list" );
	}
	@RequestMapping("login.do")
	public ModelAndView login() {
		return new ModelAndView( "login" );
	}
	
	@RequestMapping( "login_ok.do" )
	public ModelAndView signIn(HttpServletRequest request) {
		
		userInfoTO to = new userInfoTO();
		
		to.setUser_email( request.getParameter("user_email") );
		to.setUser_password( request.getParameter("user_password") );
		
		userInfoTO signIn = dao.login(to);
		System.out.println( signIn.getUser_nickname() );
		HttpSession session = request.getSession();
		if( signIn.getUser_nickname() != null) {
			session.setAttribute("signIn", signIn);
		} else {
			session.setAttribute("signIn", null);
		}
		return new ModelAndView( "login_ok" );
	}
	
	@RequestMapping( "rank.do" )
	public ModelAndView rank() {
		return new ModelAndView( "rank_list" );
	}
	
	@RequestMapping( "logout.do" )
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView( "main" );
	}

	@RequestMapping("register.do")
	public ModelAndView register() {
		return new ModelAndView( "register" );
	}
	@RequestMapping("register_ok.do")
	public ModelAndView register_ok() {
		return new ModelAndView( "register_ok" );
	}
}
