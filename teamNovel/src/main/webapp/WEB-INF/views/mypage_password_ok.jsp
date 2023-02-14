<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	int flag = (Integer)request.getAttribute( "flag" );

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '새 비밀번호로 변경되었습니다.' );" );
		out.println( "location.href='./mypage.do'" );
	} else {
		out.println( "alert( '비밀번호 변경이 실패하였습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
