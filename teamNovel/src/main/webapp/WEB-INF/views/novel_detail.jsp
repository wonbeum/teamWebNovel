<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<hr class="my-5">

	<div class="row">
		<div class="col-sm-6 col-lg-4">
			<div class="card">
				<img src="..." class="img" width="100%" height="225" role="img">

				<div class="card-body">
					<p class="card-title">장르</p>
					<h5 class="card-text">제목</h5>
					<a>작가</a>
					<p>작품에 대한 소개</p>
					<a href=""><button type="button" class="btn btn-warning">플랫폼
							이동</button></a>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-4">
			<div class="card p-3">
				<figure class="p-3 mb-0">
					<blockquote class="blockquote">
						<p>평균 ★ 평균별점</p>
					</blockquote>
					<!-- 리뷰 별점 -->

				</figure>


			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">별점</label>
				<div class="starpoint_wrap">
					<div class="starpoint_box">
						<label for="starpoint_1" class="label_star" title="0.5"><span
							class="blind">0.5점</span></label> <label for="starpoint_2"
							class="label_star" title="1.0"><span class="blind">1점</span></label>
						<label for="starpoint_3" class="label_star" title="1.5"><span
							class="blind">1.5점</span></label> <label for="starpoint_4"
							class="label_star" title="2.0"><span class="blind">2.0점</span></label>
						<label for="starpoint_5" class="label_star" title="2.5"><span
							class="blind">2.5점</span></label> <label for="starpoint_6"
							class="label_star" title="3.0"><span class="blind">3.0점</span></label>
						<label for="starpoint_7" class="label_star" title="3.5"><span
							class="blind">3.5점</span></label> <label for="starpoint_8"
							class="label_star" title="4.0"><span class="blind">4.0점</span></label>
						<label for="starpoint_9" class="label_star" title="4.5"><span
							class="blind">4.5점</span></label> <label for="starpoint_10"
							class="label_star" title="5.0"><span class="blind">5.0점</span></label>
						<input type="radio" name="starpoint" id="starpoint_1"
							class="star_radio"> <input type="radio" name="starpoint"
							id="starpoint_2" class="star_radio"> <input type="radio"
							name="starpoint" id="starpoint_3" class="star_radio"> <input
							type="radio" name="starpoint" id="starpoint_4" class="star_radio">
						<input type="radio" name="starpoint" id="starpoint_5"
							class="star_radio"> <input type="radio" name="starpoint"
							id="starpoint_6" class="star_radio"> <input type="radio"
							name="starpoint" id="starpoint_7" class="star_radio"> <input
							type="radio" name="starpoint" id="starpoint_8" class="star_radio">
						<input type="radio" name="starpoint" id="starpoint_9"
							class="star_radio"> <input type="radio" name="starpoint"
							id="starpoint_10" class="star_radio"> <span
							class="starpoint_bg"></span>
					</div>
				</div>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3"></textarea>
				<button class="btn btn-primary" type="submit">Button</button>
			</div>
<a>ReviewList</a> <span class="btn rounded-pill text-bg-warning">최신순</span> <span class="btn rounded-pill text-bg-warning">별점▲</span> <span class="btn rounded-pill text-bg-warning">별점▼</span>
			<div class="list-group w-auto">
				<a href="#"
					class="list-group-item list-group-item-action d-flex gap-3 py-3"
					aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div>
							<h6 class="mb-0">닉네임</h6>
							<p class="mb-0 opacity-75">리뷰내용</p>
						</div>
						<small class="opacity-50 text-nowrap">작성날자</small>
					</div>

				</a> <a href="#"
					class="list-group-item list-group-item-action d-flex gap-3 py-3"
					aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div>
							<h6 class="mb-0">닉네임</h6>
							<p class="mb-0 opacity-75">리뷰내용</p>
						</div>
						<small class="opacity-50 text-nowrap">작성날자</small>
					</div>
				</a> 
			</div>
		</div>


	</div>

</body>

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