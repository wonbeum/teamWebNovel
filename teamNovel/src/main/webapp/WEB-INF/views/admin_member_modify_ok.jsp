<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	int flag = (Integer)request.getAttribute( "flag" );
	String email = (String)request.getAttribute("email");

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '회워정보 수정이 완료되었습니다.' );" );
		out.println( "location.href='./admin_member_view.do?email="+ email +"';" );
	} else {
		out.println( "alert( '회원정보 수정에 실패하였습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
