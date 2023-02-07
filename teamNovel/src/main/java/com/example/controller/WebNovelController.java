package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.novelInfoTO;
import com.example.model.novel_listDAO;

@RestController
public class WebNovelController {
	
	@Autowired
	private novel_listDAO noveldao;

	@RequestMapping("novel_list.do")
	public ModelAndView novel_list( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "novel_list" );
		
		ArrayList<novelInfoTO> Lists = noveldao.kakao_romance();
		
		modelAndView.addObject("Lists", Lists);
		
		
		return modelAndView;
	}
	
}
