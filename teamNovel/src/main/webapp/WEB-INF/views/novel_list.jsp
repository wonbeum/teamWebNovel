<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.example.model.novelInfoTO"%>
<%@page import="java.util.ArrayList"%>

<%
ArrayList<novelInfoTO> novelLists = (ArrayList<novelInfoTO>) request.getAttribute("Lists");

StringBuilder krsbHtml = new StringBuilder();

int i = 1;

for( novelInfoTO to : novelLists ){
	if( (i % 5) == 1 ){
		krsbHtml.append("<div class='row row-cols-2 row-cols-sm-2 row-cols-md-5 g-2'>");
	}

	krsbHtml.append("	<div class='col'>");
	krsbHtml.append("		<div class='card shadow-sm'>");
	krsbHtml.append("			<a href='#'> <img src='"+ to.getNovel_img() +"' class='img' width='100%'");
	krsbHtml.append("				height='225' role='img' aria-label='Placeholder: Thumbnail'>");
	krsbHtml.append("			</a>");
	krsbHtml.append("			<div class='card-body'>");
	krsbHtml.append("				<p class='card-text'>"+ to.getNovel_genre() +"</p>");
	krsbHtml.append("				<p class='card-text'>"+ to.getNovel_title() +"</p>");
	krsbHtml.append("				<p class='card-text'>"+ to.getNovel_writer() +"</p>");
	krsbHtml.append("				<p class='card-text'>별점 평균</p>");
	krsbHtml.append("			</div>");
	krsbHtml.append("		</div>");
	krsbHtml.append("	</div>");
	
	if( (i % 5) == 0 ){
		krsbHtml.append("</div>");
	}
	i++;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}

.nav { -
	-bs-nav-link-padding-x: 1rem; -
	-bs-nav-link-padding-y: 0.5rem; -
	-bs-nav-link-font-weight:; -
	-bs-nav-link-color: #343a40; -
	-bs-nav-link-hover-color: #ffc107; -
	-bs-nav-link-disabled-color: var(- -bs-secondary-color);
	display: flex;
	flex-wrap: wrap;
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
}
</style>
</head>
<body>

	<div class="container">
		<header class="blog-header lh-1 py-3">
			<div
				class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">
					<a class="link-secondary" href="./main.do">사이트 로고</a>
				</div>
				<div class="col-4 text-center">
					<a class="blog-header-logo text-dark" href="./main.do">사이트 이름</a>
				</div>
				<div class="col-4 d-flex justify-content-end align-items-center">
					<a class="link-secondary" href="./novel_search.do"
						aria-label="Search"> <svg xmlns="http://www.w3.org/2000/svg"
							width="20" height="20" fill="none" stroke="currentColor"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							class="mx-3" role="img" viewBox="0 0 24 24">
							<title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
							<path d="M21 21l-5.2-5.2" /></svg>
					</a>
					<c:if test="${signIn == null}">
						<a class="btn btn-sm btn-outline-secondary" href="./login.do">Sign
							up</a>
					</c:if>
					<c:if test="${signIn != null}">
						<div class="dropdown text-end">
							<a href="#"
								class="d-block link-dark text-decoration-none dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false"> <img
								src="https://github.com/mdo.png" alt="mdo" width="32"
								height="32" class="rounded-circle">
							</a>
							<ul class="dropdown-menu text-small">
								<li><a class="dropdown-item" href="#">New project...</a></li>
								<li><a class="dropdown-item" href="#">Settings</a></li>
								<li><a class="dropdown-item" href="#">Profile</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="./logout.do">Sign
										out</a></li>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
		</header>

		<div class="nav-scroller py-1 mb-2">
			<nav class="nav d-flex justify-content-between">
				<a class="p-2 link-secondary" href="./rank_list.do">랭킹</a> <a
					class="p-2 link-secondary" href="./review_list.do">리뷰</a> <a
					class="p-2 link-secondary" href="./novel_list.do">웹소설</a> <a
					class="p-2 link-secondary" href="./board_list.do">커뮤니티</a> <a
					class="p-2 link-secondary" href="./origin_list.do">원작 소설 찾기</a>
			</nav>
		</div>
	</div>
<body>
	<!-- 본문 -->

	<div class="container w-75">
		<!-- Nav pills -->
		<ul class="nav justify-content-center bg-light" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="pill" href="#kakaopage">카카오 페이지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#series">네이버 시리즈</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#ridi">리디북스</a></li>
		</ul>
	</div>

	<div class="container w-75">
		<!-- Nav pills -->
		<ul class="nav justify-content-center bg-light" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="pill" href="romance">로맨스</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#fantasy">판타지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#romancefantasy">로맨스판타지</a></li>
		</ul>
	</div>

	<div class="container">
		<%=krsbHtml%>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
	</div>



	<hr class="footer-div">

	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="./rank_list.do"
					class="nav-link px-2 text-muted">랭킹</a></li>
				<li class="nav-item"><a href="./review_list.do"
					class="nav-link px-2 text-muted">리뷰</a></li>
				<li class="nav-item"><a href="./novel_list.do"
					class="nav-link px-2 text-muted">웹소설</a></li>
				<li class="nav-item"><a href="./board_list.do"
					class="nav-link px-2 text-muted">커뮤니티</a></li>
				<li class="nav-item"><a href="./origin_list.do"
					class="nav-link px-2 text-muted">원작 소설 찾기</a></li>
			</ul>
			<p class="text-center text-muted">&copy; 2023 개발 못하면 죽는 병, Inc</p>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>