package com.example.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class controller {
	@RequestMapping("mainframe.do")
	public ModelAndView mainframe() {
		return new ModelAndView( "mainframe" );
	}
	@RequestMapping("adminframe.do")
	public ModelAndView adminframe() {
		return new ModelAndView( "adminframe" );
	}
}
