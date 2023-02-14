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

#rouded_box {
	width: 30.7%;
	min-width: 435px;
	height: 100%;
	margin: 0 30px;
	padding: 40px 38px 33px 38px;
	border-radius: 20px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
	display: inline-block;
	text-align: left;
}

.background {
	text-align: center;
	background-color: #f8f8fb;
	height: 100%;
	padding-top: 59px;
	padding-bottom: 100px;
}

#title {
	font-family: AppleSDGothicNeoB;
	font-size: 26px; 
	color: #000;
	text-align: left;
}

#labeltext {
	font-family: AppleSDGothicNeoB;
  	font-size: 18px;
  	font-weight: 500;
  	text-align: left;
  	color: #777;
  	margin-bottom: 11px;
  	margin-top: 23px;
}

#pw_label, #nickname_label {
	 font-family: AppleSDGothicNeoM;
  	font-size: 15px;
  	font-weight: 500;
  	line-height: 2;
  	text-align: left;
  	color: #777;
}

#inputbox {
	width: 516px;
  	height: 54px;
  	border-radius: 14px;
  	border: solid 1px #e5e8eb;
  	background-color: #fff;
}

#nicknamebox {
	width: 516px;
  	height: 54px;
  	border-radius: 14px;
  	border: solid 1px #e5e8eb;
  	background-color: #fff;
}

input {
	width: 516px;
  	height: 54px;
  	border-radius: 14px;
  	border: solid 1px #e5e8eb;
  	background-color: #fff;
	font-family: AppleSDGothicNeoM;
  	font-size: 15px;
  	font-weight: 500;
  	line-height: 2;
  	text-align: left;
  	color: #777;
}
div.invalid-feedback {
	font-family: AppleSDGothicNeoM;
  	font-size: 15px;
  	font-weight: 500;
  	line-height: 2;
  	text-align: left;
}

label.form-check-label {
	font-family: AppleSDGothicNeoM;
  	font-size: 17px;
  	font-weight: 500;
  	text-align: left;
  	color: #777;
}

#aggrement {
	width: 15px;
  	height: 15px;
}

#agreetext {
	font-family: AppleSDGothicNeoB;
  	font-size: 17px;
  	font-weight: 500;
  	text-align: left;
  	color: #777;
}

#listbtn {
	font-family: AppleSDGothicNeoEB;
	border-radius: 13px;
  	background-color: #000;
  	width: 109px;
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	color: #fff;
    padding-left: 10px;
    padding-top: 14px;
}
#savebutton {
	font-family: AppleSDGothicNeoEB;
	border-radius: 13px;
	border: 0px;
  	background-color: #ffb26b;
  	width: 200px;
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	color: #fff;
    padding-left: 12px;
    padding-top: 14px;
    padding-bottom: 10px;
}

#bCheckmsg, #eCheckmsg, #nCheckmsg, #p2Checkmsg {
	font-family: AppleSDGothicNeoM;
  	font-size: 14px;
  	font-weight: 500;
  	text-align: left;
  	color: #af1515;
  	padding-left: 20px;
}

#pCheckmsg {
	font-family: AppleSDGothicNeoM;
  	font-size: 14px;
  	font-weight: 500;
  	text-align: left;
  	color: #af1515;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
// 입력값 검사
window.addEventListener('load', () => {

	let pwFlag=false;
	let pwEqFlag=false;
	
	// 비밀번호 입력검사
	$('#password').keyup(function(){
		let passwordCheck = /(?=.*\d)(?=.*[a-zA-ZS]).{8,20}/;
		if(!passwordCheck.test($('#password').val())){
			//console.log("생일아님");
			$('#pCheckmsg').css("color","#af1515").text("8~20자의 문자,숫자를 포함한 비밀번호를 입력하세요.");
			pwFlag = false;
			
		} else {
			$('#pCheckmsg').css("color","green").text("사용 가능한 비밀번호입니다.");
			pwFlag = true;
		}
	});
	
	// 비밀번호 재확인
	$('#password_check').keyup(function(){
		if($('#password_check').val()!=$('#password').val()){
			$('#p2Checkmsg').css("color","#af1515").text("위 비밀번호와 동일하지 않음");
			pwEqFlag = false;
			
		} else if($('#password_check').val()==$('#password').val()) {
			$('#p2Checkmsg').css("color","green").text("위 비밀번호와 동일함");
			pwEqFlag = true;
		}
	});
	
	
     
	// 버튼 실행
	$('#savebutton').click(function(){
		submitForm();
	});
   	
	function submitForm() {
		event.preventDefault();
		if(
				pwFlag == true && 
				pwEqFlag == true
		){
			$('#submitform').submit(); // form 제출
		} else {
			
			if(pwFlag == false) {
				$('#password').focus();
			}
			
			if(pwEqFlag == false) {
				$('#password_check').focus();
			}
		}
	}
   	

});

</script>

</head>
<body>

	<!-- header -->
	<jsp:include page="../include/header1.jsp"></jsp:include>
	
	<!-- main -->
<div class="background">
		<div class="container justify-content-center" id="rouded_box">
			<p class="text-start" id="title" style="margin-bottom: 0px;">비밀번호 변경</p>
			<hr style="color: #777;" />
				<form class="validation-form" action="./mypage_password_ok.do"
					method="post" name="submitform" id="submitform">
					
					<div class="mb-5">
						<span id="labeltext">새 비밀번호</span><p id="pCheckmsg"></p> 
						<input type="password"
							name="user_password" class="form-control" id="password">
						<p id="nickname_label">영문, 숫자를 포함한 8자 이상의 비밀번호를 입력해주세요.</p>
					</div>
					
					<div class="mb-5">
						<span id="labeltext">새 비밀번호 확인</span><span id="p2Checkmsg"></span>
						<input type="password"
							name="password2" value="" class="form-control"
							id="password_check">
					</div>
					
			
					<div class="row" style="margin-top: 39px;">
						<div class="col-auto me-auto">
							<a class="btn btn-outline-secondary" href="./mypage.do"
								role="button" id="listbtn">뒤로가기</a>
						</div>
						<div class="col-auto">
							<button type="button" id="savebutton" class="btn btn-secondary">비밀번호 변경</button>

						</div>
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