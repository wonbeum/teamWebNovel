<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.model.freeboardTO"%>
<%@page import="com.example.model.userInfoTO"%>
<%@page import="com.example.model.reviewTO"%>
<%@page import="com.example.model.requestTO"%>

<%@page import="java.util.ArrayList"%>

<%
	ArrayList<userInfoTO> userLists = (ArrayList<userInfoTO>)request.getAttribute("userLists");
	
	StringBuilder sbHtml1 = new StringBuilder();

		for( userInfoTO to : userLists ){
			sbHtml1.append("<tr>");
			sbHtml1.append("<th scope='row'>"+ userLists.indexOf("userLists") +"</td>");
			sbHtml1.append("	<td>"+ to.getUser_email() +"</td>");
			sbHtml1.append("	<td>"+ to.getUser_nickname() +"</td>");
			sbHtml1.append("	<td>"+to.getUser_cdate()+"</td>");
			sbHtml1.append("</tr>");
		}



	ArrayList<freeboardTO> boardLists = (ArrayList<freeboardTO>)request.getAttribute("boardLists");

	StringBuilder sbHtm2 = new StringBuilder();

	for( freeboardTO to : boardLists ){
		if( boardLists.size() == 5)
			break;
		sbHtm2.append("<tr>");
		sbHtm2.append("	<th scope='row'>"+ to.getFree_seq() +"</th>");
		sbHtm2.append("		<td>["+ to.getFree_category() + "]</td>");
		sbHtm2.append("		<td>"+ to.getFree_subject() + "</td>");
		sbHtm2.append("		<td>"+ to.getUser_email() +"</td>");
		sbHtm2.append("	</tr>");
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

	.align_left { float:left; }
	.align_right { float:right; }

</style>
</head>
<body>

<!-- header -->
<jsp:include page="../include/header2.jsp"></jsp:include>

<!-- 본문 -->
<!-- 상단 디자인 -->

<div class="container d-flex justify-content-around">
        <!--회원리스트-->
        <div class="table-responsive" style="width:500px" id="MemberList">
            <table class="table table-sm caption-top">
            <caption>
            회원 리스트
            	<a href="./admin_member_list.do" class="text-decoration-none">
            	바로가기
            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
  					<path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
				</svg>
				</a>
			</caption>
            <thead class="table-dark">
            <tr>
	            <th scope="col">#</th>
                <th scope="col">이메일</th>
                <th scope="col">닉네임</th>
                <th scope="col">가입일</th>
            </tr>
            </thead>
            <tbody>
            <%=sbHtml1 %>
<!-- 회원 반복구간 
            <tr>
	            <th scope="row">1</th>
                <td>이메일</td>
                <td>닉네임</td>
                <td>가입일</td>
            </tr>
-->
            </tbody>
            </table>
        </div>

        <!--게시물 리스트-->
        <div class="table-responsive" style="width:500px" id="BoardList">
            <table class="table table-sm caption-top">
            <caption>최신 게시글
            <a href="./admin_board_list.do" class="text-decoration-none">
            	바로가기
            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
  					<path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
				</svg>
			</a>
            </caption>
            
            <thead class="table-dark">
            <tr>
            	<th scope="col">#</th>
            	<th scope="col">카테고리</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
            </tr>
            </thead>
            <tbody>
            <%=sbHtm2 %>
<!-- 최신게시물 반복구간
            <tr>
                <th scope="row">1</th>
                <td>[카테고리]</td>
                <td>제목</td>
                <td>작성자</td>
            </tr>
 -->
            </tbody>
            </table>
        </div>
</div>

<div class="container d-flex justify-content-around">
        <!--리뷰리스트-->
        <div class="table-responsive" style="width:500px" id="ReviewList">
        <table class="table table-sm caption-top">
            <caption>리뷰 리스트
                <a href="./admin_review_list.do" class="text-decoration-none">
            	바로가기
            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
  					<path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
				</svg>
				</a>
            </caption>
            <thead class="table-dark">
            <tr>
            	<th scope="col">#</th>
                <th scope="col">작품명</th>
                <th scope="col">작성자</th>
                <th scope="col">별점</th>         
            </tr>
            </thead>
            <tbody>
<!-- 리뷰리스트 반복구간
            <tr>
            	<th scope="row">1</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
-->
            <tr>
            	<th scope="row">1</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            <tr>
            	<th scope="row">2</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            <tr>
            	<th scope="row">3</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            <tr>
            	<th scope="row">4</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            <tr>
            	<th scope="row">5</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            </tbody>
            </table>
        </div>
        
        <!--요청리스트-->
        <div class="table-responsive" style="width:500px" id="RequestList">
        <table class="table table-sm caption-top">
            <caption>요청 리스트
               	<a href="./admin_request_list.do" class="text-decoration-none">
            	바로가기
            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
  					<path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"/>
				</svg>
				</a>
            </caption>
            <thead class="table-dark">
            <tr>
            	<th scope="col">#</th>
                <th scope="col">카테고리</th>
                <th scope="col">제목</th>
                <th scope="col">날짜</th>         
            </tr>
            </thead>
            <tbody>
<!-- 요청리스트 반복 구간
            <tr>
            	<th scope="row">1</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
 -->
            <tr>
            	<th scope="row">1</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            <tr>
            	<th scope="row">2</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            <tr>
            	<th scope="row">3</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            <tr>
            	<th scope="row">4</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            <tr>
            	<th scope="row">5</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
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