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

#login-button ,#adminlogin-button{
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

.login-bottom{
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
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$('#tablists').on('show.bs.tab', function(e) {
			let Target1 = e.target;
			Target1.style.background = "#ffb26b"
			let Target2 = e.relatedTarget;
			Target2.style.background = "white";
		});

		$('a[data-link="logintab"]').on('show.bs.tab', function(e) {
			let myTarget = e.target;
			myTarget.style.color = "white";
			let futureTarget = e.relatedTarget;
			futureTarget.style.color = "#ffb26b";
		});
	});
</script>
</head>
<body>


	<!-- header -->
	<jsp:include page="../include/header1.jsp"></jsp:include>

	<!-- 본문 -->


	<div class="container" id="login_form">
		<ul class="nav nav-pills nav-justified" role="tablists" id="tablists">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="pill" href="#login" data-link="logintab"
				style="background-color: #ffb26c; color: #fff;">로그인</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#admin" data-link="logintab" style="color: #ffb26c;">관리자
					로그인</a></li>
		</ul>

		<div class="tab-content">
			<div id="login" class="tab-pane fade show active">
				<form action="./login_ok.do" method="post">
					<div class="login-ment mb-3">
						<p>로그인</p>
					</div>

					<!-- Email input -->
					<div class="form-outline mb-4">
						<label class="form-label" for="loginName">이메일주소 *</label> <input
							id="loginName" class="form-control" name="user_email" />
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4">
						<label class="form-label" for="loginPassword">비밀번호 *</label> <input
							type="password" id="loginPassword" class="form-control"
							name="user_password" />
					</div>

					<!-- Submit button -->
					<div class="form-outline">
						<button id="login-button" type="submit"
							class="btn btn-primary btn-block mb-4">로그인</button>
					</div>

					<!-- Register buttons -->
					<div>
						<div class="text-center">
							<p class="login-bottom">
								계정이 없으신가요?<a id="register-link" href="./register.do">회원가입</a>을 해보세요
							</p>
						</div>

						<div class="text-center mb-3">
							<!-- Simple link -->
							<p class="login-bottom">
								비밀번호를 잊으셨나요?<a id="password-search" href="#!">비밀번호 찾기</a>
							</p>
						</div>
					</div>
					<!-- 수정 필요 -->
					<div class="row mb-4">

						<div id="naver_id_login"></div>
						<script type="text/javascript">
							var naver_id_login = new naver_id_login(
									"t_lypkaq8BrTPJcNpFhx",
									"http://localhost:8080/main.do");
							var state = naver_id_login.getUniqState();
							naver_id_login.setButton("green", 3, 40);
							naver_id_login
									.setDomain("http://localhost:8080/login.do");
							naver_id_login.setState(state);
							naver_id_login.setPopup();
							naver_id_login.init_naver_id_login();
						</script>
					</div>
				</form>
			</div>
			<div id="admin" class="tab-pane fade">
				<form action="./adminlogin_ok.do" method="post">
					<!-- Email input -->
					<div class="form-outline mb-4">
						<label class="form-label" for="loginName">이메일주소 *</label> <input
							id="loginName" class="form-control" name="user_email" />
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4">
						<label class="form-label" for="loginPassword">비밀번호 *</label> <input
							type="password" id="loginPassword" class="form-control"
							name="user_password" />
					</div>

					<!-- Submit button -->
					<div class="form-outline">
						<button id="adminlogin-button" type="submit"
							class="btn btn-primary btn-block mb-4">로그인</button>
					</div>
				</form>
			</div>
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