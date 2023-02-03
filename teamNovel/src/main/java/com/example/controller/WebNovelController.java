package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class WebNovelController {
	

	@RequestMapping("novel_list.do")
	public ModelAndView novel_list() {
		return new ModelAndView( "novel_list" );
	}
	
}
