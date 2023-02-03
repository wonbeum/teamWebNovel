package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class SearchController {
	
	@RequestMapping("novel_search.do")
	public ModelAndView search() {
		return new ModelAndView( "novel_search" );
	}
	
}
