package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.FreeBoardDAO;
import com.example.model.RegisterDAO;
import com.example.model.freeboardTO;
import com.example.model.kakao_rank;
import com.example.model.loginDAO;
import com.example.model.novelInfoTO;
import com.example.model.novel_insert;
import com.example.model.userInfoTO;
import com.example.model.user_adminDAO;

@RestController
public class controller {
	
	@Autowired
	private loginDAO dao;
	@Autowired
	private user_adminDAO userdao;
	@Autowired
	private kakao_rank kakao_rank;
	
	@Autowired
	private novel_insert insertdao;

	@Autowired
	private RegisterDAO rdao;
	
	@Autowired
	private FreeBoardDAO fdao;
	
	
	@RequestMapping("main.do")
	public ModelAndView main( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "main" );
		
		ArrayList<novelInfoTO> kr_list = kakao_rank.kakao_romance();
		ArrayList<novelInfoTO> kf_list = kakao_rank.kakao_fantasy();
		ArrayList<novelInfoTO> krf_list = kakao_rank.kakao_romancefantasy();
		
		modelAndView.addObject( "kr_list" , kr_list );
		modelAndView.addObject( "kf_list" , kf_list );
		modelAndView.addObject( "krf_list" , krf_list );
		
		return modelAndView;
	}

	@RequestMapping("novel_list.do")
	public ModelAndView novel_list() {
		return new ModelAndView( "novel_list" );
	}

	@RequestMapping("rank_list.do")
	public ModelAndView rank_list() {
		return new ModelAndView( "rank_list" );
	}
	@RequestMapping("origin_list.do")
	public ModelAndView orgin_list() {
		return new ModelAndView( "origin_list" );
	}
	@RequestMapping("review_list.do")
	public ModelAndView review_list() {
		return new ModelAndView( "review_list" );
	}
	@RequestMapping("login.do")
	public ModelAndView login() {
		return new ModelAndView( "login" );
	}
	
	@RequestMapping( "login_ok.do" )
	public ModelAndView signIn(HttpServletRequest request) {
		
		userInfoTO to = new userInfoTO();
		
		to.setUser_email( request.getParameter("user_email") );
		to.setUser_password( request.getParameter("user_password") );
		
		userInfoTO signIn = dao.login(to);
		System.out.println( signIn.getUser_nickname() );
		HttpSession session = request.getSession();
		if( signIn.getUser_nickname() != null) {
			session.setAttribute("signIn", signIn);
		} else {
			session.setAttribute("signIn", null);
		}
		return new ModelAndView( "login_ok" );
	}
	
	@RequestMapping( "rank.do" )
	public ModelAndView rank() {
		return new ModelAndView( "rank_list" );
	}
	
	@RequestMapping( "logout.do" )
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView( "main" );
	}

	@RequestMapping("register.do")
	public ModelAndView register() {
		return new ModelAndView( "register" );
	}
	@RequestMapping("register_ok.do")
	public ModelAndView register_ok(HttpServletRequest request) {
		userInfoTO to = new userInfoTO();
		to.setUser_email(request.getParameter("user_email"));
		to.setUser_nickname(request.getParameter("user_nickname"));
		to.setUser_password(request.getParameter("user_password"));
		to.setUser_gender(request.getParameter("user_gender"));
		to.setUser_birth(request.getParameter("user_birth"));

		int flag = rdao.registerOk(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "register_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	@RequestMapping("admin_member_list.do")
	public ModelAndView admiadmin_member_list( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_member_list" );
		
		ArrayList<userInfoTO > userLists = userdao.userLists();
		
		modelAndView.addObject( "userLists" , userLists );
		
		return modelAndView;
	}
	@RequestMapping("admin_member_view.do")
	public ModelAndView admin_member_view( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_member_view" );

		userInfoTO to = new userInfoTO();
		to.setUser_email( request.getParameter( "email" ) );
		to = userdao.userView(to);
		
		modelAndView.addObject( "to" , to );
		
		return modelAndView;
	}
	@RequestMapping("admin_orgin_request_list.do")
	public ModelAndView admin_orgin_request_list() {
		return new ModelAndView( "admin_orgin_request_list" );
	}
	@RequestMapping("admin_member_modify.do")
	public ModelAndView admin_member_modify() {
		return new ModelAndView( "admin_member_modify" );
	}
	

	@RequestMapping("board_list.do")
	public ModelAndView board_list() {
		return new ModelAndView( "board_list" );
	}
	
	// ajax 리스트 가져오기
	@RequestMapping("BoardListAjax.do")
	public ArrayList<freeboardTO> boardListAjax() {
		ArrayList<freeboardTO> boardList = fdao.FreeBoard_list();
		
		return boardList;
	}
	
	@RequestMapping("board_write.do")
	public ModelAndView board_write(HttpServletRequest request, HttpServletResponse response) {	
		return new ModelAndView( "board_write" );
	}
	
	@RequestMapping("board_write_ok.do")
	public ModelAndView board_write_ok(HttpServletRequest request, HttpSession session) {
		userInfoTO to = (userInfoTO)session.getAttribute("signIn");
		String user_email = to.getUser_email();
		String user_nickname = to.getUser_nickname();
		
		freeboardTO fto = new freeboardTO();
		fto.setFree_category(request.getParameter("free_category"));
		fto.setFree_subject(request.getParameter("free_subject"));
		fto.setFree_content(request.getParameter("free_content"));
		fto.setFree_ip(request.getRemoteAddr());
		fto.setUser_email(user_email);
		fto.setUser_nickname(user_nickname);

		int flag = fdao.FreeBoard_Write_Ok(fto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "board_write_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}

	@RequestMapping( "board_view.do" )
	public ModelAndView board_view(HttpServletRequest request) {
		freeboardTO to = new freeboardTO();
		to.setFree_seq(request.getParameter("seq"));
		to = fdao.FreeBoard_View(to);
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "board_view" );
		modelAndView.addObject("to", to);
		return modelAndView;
	}
	
	@RequestMapping("board_modify.do")
	public ModelAndView board_modify(HttpServletRequest request) {	
		freeboardTO to = new freeboardTO();
		to.setFree_seq(request.getParameter("seq"));
		to = fdao.FreeBoard_Modify(to);
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "board_modify" );
		modelAndView.addObject("to", to);
		return modelAndView;
	}
	
	@RequestMapping("board_modify_ok.do")
	public ModelAndView board_modify_ok(HttpServletRequest request) {
		
		freeboardTO to = new freeboardTO();
		to.setFree_seq(request.getParameter("seq"));
		to.setFree_category(request.getParameter("free_category"));
		to.setFree_subject(request.getParameter("free_subject"));
		to.setFree_content(request.getParameter("free_content"));

		int flag = fdao.FreeBoard_Modify_Ok(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "board_modify_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	@RequestMapping("board_delete_ok.do")
	public ModelAndView board_delete_ok(HttpServletRequest request) {
		
		freeboardTO to = new freeboardTO();
		to.setFree_seq(request.getParameter("seq"));

		int flag = fdao.FreeBoard_Delete_Ok(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "board_delete_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}

	@RequestMapping("admin_board_list.do")
	public ModelAndView admin_board_list() {
		return new ModelAndView( "admin_board_list" );
	}

	@RequestMapping("admin_board_view.do")
	public ModelAndView admin_board_view() {
		return new ModelAndView( "admin_board_view" );
	}

	@RequestMapping("admin_board_write.do")
	public ModelAndView admin_board_write() {
		return new ModelAndView( "admin_board_write" );
	}

	@RequestMapping("novel_search.do")
	public ModelAndView search() {
		return new ModelAndView( "novel_search" );
	}
	
	@RequestMapping("novel_review.do")
	public ModelAndView review() {
		return new ModelAndView( "novel_review" );
	}
	
	@RequestMapping("test.do")
	public ModelAndView test() {
		insertdao.novelInsert();
		return new ModelAndView( "test" );
	}
	
	
}
