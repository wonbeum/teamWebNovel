package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.OriginNovelDAO;
import com.example.model.admin_origin_requestTO;

@RestController
public class OriginNovelController {
	
	@Autowired
	private OriginNovelDAO ordao;
	
	@RequestMapping("origin_list.do")
	public ModelAndView orgin_list() {
		return new ModelAndView( "origin_list" );
	}

	@RequestMapping("origin_request_ok.do")
	public ModelAndView orgin_request_ok(HttpServletRequest request, HttpSession session) {
		//userInfoTO to = (userInfoTO)session.getAttribute("signIn");
		//String user_email = to.getUser_email();
		//String user_nickname = to.getUser_nickname();
		
		admin_origin_requestTO adorto = new admin_origin_requestTO();
		adorto.setRequest_title(request.getParameter("request_title"));
		adorto.setRequest_category(request.getParameter("request_category"));
		adorto.setUser_email(request.getParameter("user_email"));
		adorto.setUser_nickname(request.getParameter("user_nickname"));
		//to.setUser_email(user_email);
		//to.setUser_nickname(user_nickname);

		int flag = ordao.Origin_Request_Ok(adorto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "origin_request_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
}
