<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	int flag = (Integer)request.getAttribute( "flag" );
	String free_seq = (String)request.getAttribute("free_seq");
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '글 수정이 완료되었습니다.' );" );
		out.println( "location.href='board_view.do?seq=" + free_seq + "';" );
	} else {
		out.println( "alert( '글 수정에 실패하였습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>