package com.example.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.NovelPagingTO;
import com.example.model.novel_listDAO;
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
	
	@RequestMapping("novel_detail1.do")
	public ModelAndView review() {
		return new ModelAndView( "novel_detail" );
	}
	
	@RequestMapping("ReviewListAll.do")
	public ArrayList<NovelPagingTO> ReviewListAll(HttpServletRequest request ){ 
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = rdao.Paging_reviewall_list(Lists);


		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	@RequestMapping("ReviewRomance.do")
	public ArrayList<NovelPagingTO> reviewRomance(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = rdao.Paging_reviewRomance(Lists);
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	@RequestMapping("ReviewRomanceFantasy.do")
	public ArrayList<NovelPagingTO> reviewRomanceFantasy(HttpServletRequest request) {

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = rdao.Paging_reviewromancefantasy(Lists);


		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	@RequestMapping("ReviewFantasy.do")
	public ArrayList<NovelPagingTO> reviewFantasy(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = rdao.Paging_reviewFantasy(Lists);


		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	@RequestMapping("/ReviewSearch.do")
	public ArrayList<NovelPagingTO> reviewsearch(HttpServletRequest request, String novel_title) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = rdao.Paging_reviewSearch(novel_title, Lists);
		
		reviewListTO to = new reviewListTO();
		to.setNovel_title(request.getParameter("novel_title"));
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
}
