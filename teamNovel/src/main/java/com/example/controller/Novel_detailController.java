package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.ReviewPagingTO;
import com.example.model.commentTO;
import com.example.model.freeboardTO;
import com.example.model.novel_detailDAO;
import com.example.model.novel_detailTO;
import com.example.model.reviewListDAO;
import com.example.model.reviewListTO;
import com.example.model.userInfoTO;

@RestController
public class Novel_detailController {
	
	@Autowired
	private novel_detailDAO ddao; 
	// novel_detail view
	@RequestMapping("novel_detail.do")
	public ModelAndView novel_detail_view(HttpServletRequest request) {	
		
		novel_detailTO to = new novel_detailTO();
		to.setNovel_title(request.getParameter("novel_title"));
		
		to = ddao.novel_detail_view(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "novel_detail" );
		modelAndView.addObject("to", to);
		return modelAndView;
	}
	// 리뷰쓰기
	@RequestMapping("review_write.do")
	public int review_write(HttpServletRequest request, HttpSession session) {
		userInfoTO to = (userInfoTO)session.getAttribute("signIn");
		String user_email = to.getUser_email();
		String user_nickname = to.getUser_nickname();
		
//		request.getParameter("review_content");
//		request.getParameter("review_star_grade");
//		
//		System.out.println(request.getParameter("review_content"));
		
		novel_detailTO dto = new novel_detailTO();
		dto.setReview_content(request.getParameter("review_content"));
		dto.setReview_ip(request.getRemoteAddr());
		dto.setReview_star_grade(request.getParameter("review_star_grade"));
		dto.setUser_email(user_email);
		dto.setNovel_title(request.getParameter("novel_title"));
		dto.setUser_nickname(user_nickname);
		
		String review_data = dto.getReview_date();
		dto.setReview_date(review_data);
		
		//System.out.println(request.getParameter("review_content"));
		int flag = ddao.novel_review_write_ok(dto);
		
		return flag;
	}
	 //리뷰 가져오기
	
	@RequestMapping("reviewlist.do")
	public ArrayList<ReviewPagingTO> review_list(HttpServletRequest request) {

		String novel_title = request.getParameter("novel_title");

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( " ") ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		ReviewPagingTO Lists = new ReviewPagingTO();
		Lists.setCpage(cpage);
		
		Lists = ddao.review_listPaging(Lists , novel_title);
		
		ArrayList<ReviewPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	@RequestMapping("review_recent.do")
	public ArrayList<ReviewPagingTO> review_recent(HttpServletRequest request) {

		String novel_title = request.getParameter("novel_title");

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( " ") ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		ReviewPagingTO Lists = new ReviewPagingTO();
		Lists.setCpage(cpage);
		
		Lists = ddao.review_recent(Lists , novel_title);
		
		ArrayList<ReviewPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	@RequestMapping("review_star_high.do")
	public ArrayList<ReviewPagingTO> review_star_high(HttpServletRequest request) {

		String novel_title = request.getParameter("novel_title");

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( " ") ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		ReviewPagingTO Lists = new ReviewPagingTO();
		Lists.setCpage(cpage);
		
		Lists = ddao.review_star_high(Lists , novel_title);
		
		ArrayList<ReviewPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	@RequestMapping("review_star_low.do")
	public ArrayList<ReviewPagingTO> review_star_low(HttpServletRequest request) {

		String novel_title = request.getParameter("novel_title");

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( " ") ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		ReviewPagingTO Lists = new ReviewPagingTO();
		Lists.setCpage(cpage);
		
		Lists = ddao.review_star_low(Lists , novel_title);
		
		ArrayList<ReviewPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	@RequestMapping("allreviewlist.do")
	public ArrayList<novel_detailTO> allreview_list(HttpServletRequest request) {
		
		String novel_title = request.getParameter("novel_title");
		ArrayList<novel_detailTO> reviewlists = ddao.review_list(novel_title);
		
		return reviewlists;
	}
}
