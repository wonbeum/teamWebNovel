package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.mainRankTO;
import com.example.model.main_novel_rank;
import com.example.model.novelInfoTO;
import com.example.model.novel_insert;

@RestController
public class MainController {

	@Autowired
	private novel_insert insertdao;
	
	@Autowired
	private main_novel_rank novel_rank;

	@RequestMapping("main.do")
	public ModelAndView main( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "main" );
		
		return modelAndView;
	}

	@RequestMapping("novel_main_kakaolists.do")
	public ArrayList<mainRankTO> novel_main_kakaolists( HttpServletRequest request ) {
		
		ArrayList<mainRankTO> result = new ArrayList<>();
		
		mainRankTO to = novel_rank.kakao_romance();
		result.add(to);
		to = novel_rank.kakao_fantasy();
		result.add(to);
		to = novel_rank.kakao_romancefantasy();
		result.add(to);
		
		return result;
	}

	@RequestMapping("novel_main_naverlists.do")
	public ArrayList<mainRankTO> novel_main_naverlists( HttpServletRequest request ) {
		
		ArrayList<mainRankTO> result = new ArrayList<>();
		
		mainRankTO to = novel_rank.naver_romace();
		result.add(to);
		to = novel_rank.naver_fantasy();
		result.add(to);
		to = novel_rank.naver_romacefantasy();
		result.add(to);
		
		return result;
	}
	
	@RequestMapping("insert.do")
	public ModelAndView inserttest1() {
//		insertdao.novel_kakaoRomance_Insert();
//		insertdao.novel_kakaoFantasy_Insert();
//		insertdao.novel_kakaoRomanceFantasy_Insert();
//		insertdao.novel_naverFantasy_Insert();
		insertdao.novel_naverRomance_Insert();
//		insertdao.novel_naverRomanceFantasy_Insert();
		return new ModelAndView( "test2" );
	}
}
