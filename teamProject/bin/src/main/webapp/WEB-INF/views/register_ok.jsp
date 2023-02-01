<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding( "utf-8" );

	String email = request.getParameter( "email" );
	String nickname = request.getParameter( "nickname" );
	String password = request.getParameter( "password" );
	String password2 = request.getParameter( "password2" );
	String birth = request.getParameter( "birth" );
	String gender = request.getParameter( "gender" );


	System.out.println( email );
	System.out.println( password );
	System.out.println( password2 );
	System.out.println( nickname );
	System.out.println( birth );
	System.out.println( gender );
%>
