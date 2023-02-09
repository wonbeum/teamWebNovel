package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.NovelPagingTO;
import com.example.model.novelInfoTO;
import com.example.model.novel_rank_listDAO;

@RestController
public class RankController {

	@Autowired
	private novel_rank_listDAO rank_lists;

	@RequestMapping("rank_list.do")
	public ModelAndView rank_list() {
		return new ModelAndView( "rank_list" );
	}
	
	@RequestMapping("novel_rank_kakao_romance.do")
	public ArrayList<novelInfoTO> novel_list_kr( HttpServletRequest request ) {
		
		ArrayList<novelInfoTO> result = new ArrayList<>();
		
		result = rank_lists.kakao_rank_romance();
		
		return result; 
	}

	@RequestMapping("novel_rank_kakao_fantasy.do")
	public ArrayList<novelInfoTO> novel_list_kf( HttpServletRequest request ) {
		
		ArrayList<novelInfoTO> result = new ArrayList<>();
		
		result = rank_lists.kakao_rank_fantasy();
		
		return result; 
	}

	@RequestMapping("novel_rank_kakao_romancefantasy.do")
	public ArrayList<novelInfoTO> novel_list_krf( HttpServletRequest request ) {
		
		ArrayList<novelInfoTO> result = new ArrayList<>();
		
		result = rank_lists.kakao_rank_romancefantasy();
		
		return result; 
	}
	

	@RequestMapping("novel_rank_naver_romance.do")
	public ArrayList<novelInfoTO> novel_list_nr( HttpServletRequest request ) {
		
		ArrayList<novelInfoTO> result = new ArrayList<>();
		
		result = rank_lists.naver_rank_romance();
		
		return result; 
	}

	@RequestMapping("novel_rank_naver_fantasy.do")
	public ArrayList<novelInfoTO> novel_list_nf( HttpServletRequest request ) {
		
		ArrayList<novelInfoTO> result = new ArrayList<>();
		
		result = rank_lists.naver_rank_fantasy();
		
		return result; 
	}

	@RequestMapping("novel_rank_naver_romancefantasy.do")
	public ArrayList<novelInfoTO> novel_list_nrf( HttpServletRequest request ) {
		
		ArrayList<novelInfoTO> result = new ArrayList<>();
		
		result = rank_lists.naver_rank_romancefantasy();
		
		return result; 
	}
	
}
