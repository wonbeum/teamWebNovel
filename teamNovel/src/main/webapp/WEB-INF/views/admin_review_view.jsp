<%@page import="com.example.model.reviewTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	reviewTO to = (reviewTO)request.getAttribute("to");

	String review_seq = to.getReview_seq();
	String review_content = to.getReview_content();
	String review_date = to.getReview_date();
	String review_ip = to.getReview_ip();
	String review_star_grade = to.getReview_star_grade();
	String user_nickname = to.getUser_nickname();
	String user_email = to.getUser_email();
	String novel_title = to.getNovel_title();
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
.nav-scroller {
	border: 1px solid black;
}
</style>

<script type="text/javascript">

</script>
</head>
<body>
	<!-- header -->
	<div class="container">
		<header class="blog-header lh-1 py-3">
			<div
				class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">
					<a class="blog-header-logo text-dark" href="./frame.do">ADMINISTRATOR</a>
				</div>
				<div class="col-4 d-flex justify-content-end align-items-center">
					<a class="link-secondary" href="#" aria-label="Mainpage"> </a> <a
						class="btn btn-sm btn-outline-secondary" href="#"><svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
							<title>Mainpage</title><path
								d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z" /></svg>
						Home</a> <a class="btn btn-sm btn-outline-secondary" href="#">Logout</a>
				</div>
			</div>
		</header>

		<div class="nav-scroller py-1 mb-2">
							<nav class="nav d-flex justify-content-between">
				<a class="p-2 link-secondary" href="./admin_member_list.do">회원 관리</a> <a
					class="p-2 link-secondary" href="./admin_board_list.do">게시물 관리</a> <a
					class="p-2 link-secondary" href="./admin_review_list.do">리뷰 관리</a> <a
					class="p-2 link-secondary" href="./admin_origin_request_list.do">요청 리스트</a>
			</nav>
		</div>
	</div>
	<!-- main -->
	<main>
		<div class="container w-75">
			<input type="hidden" name="seq" value="" />
			<div class="row mt-5">
				<div class="col-auto me-auto">
					<h5>리뷰 게시판 상세보기</h5>
				</div>
				<div class="col-auto">
					<a href="./main.do"> <img
						src="//image.istarbucks.co.kr/common/img/common/icon_home.png"
						alt="홈으로">
					</a> <img class="arrow"
						src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png"
						alt="하위메뉴"> <a href="./admin_review_list.jsp">리뷰게시판 목록</a>
				</div>
			</div>
		</div>
		<!-- 게시글 -->
		<div class="container w-75 mb-5">

			<div class="col mt-3 mb-5">
						<table class="table text-center">
							<thead>
								<tr>
									<th>이메일</th>
									<th>닉네임</th>
									<th>작품명</th>
									<th>작성일자</th>
									<th>별점</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td width="10%"><%=user_email %></td>
									<td width="20%"><%=user_nickname %></td>
									<td width="35%" class="text-start"><%=novel_title %></td>
									<td width="15%"><%=review_date %></td>
									<td width="10%"><%=review_star_grade %>점</td>
								</tr>
							</tbody>
						</table>
					<textarea class="form-control" name="content" rows="8" readonly><%=review_content %></textarea>
					<a class="btn btn-outline-dark mt-3" href="./admin_review_list.do"
						role="button">목록</a>
					<button type="submit" id="dbtn" class="btn btn-secondary mt-3"><a href="./admin_review_delete_ok.do?seq=<%=review_seq %>">삭제</button>
				</div>
			</div>
	</main>
	<!-- footer -->
	<hr class="footer-div">

	<div class="container">
		<footer class="py-3 my-4">
			<p class="text-center text-muted">&copy; 2023 개발 못하면 죽는 병, Inc</p>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>