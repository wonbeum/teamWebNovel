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
public class AdminController {
	
	@Autowired
	private user_adminDAO userdao;
	
	
	@RequestMapping("admin_member_list.do")
	public ModelAndView admiadmin_member_list( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_member_list" );
		
		ArrayList<userInfoTO > userLists = userdao.userLists();
		
		modelAndView.addObject( "userLists" , userLists );
		
		return modelAndView;
	}
	
	@RequestMapping("admin_member_view.do")
	public ModelAndView admin_member_view( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_member_view" );

		userInfoTO to = new userInfoTO();
		to.setUser_email( request.getParameter( "email" ) );
		to = userdao.userView(to);
		
		modelAndView.addObject( "to" , to );
		
		return modelAndView;
	}
	@RequestMapping("admin_orgin_request_list.do")
	public ModelAndView admin_orgin_request_list() {
		return new ModelAndView( "admin_orgin_request_list" );
	}
	@RequestMapping("admin_member_modify.do")
	public ModelAndView admin_member_modify() {
		return new ModelAndView( "admin_member_modify" );
	}

	@RequestMapping("admin_board_list.do")
	public ModelAndView admin_board_list() {
		return new ModelAndView( "admin_board_list" );
	}

	@RequestMapping("admin_board_view.do")
	public ModelAndView admin_board_view() {
		return new ModelAndView( "admin_board_view" );
	}

	@RequestMapping("admin_board_write.do")
	public ModelAndView admin_board_write() {
		return new ModelAndView( "admin_board_write" );
	}
	
}
