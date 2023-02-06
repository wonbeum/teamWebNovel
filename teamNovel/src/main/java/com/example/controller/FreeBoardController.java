package com.example.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.CommentDAO;
import com.example.model.FreeBoardDAO;
import com.example.model.commentTO;
import com.example.model.freeboardTO;
import com.example.model.userInfoTO;

@RestController
public class FreeBoardController {

	
	@Autowired
	private FreeBoardDAO fdao;
	
	@Autowired
	private CommentDAO cdao;

	
	@RequestMapping("board_list.do")
	public ModelAndView board_list() {
		return new ModelAndView( "board_list" );
	}
	
	// ajax 전체 리스트 가져오기
	@RequestMapping("BoardListAjax.do")
	public ArrayList<freeboardTO> boardListAjax() {
		ArrayList<freeboardTO> boardList = fdao.FreeBoard_list();
		
		return boardList;
	}
	
	// ajax 공지 리스트 가져오기
		@RequestMapping("NoticeListAjax.do")
		public ArrayList<freeboardTO> NoticeListAjax() {
			ArrayList<freeboardTO> boardList = fdao.Notice_list("free_category","공지");
			
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

	// 댓글 작성 ajax
	@RequestMapping("CommentWriteAjax.do")
	public int CommentWriteAjax(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String cmt_content = request.getParameter("cmt_content");
		String free_seq = request.getParameter("free_seq");
		
		userInfoTO to = (userInfoTO)session.getAttribute("signIn");
		String user_email = to.getUser_email();
		String user_nickname = to.getUser_nickname();
		
		commentTO cto = new commentTO();
		cto.setCmt_content(cmt_content);
		cto.setUser_email(user_email);
		cto.setFree_seq(free_seq);
		cto.setUser_nickname(user_nickname);
		
		int flag = cdao.Comment_Write_Ok(cto);
		
		return flag;
	}
	
	// ajax 리스트 가져오기
	@RequestMapping("CommentListAjax.do")
	public ArrayList<commentTO> CommentListAjax(HttpServletRequest request) {
		String free_seq = request.getParameter("free_seq");
		ArrayList<commentTO> commentList = cdao.Comment_list(free_seq);
		
		return commentList;
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

	
	
}
