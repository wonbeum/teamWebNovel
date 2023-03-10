package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.RegisterDAO;
import com.example.model.loginDAO;
import com.example.model.userInfoTO;
import com.example.model.user_adminDAO;

@RestController
public class LoginController {
	
	@Autowired
	private loginDAO dao;
	
	@Autowired
	private RegisterDAO rdao;
	
	@Autowired
	private user_adminDAO userdao;
	
	@RequestMapping("login.do")
	public ModelAndView login() {
		return new ModelAndView( "login" );
	}
	
	@RequestMapping( "login_ok.do" )
	public ModelAndView signIn(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login_ok" );
		
		userInfoTO to = new userInfoTO();
		
		to.setUser_email( request.getParameter("user_email") );
		to.setUser_password( request.getParameter("user_password") );
		
		userInfoTO signIn = dao.login(to);
//		System.out.println( signIn.getUser_nickname() );
		HttpSession session = request.getSession();
		if( signIn.getUser_nickname() != null) {
			session.setAttribute("signIn", signIn);
			modelAndView.addObject("grade", "user");
		} else {
			session.setAttribute("signIn", null);
		}
		return modelAndView;
	}
	
	@RequestMapping("adminlogin_ok.do")
	public ModelAndView adminsignIn(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName( "login_ok" );
		
		userInfoTO to = new userInfoTO();
		
		to.setUser_email( request.getParameter("user_email") );
		to.setUser_password( request.getParameter("user_password") );
		
		userInfoTO signIn = dao.adminlogin(to);
//		System.out.println( signIn.getUser_nickname() );
//		System.out.println( signIn.getUser_grade() );
		HttpSession session = request.getSession();
		if( signIn.getUser_nickname() != null) {
			session.setAttribute("signIn", signIn);
			modelAndView.addObject("grade", "master");
		} else {
			session.setAttribute("signIn", null);
		}
		return modelAndView;
	}
	
	@RequestMapping( "logout.do" )
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView( "redirect:/main.do" );
	}

	
	
	// ???????????? -----------------------------
	
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
	

	@RequestMapping("reset_password.do")
	public ModelAndView reset_password() {
		return new ModelAndView("reset_password");
	}

	@RequestMapping("reset_password_ok.do")
	public ModelAndView reset_password_ok(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("reset_password_ok");

		userInfoTO to = new userInfoTO();

		to.setUser_email(request.getParameter("user_email"));
		to.setUser_password(request.getParameter("user_birth"));

		int flag = dao.user_reset_password(to);

		modelAndView.addObject( "flag" , flag );
		
		return modelAndView;
	}
	
	
	// ????????? ???????????? ajax
		@RequestMapping("idCheckAjax.do")
		public int idCheckAjax(HttpServletRequest request) {
			String id = request.getParameter("id");
			
			int result = rdao.IdCheck(id);
			
			return result;
		}

		// ????????? ???????????? ajax
		@RequestMapping("nicknameCheckAjax.do")
		public int LikeResultAjax(HttpServletRequest request) {
			String nickname = request.getParameter("nickname");
				
			int result = rdao.NicknameCheck(nickname);
				
			return result;
		}

		
		
		// ??????????????? -----------------------------------
		
		@RequestMapping("mypage.do")
		public ModelAndView mypage() {
			return new ModelAndView( "mypage" );
		}
		
		// ??????????????? ??????
		@RequestMapping("mypage_modify_ok.do")
		public ModelAndView mypage_modify_ok( HttpServletRequest request, HttpSession session ) {
			ModelAndView modelAndView = new ModelAndView();
			
			userInfoTO to = (userInfoTO)session.getAttribute("signIn");
			String user_email = to.getUser_email();
			
			to.setUser_nickname( request.getParameter( "user_nickname" ) );
			to.setUser_email( user_email );
			to.setUser_gender( request.getParameter( "user_gender" ) );
			to.setUser_birth( request.getParameter( "user_birth" ) );
			//System.out.println( to.getUser_email() );
			//System.out.println( to.getUser_nickname() );
			//System.out.println( to.getUser_gender() );
			//System.out.println( to.getUser_birth() );
			int flag = userdao.userModify_ok(to);
			//System.out.println(flag);
			
			modelAndView.setViewName( "mypage_modify_ok" );
			modelAndView.addObject( "flag" , flag );
			return modelAndView;
		}
		
		// ??????
		@RequestMapping("mypage_delete_ok.do")
		public ModelAndView mypage_delete_ok( HttpServletRequest request, HttpSession session ) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("mypage_delete_ok");
			
			userInfoTO to = new userInfoTO();
			to.setUser_email( request.getParameter( "user_email" ) );
			
			int flag = userdao.userDelete_ok(to);
			if( flag == 0 ) {
				session.invalidate();
			}
			modelAndView.addObject( "flag" , flag );
			
			return modelAndView;
		}
		
		@RequestMapping("mypage_password.do")
		public ModelAndView mypage_password() {
			return new ModelAndView( "mypage_password" );
		}
		
		// ??????????????? ???????????? ??????
		@RequestMapping("mypage_password_ok.do")
		public ModelAndView mypage_password_ok( HttpServletRequest request, HttpSession session ) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("mypage_password_ok");
			
			userInfoTO to = (userInfoTO)session.getAttribute("signIn");
			String user_email = to.getUser_email();
			to.setUser_email( user_email );
			to.setUser_password(request.getParameter("user_password"));
			
			int flag = userdao.userPassword_ok(to);
			
			modelAndView.addObject( "flag" , flag );
			
			return modelAndView;
		}
		
		
		// ????????? ????????? --------------------

		
		// ????????? ?????? 
		@RequestMapping("kakaoCheck.do")
		public int kakaoCheck(HttpServletRequest request) {
			String user_email = request.getParameter("user_email");
			userInfoTO to = new userInfoTO();
			to.setUser_email(user_email);
			
			int result = dao.kakaoCheck(to);
	
			return result;
		}
		
		// ???????????????
		@RequestMapping("kakaologin.do")
		public ModelAndView kakaosignIn(HttpServletRequest request) {
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName( "login_ok" );
			
			userInfoTO to = new userInfoTO();
			
			to.setUser_email( request.getParameter("user_email") );
			
			userInfoTO signIn = dao.kakaologin(to);
			HttpSession session = request.getSession();
			if( signIn.getUser_nickname() != null) {
				session.setAttribute("signIn", signIn);
				modelAndView.addObject("grade", "user");
			} else {
				session.setAttribute("signIn", null);
			}
			return modelAndView;
		}
		
		// ????????????
		// ????????? ?????? 
		@RequestMapping("kakaoregister.do")
		public int kakaoregister(HttpServletRequest request) {
			userInfoTO to = new userInfoTO();
			to.setUser_email(request.getParameter("user_email"));
			to.setUser_nickname(request.getParameter("user_nickname"));
			
			if(request.getParameter("user_gender").equals("male") ) {
				to.setUser_gender("M");
			} else if(request.getParameter("user_gender").equals("female") ) {
				to.setUser_gender("F");
			} else {
				to.setUser_gender("N");
			}
			to.setUser_birth(request.getParameter("user_birth"));

			int flag = rdao.kakaoregisterOk(to);
			
			return flag;
		}
		
		
}
