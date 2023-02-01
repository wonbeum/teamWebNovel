<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.model.FreeBoardDAO"%>
<%
request.setCharacterEncoding("utf-8");

ArrayList<FreeTO> lists = dao.listZipcode(sido, gugun, dong);

JSONArray arr = new JSONArray();
for( ZipcodeTO to : lists ) {
	JSONObject data = new JSONObject();
	data.put( "zipcode", to.getZipcode() );
	data.put( "sido", sido);
	data.put( "gugun", gugun );
	data.put( "dong", gugun );
	String ri = to.getRi();
	String bunji = to.getBunji();
	
	arr.add( data );
}

JSONObject obj = new JSONObject();
obj.put( "data", arr );
out.println( obj.toString() );

%>