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
import com.example.model.FreeBoardPagingTO;
import com.example.model.LikeDAO;
import com.example.model.LikeTO;
import com.example.model.commentTO;
import com.example.model.freeboardTO;
import com.example.model.userInfoTO;

@RestController
public class FreeBoardController {

	
	@Autowired
	private FreeBoardDAO fdao;
	
	@Autowired
	private CommentDAO cdao;

	@Autowired
	private LikeDAO ldao;

	
	@RequestMapping("board_list.do")
	public ModelAndView board_list() {
		return new ModelAndView( "board_list" );
	}
	
	// ajax 전체 리스트 가져오기 + pagination
	@RequestMapping("BoardListAjax.do")
	public ArrayList<FreeBoardPagingTO> boardListAjax(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		// cpage (현재페이지) 받아와서 Dao 거쳐서 출력
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		Lists = fdao.FreeBoard_List(Lists);
		
		ArrayList<FreeBoardPagingTO> boardList = new ArrayList<FreeBoardPagingTO>();
		boardList.add(Lists);
		
		return boardList;
	}

	// ajax 공지 리스트 가져오기 + pagination
	@RequestMapping("NoticeListAjax.do")
	public ArrayList<FreeBoardPagingTO> NoticeListAjax(HttpServletRequest request) {
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		// cpage (현재페이지) 받아와서 Dao 거쳐서 출력
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		Lists = fdao.Notice_list(Lists);
		
		ArrayList<FreeBoardPagingTO> boardList = new ArrayList<FreeBoardPagingTO>();
		boardList.add(Lists);
		
		return boardList;
		}
	
	// ajax 인기글 리스트 가져오기 + pagination
	@RequestMapping("BestListAjax.do")
	public ArrayList<FreeBoardPagingTO> BestListAjax(HttpServletRequest request) {
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		// cpage (현재페이지) 받아와서 Dao 거쳐서 출력
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		Lists = fdao.Best_list(Lists);
		
		ArrayList<FreeBoardPagingTO> boardList = new ArrayList<FreeBoardPagingTO>();
		boardList.add(Lists);
		
		return boardList;
	}
	
	// ajax 검색 리스트 가져오기 + pagination
	@RequestMapping("SearchListAjax.do")
	public ArrayList<FreeBoardPagingTO> SearchListAjax(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		String keyword = request.getParameter("keyword");
		
		Lists = fdao.Search_list(Lists, keyword);
		
		ArrayList<FreeBoardPagingTO> boardList = new ArrayList<FreeBoardPagingTO>();
		boardList.add(Lists);
		
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
	

	// 댓글

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
	
	// 댓글 삭제 ajax
	@RequestMapping("CommentDeleteAjax.do")
	public int CommentDeleteAjax(HttpServletRequest request) {
		String free_seq = request.getParameter("free_seq");
		String cmt_seq = request.getParameter("cmt_seq");
		
		commentTO cto = new commentTO();
		cto.setFree_seq(free_seq);
		cto.setCmt_seq(cmt_seq);
		
		int flag = cdao.Comment_Delete_Ok(cto);
		
		return flag;
	}
	
	
	// ajax 댓글 리스트 가져오기
	@RequestMapping("CommentListAjax.do")
	public ArrayList<commentTO> CommentListAjax(HttpServletRequest request) {
		String free_seq = request.getParameter("free_seq");
		ArrayList<commentTO> commentList = cdao.Comment_list(free_seq);
		
		return commentList;
	}
	
	// 댓글 수 ajax 가져오기
	@RequestMapping("CommentNumAjax.do")
	public int CommentNumtAjax(HttpServletRequest request) {
		String free_seq = request.getParameter("free_seq");
		
		int result = cdao.Comment_num(free_seq);
		
		return result;
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
		modelAndView.addObject( "free_seq", to.getFree_seq() );
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

	
	// 좋아요 ajax 가져오기
	@RequestMapping("LikeResultAjax.do")
	public int LikeResultAjax(HttpServletRequest request, HttpSession session ) {
		String free_seq = request.getParameter("free_seq");
		
		userInfoTO to = (userInfoTO)session.getAttribute("signIn");
		String user_nickname = to.getUser_nickname();
		
		int result = ldao.LikeFind(free_seq, user_nickname);
		
		int like_state = 0;
		// like_state = 0 이면 에러, 1이면 좋아요x, 2면 좋아요중
		if(result == 0) {
			like_state= 1;
		} else if(result == 1){
			like_state = 2;
		}
		
		return like_state;
	}
	
	// 좋아요 눌렀을때 좋아요 입력/삭제
	@RequestMapping("LikeClickAjax.do")
	public int LikeClickAjax(HttpServletRequest request, HttpSession session ) {
		String free_seq = request.getParameter("free_seq");
	
		userInfoTO to = (userInfoTO)session.getAttribute("signIn");
		String user_nickname = to.getUser_nickname();
		String user_email = to.getUser_email();
	
		LikeTO lto = new LikeTO();
		lto.setFree_seq(free_seq);
		lto.setUser_email(user_email);
		lto.setUser_nickname(user_nickname);
	
		int result = ldao.LikeFind(free_seq, user_nickname);
	
		// 좋아요가 상태확인
		int flag = 1;
		// 좋아요중이 아니면
		if(result == 0) {
			flag = ldao.Insert_Like_Ok(lto);
			// result가 0이면 insert 됨
	
		// 좋아요중이면
		} else if(result == 1){
			flag = ldao.Delete_Like_Ok(lto);
		} else {
//			System.out.println("좋아요 설정 에러");
		}
	
	
		return flag;
	}
	
	// 좋아요 수 ajax 가져오기
	@RequestMapping("LikeNumAjax.do")
	public int LikeNumtAjax(HttpServletRequest request) {
		String free_seq = request.getParameter("free_seq");
		
		int result = ldao.Like_num(free_seq);
		
		return result;
	}
}
