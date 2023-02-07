package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.novel_rank_listDAO;

@RestController
public class RankController {

	@Autowired
	private novel_rank_listDAO rank_lists;

	@RequestMapping("rank_list.do")
	public ModelAndView rank_list() {
//		rank_lists.kakao_rank_romance();
//		rank_lists.naver_rank_romance();
		rank_lists.ridi_rank_romance();
		return new ModelAndView( "rank_list" );
	}
	@RequestMapping( "rank.do" )
	public ModelAndView rank() {
		return new ModelAndView( "rank_list" );
	}
	
	
}
