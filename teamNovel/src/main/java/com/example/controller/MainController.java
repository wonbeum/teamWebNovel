package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
		
		ArrayList<novelInfoTO> kr_list = novel_rank.kakao_romance();
		ArrayList<novelInfoTO> kf_list = novel_rank.kakao_fantasy();
		ArrayList<novelInfoTO> krf_list = novel_rank.kakao_romancefantasy();
		
		modelAndView.addObject( "kr_list" , kr_list );
		modelAndView.addObject( "kf_list" , kf_list );
		modelAndView.addObject( "krf_list" , krf_list );
		

//		ArrayList<novelInfoTO> nr_list = novel_rank.naver_romace();
//		ArrayList<novelInfoTO> nf_list = novel_rank.naver_fantasy();
//		ArrayList<novelInfoTO> nrf_list = novel_rank.naver_romacefantasy();
//		
//		modelAndView.addObject( "kr_list" , nr_list );
//		modelAndView.addObject( "kf_list" , nf_list );
//		modelAndView.addObject( "krf_list" , nrf_list );
		
		return modelAndView;
	}

	@RequestMapping("test.do")
	public ModelAndView test() {
		novel_rank.naver_romace();
		return new ModelAndView( "test" );
	}
	
	@RequestMapping("insert.do")
	public ModelAndView inserttest1() {
		insertdao.novel_ridiRomance_Insert();
		insertdao.novel_ridiFantasy_Insert();
		insertdao.novel_ridiRomanceFatasy_Insert();
		insertdao.novel_kakaoRomance_Insert();
		insertdao.novel_kakaoFantasy_Insert();
		insertdao.novel_kakaoRomanceFantasy_Insert();
		insertdao.novel_naverFantasy_Insert();
		insertdao.novel_naverRomance_Insert();
		insertdao.novel_naverRomanceFantasy_Insert();
		return new ModelAndView( "test2" );
	}
}
