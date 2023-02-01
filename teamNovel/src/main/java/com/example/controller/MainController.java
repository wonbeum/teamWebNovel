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
public class MainController {

	@Autowired
	private novel_insert insertdao;
	
	@Autowired
	private kakao_rank kakao_rank;

	@RequestMapping("main.do")
	public ModelAndView main( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "main" );
		
		ArrayList<novelInfoTO> kr_list = kakao_rank.kakao_romance();
		ArrayList<novelInfoTO> kf_list = kakao_rank.kakao_fantasy();
		ArrayList<novelInfoTO> krf_list = kakao_rank.kakao_romancefantasy();
		
		modelAndView.addObject( "kr_list" , kr_list );
		modelAndView.addObject( "kf_list" , kf_list );
		modelAndView.addObject( "krf_list" , krf_list );
		
		return modelAndView;
	}
	
	@RequestMapping("test.do")
	public ModelAndView test() {
		insertdao.novelInsert();
		return new ModelAndView( "test" );
	}
	
	
}
