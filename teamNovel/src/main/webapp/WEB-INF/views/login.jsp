<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gathervel</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
@font-face {
	src: url("/font/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoM.ttf");
	font-family: "AppleSDGothicNeoM";
}

@font-face {
	src: url("/font/AppleSDGothicNeoEB.ttf");
	font-family: "AppleSDGothicNeoEB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoR.ttf");
	font-family: "AppleSDGothicNeoR";
}

@font-face {
	src: url("/font/AppleSDGothicNeoM.ttf");
	font-family: "AppleSDGothicNeoM";
}

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
	font-family: AppleSDGothicNeoM;
	text-align: left;
	color: #777;
}

#login_title {
	font-family: AppleSDGothicNeoB;
	color: #000;
}

#login-button, #adminlogin-button {
	width: 100%;
	border: solid 2px #ffb26b;
	background-color: #ffb26c;
	padding-top: 6px;
	font-family: AppleSDGothicNeoM;
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
	font-family: AppleSDGothicNeoR;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	color: #777;
}

#register-link, #password-search {
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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
window.Kakao.init("859ec84590f813c455534fba411212ba");

function createHiddenLoginForm(email){
	
	let frm = document.createElement('form');
	frm.setAttribute('method', 'post');
	frm.setAttribute('action', './kakaologin.do');
	let hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','user_email');
	hiddenInput.setAttribute('value',email);
	frm.appendChild(hiddenInput);
	document.body.appendChild(frm);
	frm.submit();
	
}

function kakaoLogin() {
	window.Kakao.Auth.login({
		scope:'profile_nickname, account_email, gender, age_range, birthday',
		success: function(authObj){
			//console.log(authObj);
			window.Kakao.API.request({
				url: '/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account;
					//console.log(kakao_account);
					//console.log(kakao_account.email);
					//console.log(kakao_account.profile.nickname);
					//console.log(kakao_account.gender);
					//console.log(kakao_account.age_range);
					//console.log(kakao_account.birthday);
					
					 $.ajax({
	    					type : "post",
	    					url : 'kakaoCheck.do', // ID중복체크를 통해 회원가입 유무를 결정
	    					data : {
								'user_email' :kakao_account.email
								},
	    					dataType:"json",
	    					success : function(json){   				
	    						
	    							//console.log('성공');
	    							//console.log(json);
	    							if(json==0){
	    								//존재하지 않을 때 회원가입
	    								$.ajax({
	        								type : "post",
	        		    					url : 'kakaoregister.do',
	        		    					data : {
	        		    						"user_email": kakao_account.email,
	        		    						"user_nickname": kakao_account.profile.nickname,
	        		    						"user_gender" : kakao_account.gender,
	        		    						"user_birth" : kakao_account.birthday
	        		    						},
	        		    					dataType :"json",
	        		    					success : function(json){
	        		    						//console.log(json);
	        		    						if(json==1){
	        		    							// 로그인
	        		    							createHiddenLoginForm(kakao_account.email);		    							
	        		    						} else {
	        		    							alert('카카오 회원가입 실패. 일반계정으로 로그인하시기 바랍니다.');
	        		    						}
	        		    					},
	        		    					error: function(request, status, error){
	        		    		                   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	        		    		                }
	        							});
	    							} else if(json==1){
	    								// 존재할경우 자동로그인
	    								createHiddenLoginForm(kakao_account.email);
	    							}
	    				
	    											
	    					},
	    					error: function(request, status, error){
	    		                   //alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	    		            }
	    				});
				}
			});
		}
	})
}

	$(document).ready(function() {
		//859ec84590f813c455534fba411212ba
		
		
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


	<div class="container" id="login_form" style="width: 335px;">
		<ul class="nav nav-pills nav-justified" role="tablists" id="tablists">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="pill" href="#login" data-link="logintab"
				style="background-color: #ffb26c; color: #fff; font-family: AppleSDGothicNeoM; font-size: 18px; font-weight: 400;">로그인</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#admin" data-link="logintab"
				style="color: #ffb26c; font-family: AppleSDGothicNeoM; font-size: 18px; font-weight: 400;">관리자
					로그인</a></li>
		</ul>

		<div class="tab-content">
			<div id="login" class="tab-pane fade show active">
				<form action="./login_ok.do" method="post">
					<div class="login-ment mb-3">
						<p id="login_title">로그인</p>
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
								계정이 없으신가요?<a id="register-link" href="./register.do">회원가입</a>을
								해보세요
							</p>
						</div>

						<div class="text-center mb-3">
							<!-- Simple link -->
							<p class="login-bottom">
								비밀번호를 잊으셨나요?<a id="password-search" href="./reset_password.do">비밀번호
									찾기</a>
							</p>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-md-6 col-sm-12">
							<a href="javascript:kakaoLogin();"><img
								src="../images/kakao_login_button2.png" /></a>
						</div>
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