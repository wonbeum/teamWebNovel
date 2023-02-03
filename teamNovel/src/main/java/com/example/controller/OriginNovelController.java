package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class OriginNovelController {
	
	@RequestMapping("origin_list.do")
	public ModelAndView orgin_list() {
		return new ModelAndView( "origin_list" );
	}

	
	
}
