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
import com.example.model.FreeBoardPagingTO;
import com.example.model.admin_RQPagingTO;
import com.example.model.admin_boardDAO;
import com.example.model.admin_mainDAO;
import com.example.model.admin_origin_requestDAO;
import com.example.model.admin_origin_requestTO;
import com.example.model.admin_reviewDAO;
import com.example.model.admin_userPagingTO;
import com.example.model.commentTO;
import com.example.model.freeboardTO;
import com.example.model.reviewDAO;
import com.example.model.reviewListDAO;
import com.example.model.reviewListTO;
import com.example.model.reviewTO;
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
	@Autowired
	private reviewDAO rdao;
	@Autowired
	private admin_reviewDAO ad_rdao;
	@Autowired
	private admin_mainDAO adminDAO;
	@Autowired
	private admin_boardDAO ad_bdao;
	
	@RequestMapping("admin_main.do")
	public ModelAndView admin_main(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_main" );
		
		ArrayList<userInfoTO > AdminUserLists = adminDAO.AdminUserLists();
		ArrayList<freeboardTO > AdminFreeBoardlist = adminDAO.AdminFreeBoardlist();
		ArrayList<admin_origin_requestTO> AdminrequestList = adminDAO.admin_request_list();
		ArrayList<reviewTO> Adminreviewlist = adminDAO.Adminreviewlist();
		
		modelAndView.addObject( "AdminUserLists" , AdminUserLists );
		modelAndView.addObject( "AdminFreeBoardlist" , AdminFreeBoardlist );
		modelAndView.addObject( "AdminrequestList" , AdminrequestList );
		modelAndView.addObject( "Adminreviewlist" , Adminreviewlist );
		return modelAndView;
	}
	
	//---?????? ??????
	
	@RequestMapping("admin_member_list.do")
	public ModelAndView admiadmin_member_list( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_member_list" );
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
	
	@RequestMapping("admin_member_modify.do")
	public ModelAndView admin_member_modify( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin_member_modify");
		
		userInfoTO to = new userInfoTO();
		to.setUser_email( request.getParameter( "email" ) );
		to = userdao.userModify(to);
		
		modelAndView.addObject( "to" , to );
		
		return modelAndView;
	}

	@RequestMapping("admin_member_modify_ok.do")
	public ModelAndView admin_member_modify_ok( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin_member_modify_ok");
		
		userInfoTO to = new userInfoTO();
		to.setUser_nickname( request.getParameter( "nickname" ) );
		to.setUser_email( request.getParameter( "email" ) );
		to.setUser_gender( request.getParameter( "gender" ) );
		to.setUser_birth( request.getParameter( "birth" ) );
		to.setUser_cdate( request.getParameter( "cdate" ) );
		
//		System.out.println( to.getUser_nickname() );
//		System.out.println( to.getUser_email() );
//		System.out.println( to.getUser_gender() );
//		System.out.println( to.getUser_birth() );
//		System.out.println( to.getUser_cdate() );
		
		int flag = userdao.userModify_ok(to);
		
		modelAndView.addObject( "flag" , flag );
		modelAndView.addObject( "email" , to.getUser_email() );
		
		
		
		return modelAndView;
	}


	@RequestMapping("admin_member_delete_ok.do")
	public ModelAndView admin_member_delete_ok( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin_member_delete_ok");
		
		userInfoTO to = new userInfoTO();
		to.setUser_email( request.getParameter( "email" ) );
		
		int flag = userdao.userDelete_ok(to);
		
		modelAndView.addObject( "flag" , flag );
		
		return modelAndView;
	}
	
	
	//-------------????????? ??????
	
	@RequestMapping("admin_board_list.do")
	public ModelAndView admin_board_list( HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_board_list" );
		
		ArrayList<freeboardTO> boardLists = fdao.FreeBoard_list();
		modelAndView.addObject( "boardLists" , boardLists );

		return modelAndView;
	}
	
	// ajax admin??? ?????? ?????????????????? ???????????? + pagination
	@RequestMapping("AdminBoardListAjax.do")
	public ArrayList<FreeBoardPagingTO> AdminBoardListAjax(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		Lists = ad_bdao.adminboardLists(Lists);
		
		ArrayList<FreeBoardPagingTO> boardlists = new ArrayList<FreeBoardPagingTO>();
		boardlists.add(Lists);
		
		return boardlists;
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
	
	// ?????? ajax ????????????
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
		String user_nickname = "?????????";

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
	
	// ????????? admin_board ?????? ?????? ????????? + pagination
	@RequestMapping("boardSearch_titleAjax.do")
	public ArrayList<FreeBoardPagingTO> boardSearch_title(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		Lists = ad_bdao.boardSearch_title(Lists, category, keyword);
		
		ArrayList<FreeBoardPagingTO> boardlists = new ArrayList<FreeBoardPagingTO>();
		boardlists.add(Lists);
		
		return boardlists;
	}
	
	
	// ????????? admin_board ??????+?????? ?????? ????????? + pagination
	@RequestMapping("boardSearch_contentAjax.do")
	public ArrayList<FreeBoardPagingTO> boardSearch_content(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		
		Lists = ad_bdao.boardSearch_content(Lists, category, keyword);
		
		ArrayList<FreeBoardPagingTO> boardlists = new ArrayList<FreeBoardPagingTO>();
		boardlists.add(Lists);
		
		return boardlists;
	}
	
	
	
	
	// ???????????? ---------------------------------
	
	@RequestMapping("admin_review_list.do")
	public ModelAndView admin_review_list() {
		return new ModelAndView( "admin_review_list" );
	}
	
	// ajax ?????? ?????? ????????? ???????????? + pagination
	@RequestMapping("ReviewListAjax.do")
	public ArrayList<FreeBoardPagingTO> ReviewListAjax(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		Lists = ad_rdao.Review_List(Lists);
		
		ArrayList<FreeBoardPagingTO> reviewList = new ArrayList<FreeBoardPagingTO>();
		reviewList.add(Lists);
		
		return reviewList;
	}
	
	// ajax ????????? ?????? ?????? ????????? ???????????? + pagination
	@RequestMapping("SearchReview_titleAjax.do")
	public ArrayList<FreeBoardPagingTO> SearchReview_titleAjax(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		String keyword = request.getParameter("keyword");
		
		Lists = ad_rdao.ReviewSearch_TitleList(Lists, keyword);
		
		ArrayList<FreeBoardPagingTO> reviewList = new ArrayList<FreeBoardPagingTO>();
		reviewList.add(Lists);
		
		return reviewList;
	}
	
	// ajax ?????? ?????? ?????? ????????? ???????????? + pagination
	@RequestMapping("SearchReview_starAjax.do")
	public ArrayList<FreeBoardPagingTO> SearchReview_starAjax(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		String keyword = request.getParameter("keyword");
		
		Lists = ad_rdao.ReviewSearch_StarList(Lists, keyword);
		
		ArrayList<FreeBoardPagingTO> reviewList = new ArrayList<FreeBoardPagingTO>();
		reviewList.add(Lists);
		
		return reviewList;
	}
	
	// ajax ?????????+?????? ?????? ?????? ????????? ???????????? + pagination
	@RequestMapping("SearchReview_contentAjax.do")
	public ArrayList<FreeBoardPagingTO> SearchReview_contentAjax(HttpServletRequest request) {
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( "" ) ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		FreeBoardPagingTO Lists = new FreeBoardPagingTO();
		Lists.setCpage(cpage);
		
		String keyword = request.getParameter("keyword");
		
		Lists = ad_rdao.ReviewSearch_ContentList(Lists, keyword);
		
		ArrayList<FreeBoardPagingTO> reviewList = new ArrayList<FreeBoardPagingTO>();
		reviewList.add(Lists);
		
		return reviewList;
	}
	
	@RequestMapping("admin_review_view.do")
	public ModelAndView admin_review_view(HttpServletRequest request) {
		reviewTO to = new reviewTO();
		to.setReview_seq(request.getParameter("seq"));
		to = ad_rdao.Review_View(to);
			
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_review_view" );
		modelAndView.addObject("to", to);
		return modelAndView;
	}
	
	@RequestMapping("admin_review_delete_ok.do")
	public ModelAndView admin_review_delete_ok(HttpServletRequest request) {
		reviewTO to = new reviewTO();
		to.setReview_seq(request.getParameter("seq"));

		int flag = ad_rdao.Review_DeleteOk(to);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_review_delete_ok" );
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	@RequestMapping("admin_member_lists")
	public ArrayList<admin_userPagingTO> admin_member_lists( HttpServletRequest request ) {

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( " ") ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		admin_userPagingTO Lists = new admin_userPagingTO();
		Lists.setCpage(cpage);
		
		Lists = userdao.userLists(Lists);
		
		ArrayList<admin_userPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}


	@RequestMapping("adminsearch_nickname")
	public ArrayList<admin_userPagingTO> adminsearch_nickname( HttpServletRequest request ) {

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( " ") ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}

		String search = request.getParameter("search");
		
		admin_userPagingTO Lists = new admin_userPagingTO();
		Lists.setCpage(cpage);
		
		Lists = userdao.userListsNickname(Lists, search);
		
		ArrayList<admin_userPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}

	@RequestMapping("adminsearch_email")
	public ArrayList<admin_userPagingTO> adminsearch_email( HttpServletRequest request ) {

		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( " ") ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}

		String search = request.getParameter("search");
		
		admin_userPagingTO Lists = new admin_userPagingTO();
		Lists.setCpage(cpage);
		
		Lists = userdao.userListsEmail(Lists, search);
		
		ArrayList<admin_userPagingTO> result = new ArrayList<>();
		result.add(Lists);
		
		return result;
	}
	
	//---?????? ??????
	
	@RequestMapping("admin_origin_request_list.do")
	public ModelAndView adminpg_orgin_request_list( HttpServletRequest request ) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_origin_request_list" );
		
		int cpage = 1;
		if( request.getParameter( "cpage" ) != null && !request.getParameter( "cpage" ).equals( " ") ) {
			cpage = Integer.parseInt( request.getParameter( "cpage" ) );
		}
		
		admin_RQPagingTO Lists = new admin_RQPagingTO();
		Lists.setCpage(cpage);
		
		Lists = aordao.requestLists(Lists);
		
		modelAndView.addObject( "Lists" , Lists );
		
		return modelAndView;
	}
	
	
	@RequestMapping("admin_origin_request_delete_ok.do")
	public ModelAndView admin_origin_request_delete_ok(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "admin_origin_request_delete_ok" );
		
		admin_origin_requestTO to = new admin_origin_requestTO();
		to.setRequest_seq(request.getParameter("seq"));

		int flag = aordao.originRequestDeleteOk(to);
		
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
}
