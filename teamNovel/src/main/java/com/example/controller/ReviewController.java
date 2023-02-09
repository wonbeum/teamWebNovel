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
	
	@RequestMapping("ReviewListAll.do")
	public ArrayList<reviewListTO> ReviewListAll() {
		ArrayList<reviewListTO> reviewlists = rdao.reviewall_list();
		
		return reviewlists;
	}
	
	@RequestMapping("ReviewRomance.do")
	public ArrayList<reviewListTO> reviewRomance() {
		ArrayList<reviewListTO> reviewromance = rdao.reviewRomance();
		
		return reviewromance;
	}
	
	@RequestMapping("ReviewRomanceFantasy.do")
	public ArrayList<reviewListTO> reviewRomanceFantasy() {
		ArrayList<reviewListTO> reviewromancefantasy = rdao.reviewRomanceFantasy();
		
		return reviewromancefantasy;
	}
	
	@RequestMapping("ReviewFantasy.do")
	public ArrayList<reviewListTO> reviewFantasy() {
		ArrayList<reviewListTO> reviewfantasy = rdao.reviewFantasy();
		
		return reviewfantasy;
	}
	
	@RequestMapping("ReviewSearch.do")
	public ArrayList<reviewListTO> reaviewSearch() {
		ArrayList<reviewListTO> reviewsearch = rdao.reviewSearch();
				
		return reviewsearch;
	}
}
