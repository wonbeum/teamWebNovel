<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		
	out.println( "<script type='text/javascript'>" );
	if( session.getAttribute("signIn") != null ){
		out.println( "alert('로그인에 성공했습니다');" );
		if( request.getAttribute("grade") == "user" ){
			out.println( "location.href='./main.do';" );
		} else if( request.getAttribute("grade") == "master" ){
			out.println( "location.href='./admin_main.do';" );
		}
	} else{
		out.println( "alert('아이디 또는 비밀번호가 틀립니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>