<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%

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

@font-face {
	src: url("/font/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoSB.ttf");
	font-family: "AppleSDGothicNeoSB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoR.ttf");
	font-family: "AppleSDGothicNeoR";
}

.logoimg {
	width: 350px;
	height: 75px;
}

.link-secondary {
	color: #000000 !important;
}

.login_btn {
	width: 130px;
	height: 50px;
	padding: 10px 32px 9px 33px;
	border-radius: 15px;
	background-color: #ffb26b;
	font-family: 'AppleSDGothicNeoR';
	font-size: 25px;
	color: #fff;
	text-decoration-line: none;
}

#navbar {
	font-family: 'AppleSDGothicNeoB';
	font-size: 25px;
	color: #000;
}
</style>
</head>
<body>
	<!-- header -->
	<header>
		<div class="row py-3"
			style="height: 107px; padding-top: 15px; padding-bottom: 17px;">
			<div class="col" style="padding-left: 39px; padding-right: 0px;">
			</div>
			<div class="col-6 text-center" style="height: 75px;">
				<a href="./main.do"><img class="logoimg" src="/images/headerLogo.png"></a>
			</div>
			<div class="col d-flex flex-row-reverse py-4"
				style="padding-right: 39px; padding-left: 0px;">
				<div class="justify-content-end">
					<a class="link-secondary" href="./novel_search.do"
						aria-label="Search"> <svg xmlns="http://www.w3.org/2000/svg"
							width="20" height="20" fill="none" stroke="currentColor"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							class="mx-3" role="img" viewBox="0 0 24 24">
							<title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
						<path d="M21 21l-5.2-5.2" /></svg>
					</a>

					<!-- 로그인 -->
					<c:if test="${signIn == null}">
						<a class="login_btn" href="./login.do" role="button"
							style="padding-top: 11px; height: 41px;">로그인</a>
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
								<li><a class="dropdown-item" href="./logout.do">로그아웃</a></li>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<hr style="margin-top: 0px; margin-bottom: 0px;">
		<div class="py-1">

			<ul
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0"
				id="navbar" style="height: 64px;">
				<li><a href="./rank_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">랭킹</a></li>
				<li><a href="./review_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">리뷰</a></li>
				<li><a href="./novel_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">웹소설</a></li>
				<li><a href="board_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">커뮤니티</a></li>
				<li><a href="origin_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">원작소설 찾기</a></li>
			</ul>
		</div>
		<hr style="margin-top: 0px;">
	</header>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>