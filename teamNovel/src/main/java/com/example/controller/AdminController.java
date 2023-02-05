package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.CommentDAO;
import com.example.model.FreeBoardDAO;
import com.example.model.admin_origin_requestDAO;
import com.example.model.admin_origin_requestTO;
import com.example.model.commentTO;
import com.example.model.freeboardTO;
import com.example.model.userInfoTO;
import com.example.model.user_adminDAO;

@RestController
public class AdminController {
	@Autowired
	private user_adminDAO userdao;
	@Autowired
	private admin_origin_requestDAO aordao;
	@Autowired
	private FreeBoardDAO fdao;
	@Autowired
	private CommentDAO cdao;
	
	@RequestMapping("admin_main.do")
	public ModelAndView admin_main(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_main" );
		
		ArrayList<userInfoTO > userLists = userdao.userLists();
		ArrayList<freeboardTO > boardLists = fdao.FreeBoard_list();
		modelAndView.addObject( "userLists" , userLists );
		modelAndView.addObject( "boardLists" , boardLists );
		
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
	@RequestMapping("admin_origin_request_list.do")
	public ModelAndView admin_orgin_request_list() {
		return new ModelAndView( "admin_origin_request_list" );
	}
	@RequestMapping("admin_origin_request_list_delete_ok.do")
	public ModelAndView admin_orgin_request_list_delete_ok(HttpServletRequest request) {
		
		admin_origin_requestTO to = new admin_origin_requestTO();
		to.setRequest_seq(request.getParameter("seq"));

		int flag = aordao.origin_request_delete_Ok(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "origin_request_delete_Ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	@RequestMapping("admin_member_modify.do")
	public ModelAndView admin_member_modify() {
		return new ModelAndView( "admin_member_modify" );
	}

	@RequestMapping("admin_board_list.do")
	public ModelAndView admin_board_list( HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_board_list" );
		
		ArrayList<freeboardTO> boardLists = fdao.FreeBoard_list();
		modelAndView.addObject( "boardLists" , boardLists );

		return modelAndView;
	}

	@RequestMapping("admin_board_view.do")
	public ModelAndView admin_board_view(HttpServletRequest request) {
		freeboardTO to = new freeboardTO();
		to.setFree_seq(request.getParameter("seq"));
		to = fdao.FreeBoard_View(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_board_view" );
		modelAndView.addObject("to", to);
		return modelAndView;
	}
	
	// 댓글 ajax 가져오기
	@RequestMapping("AdminCommentListAjax.do")
	public ArrayList<commentTO> CommentListAjax(HttpServletRequest request) {
		String free_seq = request.getParameter("free_seq");
		ArrayList<commentTO> commentList = cdao.Comment_list(free_seq);
		
		return commentList;
	}

	@RequestMapping("admin_board_write.do")
	public ModelAndView admin_board_write() {
		return new ModelAndView( "admin_board_write" );
	}
	
	@RequestMapping("admin_board_write_ok.do")
	public ModelAndView admin_board_write_ok(HttpServletRequest request) {
		//userInfoTO to = (userInfoTO)session.getAttribute("signIn");
		String user_email = "root";
		String user_nickname = "관리자";

		freeboardTO fto = new freeboardTO();

		fto.setFree_category(request.getParameter("admin_board_category"));
		fto.setFree_subject(request.getParameter("admin_board_subject"));
		fto.setFree_content(request.getParameter("admin_board_content"));
		fto.setFree_ip(request.getRemoteAddr());
		fto.setUser_email(user_email);
		fto.setUser_nickname(user_nickname);
				
		int flag = fdao.FreeBoard_Write_Ok(fto);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_board_write_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	@RequestMapping("admin_board_delete_ok.do")
	public ModelAndView admin_board_delete_ok(HttpServletRequest request) {
		
		freeboardTO to = new freeboardTO();
		to.setFree_seq(request.getParameter("seq"));

		int flag = fdao.FreeBoard_Delete_Ok(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_board_delete_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	@RequestMapping("admin_review_list.do")
	public ModelAndView admin_review_list() {
		return new ModelAndView( "admin_review_list" );
	}
	
	@RequestMapping("admin_review_view.do")
	public ModelAndView admin_review_view() {
		return new ModelAndView( "admin_review_view" );
	}
	
	@RequestMapping("admin_review_delete_ok.do")
	public ModelAndView admin_review_delete_ok() {
		return new ModelAndView( "admin_review_delete_ok" );
	}
}
