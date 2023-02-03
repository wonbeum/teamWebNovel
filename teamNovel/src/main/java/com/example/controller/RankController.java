package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class RankController {
	

	@RequestMapping("rank_list.do")
	public ModelAndView rank_list() {
		return new ModelAndView( "rank_list" );
	}
	@RequestMapping( "rank.do" )
	public ModelAndView rank() {
		return new ModelAndView( "rank_list" );
	}
	
	
}
