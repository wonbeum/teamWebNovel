package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.reviewListDAO;
import com.example.model.reviewListTO;

@RestController
public class ReviewController {
	
	@Autowired
	private reviewListDAO rdao;
	
	@RequestMapping("review_list.do")
	public ModelAndView review_list() {
		return new ModelAndView( "review_list" );
	}
	
	@RequestMapping("novel_review.do")
	public ModelAndView review() {
		return new ModelAndView( "novel_review" );
	}
	
	@RequestMapping("ReviewListAll.do")
	public ArrayList<reviewListTO> ReviewListAll() {
		ArrayList<reviewListTO> reviewlists = rdao.reviewall_list();
		
		return reviewlists;
	}
	
}
