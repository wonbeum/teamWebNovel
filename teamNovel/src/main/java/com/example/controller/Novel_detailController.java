package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.novel_detailDAO;
import com.example.model.novel_detailTO;
import com.example.model.reviewListDAO;
import com.example.model.reviewListTO;
import com.example.model.userInfoTO;

@RestController
public class Novel_detailController {
	
	@Autowired
	private novel_detailDAO ddao; 
	
	// novel_detail view
	@RequestMapping("novel_detail.do")
	public ModelAndView novel_detail_view(HttpServletRequest request) {	
		
		novel_detailTO to = new novel_detailTO();
		to.setNovel_title(request.getParameter("novel_title"));
		to = ddao.novel_detail_view(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "novel_detail" );
		modelAndView.addObject("to", to);
		return modelAndView;
	}
	
	@RequestMapping("detail_write_ok.do")
	public ModelAndView detail_write_ok(HttpServletRequest request, HttpSession session) {
		userInfoTO to = (userInfoTO)session.getAttribute("signIn");
		String user_email = to.getUser_email();
		String user_nickname = to.getUser_nickname();
		
		novel_detailTO dto = new novel_detailTO();
		dto.setReview_content(request.getParameter("review_content"));
		dto.setReview_ip(request.getRemoteAddr());
		dto.setReview_star_grade(request.getParameter("review_star_grade"));
		dto.setUser_email(user_email);
		dto.setNovel_title(request.getParameter("novel_title"));
		dto.setUser_nickname(user_nickname);

		int flag = ddao.novel_review_write_ok(dto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "detail_write_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
}
