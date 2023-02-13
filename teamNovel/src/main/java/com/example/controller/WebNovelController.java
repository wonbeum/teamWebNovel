package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.NovelPagingTO;
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
		
		return modelAndView;
	}
	
	@RequestMapping("novel_list_kakao_romance.do")
	public ArrayList<NovelPagingTO> novel_list_kr( HttpServletRequest request ) {

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = noveldao.kakao_romance( Lists );
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result; 
	}

	@RequestMapping("novel_list_kakao_fantasy.do")
	public ArrayList<NovelPagingTO> novel_list_kf( HttpServletRequest request ) {
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = noveldao.kakao_fantasy( Lists );
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result; 
	}

	@RequestMapping("novel_list_kakao_romancefantasy.do")
	public ArrayList<NovelPagingTO> novel_list_krf( HttpServletRequest request ) {
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = noveldao.kakao_romancefantasy( Lists );
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result; 
	}

	@RequestMapping("novel_list_naver_romance.do")
	public ArrayList<NovelPagingTO> novel_list_nr( HttpServletRequest request ) {
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = noveldao.naver_romance( Lists );
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result; 
	}

	@RequestMapping("novel_list_naver_fantasy.do")
	public ArrayList<NovelPagingTO> novel_list_nf( HttpServletRequest request ) {
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = noveldao.naver_fantasy( Lists );
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result; 
	}

	@RequestMapping("novel_list_naver_romancefantasy.do")
	public ArrayList<NovelPagingTO> novel_list_nrf( HttpServletRequest request ) {
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = noveldao.naver_romancefantasy( Lists );
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result; 
	}
	
	@RequestMapping("novel_list_search.do")
	public ArrayList<NovelPagingTO> novel_list_search( HttpServletRequest request ) {
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}

		String search = request.getParameter("search");
		
		NovelPagingTO Lists = new NovelPagingTO();
		Lists.setCpage( cpage );
		
		Lists = noveldao.search_list( Lists ,search );
		
		ArrayList<NovelPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result; 
	}
}
