<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	int flag = (Integer)request.getAttribute( "flag" );

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '글 삭제가 완료되었습니다.' );" );
		out.println( "location.href='./admin_review_list.do';" );
	} else {
		out.println( "alert( '글 삭제에 실패하였습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>
