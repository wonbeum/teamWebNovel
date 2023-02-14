<%@page import="com.example.model.userInfoTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpSession"%>

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

.Mainbtn {
	width: 130px;
	height: 50px;
	padding: 10px 32px 9px 33px;
	border-radius: 15px;
	background-color: #ffb26b;
	font-family: 'AppleSDGothicNeoR';
	font-size: 15px;
	color: #fff;
	text-decoration-line: none;
}

.Logoutbtn {
	width: 130px;
	height: 50px;
	padding: 10px 32px 9px 33px;
	border-radius: 15px;
	font-family: 'AppleSDGothicNeoR';
	background-color: grey;
	font-size: 15px;
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


<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
<script type="text/javascript">

$(document).ready(function(){
	console.log('${signIn.user_grade}');
	if( '${signIn.user_grade}' != 'master' ){
		alert('관리자가 아닙니다.');
        location.href="./main.do";
	}
});
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
				<a href="./admin_main.do"><img class="logoimg" src="../images/adminlogo.png"></a>
			</div>
			<div class="col d-flex flex-row-reverse py-4"
				style="padding-right: 39px; padding-left: 0px;">
				<div class="justify-content-end">
					<a class="Mainbtn" href="./main.do" role="button">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg>사용자 페이지</a>
					<a class="Logoutbtn" href="logout.do" role="button">로그아웃</a>
   				</div>
			</div>
		</div>
		<hr style="margin-top: 0px; margin-bottom: 0px;">
		<div class="py-1">

			<ul id="header_nav"
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0"
				id="navbar" style="height: 64px;">
				<li><a href="./admin_member_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">회원 관리</a></li>
				<li><a href="./admin_board_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">게시물 관리</a></li>
				<li><a href="./admin_review_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">리뷰 관리</a></li>
				<li><a href="./admin_origin_request_list.do" class="nav-link px-4 link-dark"
					style="padding-bottom: 0px; padding-top: 16px;">요청 리스트</a></li>
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