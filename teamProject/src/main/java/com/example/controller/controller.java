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
	@RequestMapping("login.do")
	public ModelAndView login() {
		return new ModelAndView( "login" );
	}
	@RequestMapping("test.do")
	public ModelAndView test() {
		return new ModelAndView( "test" );
	}
}
