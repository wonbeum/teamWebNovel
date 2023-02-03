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
	
	@RequestMapping("test1.do")
	public ModelAndView test1() {
		insertdao.novel_ridiRomance_Insert();
		return new ModelAndView( "test2" );
	}

	@RequestMapping("test2.do")
	public ModelAndView test2() {
		insertdao.novel_ridiFantasy_Insert();
		return new ModelAndView( "test2" );
	}
	@RequestMapping("test3.do")
	public ModelAndView test3() {
		insertdao.novel_ridiRomanceFatasy_Insert();
		return new ModelAndView( "test2" );
	}
	@RequestMapping("test4.do")
	public ModelAndView test4() {
		insertdao.novel_kakaoRomance_Insert();
		return new ModelAndView( "test2" );
	}
	@RequestMapping("test5.do")
	public ModelAndView test5() {
		insertdao.novel_kakaoFantasy_Insert();
		return new ModelAndView( "test2" );
	}
	@RequestMapping("test6.do")
	public ModelAndView test6() {
		insertdao.novel_kakaoRomanceFantasy_Insert();
		return new ModelAndView( "test2" );
	}
	@RequestMapping("test7.do")
	public ModelAndView test7() {
		insertdao.novel_naverFantasy_Insert();
		return new ModelAndView( "test2" );
	}
	@RequestMapping("test8.do")
	public ModelAndView test8() {
		insertdao.novel_naverRomance_Insert();
		return new ModelAndView( "test2" );
	}
	@RequestMapping("test9.do")
	public ModelAndView test9() {
		insertdao.novel_naverRomanceFantasy_Insert();
		return new ModelAndView( "test2" );
	}
}
