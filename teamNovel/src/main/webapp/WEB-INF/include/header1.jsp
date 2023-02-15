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

#mag_tag {
	width: 55px;
	height: 51px;
	text-decoration-line: none;
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

#header_nav li a {
	font-family: AppleSDGothicNeoB;
	font-size: 25px;
}

#dropdown {
	display: inline-block;
}

#dropdown button {
	font-family: 'AppleSDGothicNeoR';
	font-size: 25px;
	border-radius: 15px;
	height: 50px;
}

.dropdown-item{
	font-family: 'AppleSDGothicNeoR';
	font-size: 20px;
}
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
function kakaoLogout() {
	window.Kakao.init("859ec84590f813c455534fba411212ba");
	window.Kakao.isInitialized();
	
    if (!Kakao.Auth.getAccessToken()) {
    	console.log('Not logged in.');
      return;
    }
    Kakao.Auth.logout(function() {
    	console.log(Kakao.Auth.getAccessToken());
    	location.href = "./logout.do"; // 로그아웃 처리
	})
}

</script>
</head>
<body>
	<!-- header -->
	<header>
		<div class="row py-3"
			style="height: 107px; padding-top: 15px; padding-bottom: 17px;">
			<div class="col" style="padding-left: 39px; padding-right: 0px;">
			</div>
			<div class="col-6 text-center" style="height: 75px;">
				<a href="./main.do"><img class="logoimg" src="../images/logo.png"
					srcset="../images/logo@2x.png 2x, ../images/logo@3x.png 3x"></a>
			</div>
			<div class="col d-flex flex-row-reverse py-4"
				style="padding-right: 39px; padding-left: 0px;">
				<div class="justify-content-end">
					<a class="link-secondary" id="mag_tag" href="./novel_search.do">
						<img src="../images/magnifier.png"
						style="width: 48px; padding: 5px; padding-bottom: 7px">
					</a>

					<!-- 로그인 -->
					<c:if test="${signIn == null}">
						<a class="login_btn" href="./login.do" role="button"
							style="padding-top: 11px; height: 41px; margin-left: 20px;">로그인</a>
					</c:if>
					<c:if test="${signIn != null}">
						<div class="dropdown" id="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								data-bs-toggle="dropdown" aria-expanded="false"
								style=" margin-left: 20px;">
								${signIn.user_nickname}</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="mypage.do">마이페이지</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" onclick="kakaoLogout()">로그아웃</a></li>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<hr style="margin-top: 0px; margin-bottom: 0px;">
		<div class="py-1">

			<ul id="header_nav"
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
		<hr style="margin-top: 0px; margin-bottom: 0px;">
	</header>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>