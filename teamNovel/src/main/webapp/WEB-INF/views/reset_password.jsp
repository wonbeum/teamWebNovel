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
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
#login_form {
	margin-top: 60px;
	margin-bottom: 60;
	width: 30%;
}

.login-ment {
	font-size: 26px
}

.tab-content {
	margin-top: 6%;
	margin-left: 3%;
}

.form-label {
	font-size: 18px;
	font-weight: 500;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	text-align: left;
	color: #777;
}

#login-button, #adminlogin-button {
	width: 100%;
	border: solid 2px #ffb26b;
	background-color: #ffb26c;
	padding-top: 6px;
	font-family: AppleSDGothicNeoR;
	font-size: 15px;
	font-weight: 800;
	font-style: normal;
	text-decoration-line: none;
	text-align: center;
	color: #fff;
}

.nav-scroller {
	border: 1px solid black;
}

.login-bottom {
	font-size: 15px;
	font-weight: 500;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	color: #777;
}

#register-link, #password-search{
	font-size: 15px;
	font-weight: 500;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	color: #ffb26c;
	text-decoration: none;
}
#content_title{
	font-size: 24px;
	font-weight: 500;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	text-align: left;
	margin-bottom: 30px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
</head>
<body>


	<!-- header -->
	<jsp:include page="../include/header1.jsp"></jsp:include>

	<!-- 본문 -->


	<div class="container" id="login_form">
		<div id="admin" class="">
			<form action="./reset_password_ok.do" method="post">
				<div id="content_title">비밀번호 재설정</div>
				<!-- Email input -->
				<div class="form-outline mb-4">
					<label class="form-label" for="loginName">이메일주소 *</label> <input
						id="loginName" class="form-control" name="user_email" />
				</div>

				<!-- Password input -->
				<div class="form-outline mb-4">
					<label class="form-label" for="loginPassword">생년월일 *</label> <input
						type="password" id="loginPassword" class="form-control"
						name="user_bitrh" />
				</div>

				<!-- Submit button -->
				<div class="form-outline">
					<button id="adminlogin-button" type="submit"
						class="btn btn-primary btn-block mb-4">비밀번호 재설정</button>
				</div>
			</form>
		</div>
	</div>



	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>