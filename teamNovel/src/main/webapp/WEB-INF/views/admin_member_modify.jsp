<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.example.model.userInfoTO"%>

<%
userInfoTO to = (userInfoTO) request.getAttribute("to");

String email = to.getUser_email();
String nickname = to.getUser_nickname();
String cdate = to.getUser_cdate();
String gender = to.getUser_gender();
String birth = to.getUser_birth();

String genderM = "";
String genderF = "";
String genderN = "";

if( gender.equals("M") ){
	genderM = "checked";
} else if( gender.equals("F") ){
	genderF = "checked";
} else {
	genderN = "checked";
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}

body {
	background-color: rgb(200, 200, 200);
}
</style>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('mbtn').onclick = function() {
			document.mfrm.submit();
		};
	};
</script>
</head>
<body>

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
				<a class="p-2 link-secondary" href="#">회원 관리</a> <a
					class="p-2 link-secondary" href="#">게시물 관리</a> <a
					class="p-2 link-secondary" href="#">리뷰 관리</a> <a
					class="p-2 link-secondary" href="#">요청 리스트</a>
			</nav>
		</div>
	</div>

	<!-- 본문 -->
	<h2>회원 정보 상세보기</h2>

	<div class="table-responsive">
		<form action="./admin_member_modify_ok.do" method="post" name="mfrm">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="nickname" value="<%=nickname%>" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value="<%=email%>"
							readonly /></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="inlineRadio1" value="M" <%=genderM %>> <label
									class="form-check-label" for="inlineRadio1">남성</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="inlineRadio2" value="F" <%=genderF %>> <label
									class="form-check-label" for="inlineRadio2">여성</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="inlineRadio3" value="N" required <%=genderN %>> <label
									class="form-check-label" for="inlineRadio2">비공개</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" name="birth" value="<%=birth%>" /></td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td><input type="text" name="cdate" value="<%=cdate%>"
							readonly /></td>
					</tr>
				</tbody>
			</table>
			<div>
				<input type="button" class="btn btn-primary" value="돌아가기" /> <input
					type="button" class="btn btn-primary float-right" value="수정"
					id="mbtn" /> <input type="button"
					class="btn btn-primary float-right" value="삭제" />
			</div>
		</form>
	</div>


	<hr class="footer-div">

	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">랭킹</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">리뷰</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">웹소설</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">커뮤니티</a></li>
				<li class="nav-item"><a href="#"
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