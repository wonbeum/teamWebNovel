<%@page import="com.example.model.reviewListTO"%>
<%@page import="com.example.model.admin_origin_requestTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.model.freeboardTO"%>
<%@page import="com.example.model.userInfoTO"%>
<%@page import="com.example.model.reviewTO"%>
<%@page import="com.example.model.requestTO"%>

<%@page import="java.util.ArrayList"%>

<%
	ArrayList<userInfoTO> AdminUserLists = (ArrayList<userInfoTO>)request.getAttribute("AdminUserLists");
	
	StringBuilder sbHtml1 = new StringBuilder();

		for( userInfoTO to : AdminUserLists ){
			sbHtml1.append("<tr>");
			sbHtml1.append("<th scope='row'></td>");
			sbHtml1.append("	<td>"+ to.getUser_email() +"</td>");
			sbHtml1.append("	<td>"+ to.getUser_nickname() +"</td>");
			sbHtml1.append("	<td>"+to.getUser_cdate()+"</td>");
			sbHtml1.append("</tr>");
		}


	ArrayList<freeboardTO> AdminFreeBoardlist = (ArrayList<freeboardTO>)request.getAttribute("AdminFreeBoardlist");

	StringBuilder sbHtm2 = new StringBuilder();

		for( freeboardTO to : AdminFreeBoardlist ){
			sbHtm2.append("<tr>");
			sbHtm2.append("	<th scope='row'>"+ to.getFree_seq() +"</th>");
			sbHtm2.append("		<td>["+ to.getFree_category() + "]</td>");
			sbHtm2.append("		<td>"+ to.getFree_subject() + "</td>");
			sbHtm2.append("		<td>"+ to.getUser_nickname() +"</td>");
			sbHtm2.append("	</tr>");
		}
	
		
	ArrayList<reviewTO> Adminreviewlist = (ArrayList<reviewTO>)request.getAttribute("Adminreviewlist");

		StringBuilder sbHtm3 = new StringBuilder();

			for( reviewTO to : Adminreviewlist ){
				sbHtm3.append("<tr>");
				sbHtm3.append("	<th scope='row'>"+ to.getReview_seq() +"</th>");
				sbHtm3.append("		<td>"+ to.getNovel_title() + "</td>");
				sbHtm3.append("		<td>"+ to.getUser_nickname() + "</td>");
				sbHtm3.append("		<td>"+ to.getReview_star_grade() +"</td>");
				sbHtm3.append("	</tr>");
		}

		
	ArrayList<admin_origin_requestTO> AdminrequestList = (ArrayList<admin_origin_requestTO>)request.getAttribute("AdminrequestList");
		
	StringBuilder sbHtm4 = new StringBuilder();

		for( admin_origin_requestTO to : AdminrequestList ){
			sbHtm4.append("<tr>");
			sbHtm4.append("	<th scope='row'>"+ to.getRequest_seq() +"</th>");
			sbHtm4.append("		<td>["+ to.getRequest_category() + "]</td>");
			sbHtm4.append("		<td>"+ to.getRequest_title() + "</td>");
			sbHtm4.append("		<td>"+ to.getUser_email() +"</td>");
			sbHtm4.append("	</tr>");
		}
		
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style type="text/css">
	.nav-scroller{
		border: 1px solid black ;
	}

	.btn_area{
	overflow: hidden; margin: 10px 0;
	}
	
	.container{
    width: 90%;
    margin: 10px auto;
	}
	
	caption, th {
	  background: #E2E2E2;
	  padding: 10px;
	  margin: 0px 0px 15px 0px;
	  font-family: "AppleSDGothicNeoSB";
	  font-size: 18px;
	}
	
	table{
		font-family: "AppleSDGothicNeoR";
	}
	
</style>
</head>
<body>

<!-- header -->
<jsp:include page="../include/header2.jsp"></jsp:include>

<!-- 본문 -->

<div class="container d-flex justify-content-around" style="margin-top: 110px">
        <!--회원리스트-->
        <div class="table-responsive" style="width:500px" id="MemberList">
            <table class="table table-sm caption-top">
            <caption>
            회원 리스트
            	<a href="./admin_member_list.do" class="text-decoration-none">
            	바로가기
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-square" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.854 8.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707l-4.096 4.096z"/>
				</svg>
				</a>
			</caption>
            <thead class="table">
            <tr>
	            <th scope="col">#</th>
                <th scope="col">이메일</th>
                <th scope="col">닉네임</th>
                <th scope="col">가입일</th>
            </tr>
            </thead>
            <tbody>
            <%=sbHtml1 %>
            </tbody>
            </table>
        </div>

        <!--게시물 리스트-->
        <div class="table-responsive" style="width:500px" id="BoardList">
            <table class="table table-sm caption-top">
            <caption>최신 게시글
            <a href="./admin_board_list.do" class="text-decoration-none">
            	바로가기
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-square" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.854 8.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707l-4.096 4.096z"/>
			</svg>
			</a>
            </caption>
            
            <thead class="table">
            <tr>
            	<th scope="col">#</th>
            	<th scope="col">카테고리</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
            </tr>
            </thead>
            <tbody>
            <%=sbHtm2 %>
            </tbody>
            </table>
        </div>
</div>

<div class="container d-flex justify-content-around" style="margin-top: 110px; margin-bottom: 110px;">
        <!--리뷰리스트-->
        <div class="table-responsive" style="width:500px" id="ReviewList">
        <table class="table table-sm caption-top">
            <caption>리뷰 리스트
                <a href="./admin_review_list.do" class="text-decoration-none">
            	바로가기
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-square" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.854 8.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707l-4.096 4.096z"/>
				</svg>
				</a>
            </caption>
            <thead class="table">
            <tr>
            	<th scope="col">#</th>
                <th scope="col">작품명</th>
                <th scope="col">작성자</th>
                <th scope="col">별점</th>         
            </tr>
            </thead>
            <tbody>
            <%=sbHtm3 %>
            </tbody>
            </table>
        </div>
        
        <!--요청리스트-->
        <div class="table-responsive" style="width:500px" id="RequestList">
        <table class="table table-sm caption-top">
            <caption>요청 리스트
               	<a href="./admin_origin_request_list.do" class="text-decoration-none">
            	바로가기
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-square" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.854 8.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707l-4.096 4.096z"/>
				</svg>
				</a>
            </caption>
            <thead class="table">
            <tr>
            	<th scope="col">#</th>
                <th scope="col">카테고리</th>
                <th scope="col">제목</th>
                <th scope="col">요청자</th>         
            </tr>
            </thead>
            <tbody>
            <%=sbHtm4 %>
            </tbody>
            </table>
        </div>
</div>
<!--하단 디자인 -->


	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>