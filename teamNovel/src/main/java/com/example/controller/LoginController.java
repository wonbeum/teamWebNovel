package com.example.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.RegisterDAO;
import com.example.model.loginDAO;
import com.example.model.userInfoTO;

@RestController
public class LoginController {
	
	@Autowired
	private loginDAO dao;
	
	@Autowired
	private RegisterDAO rdao;
	
	
	@RequestMapping("login.do")
	public ModelAndView login() {
		return new ModelAndView( "login" );
	}
	
	@RequestMapping( "login_ok.do" )
	public ModelAndView signIn(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login_ok" );
		
		userInfoTO to = new userInfoTO();
		
		to.setUser_email( request.getParameter("user_email") );
		to.setUser_password( request.getParameter("user_password") );
		
		userInfoTO signIn = dao.login(to);
//		System.out.println( signIn.getUser_nickname() );
		HttpSession session = request.getSession();
		if( signIn.getUser_nickname() != null) {
			session.setAttribute("signIn", signIn);
			modelAndView.addObject("grade", "user");
		} else {
			session.setAttribute("signIn", null);
		}
		return modelAndView;
	}
	
	@RequestMapping("adminlogin_ok.do")
	public ModelAndView adminsignIn(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login_ok" );
		
		userInfoTO to = new userInfoTO();
		
		to.setUser_email( request.getParameter("user_email") );
		to.setUser_password( request.getParameter("user_password") );
		
		userInfoTO signIn = dao.adminlogin(to);
//		System.out.println( signIn.getUser_nickname() );
//		System.out.println( signIn.getUser_grade() );
		HttpSession session = request.getSession();
		if( signIn.getUser_nickname() != null) {
			session.setAttribute("signIn", signIn);
			modelAndView.addObject("grade", "master");
		} else {
			session.setAttribute("signIn", null);
		}
		return modelAndView;
	}
	
	@RequestMapping( "logout.do" )
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView( "redirect:/main.do" );
	}

	@RequestMapping("register.do")
	public ModelAndView register() {
		return new ModelAndView( "register" );
	}
	
	@RequestMapping("register_ok.do")
	public ModelAndView register_ok(HttpServletRequest request) {
		userInfoTO to = new userInfoTO();
		to.setUser_email(request.getParameter("user_email"));
		to.setUser_nickname(request.getParameter("user_nickname"));
		to.setUser_password(request.getParameter("user_password"));
		to.setUser_gender(request.getParameter("user_gender"));
		to.setUser_birth(request.getParameter("user_birth"));

		int flag = rdao.registerOk(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "register_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	

	@RequestMapping("reset_password.do")
	public ModelAndView reset_password() {
		return new ModelAndView("reset_password");
	}

	@RequestMapping("reset_password_ok.do")
	public ModelAndView reset_password_ok(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("reset_password_ok");

		userInfoTO to = new userInfoTO();

		to.setUser_email(request.getParameter("user_email"));
		to.setUser_password(request.getParameter("user_birth"));

		int flag = dao.user_reset_password(to);

		modelAndView.addObject( "flag" , flag );
		
		return modelAndView;
	}
	
}
