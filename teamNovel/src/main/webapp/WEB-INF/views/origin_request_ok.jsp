<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
 
<%@ page import="org.json.simple.JSONObject" %>
    
<%

	request.setCharacterEncoding("utf-8");
	int flag = (Integer)request.getAttribute( "flag" );

	JSONObject result = new JSONObject();
	result.put( "flag", flag );

	out.println( result );

%>
