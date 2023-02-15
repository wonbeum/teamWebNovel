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

#agreement {
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
  	width: 109px;
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	color: #fff;
    padding-left: 12px;
    padding-top: 14px;
    padding-bottom: 10px;
}

#bCheckmsg, #eCheckmsg, #nCheckmsg, #p2Checkmsg, #agreeCheckmsg, #genCheckmsg {
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
	
	let emailFlag = false;
	let nicknameFlag = false;
	let pwFlag = false;
	let pwEqFlag = false;
	let birthFlag = false;
	let agreeFlag = false;
	
	// 이메일 중복검사
	$('#email').keyup(function(){
		let id = $('#email').val();
		emailFlag = EmailCheck(id);
	});
	
	// 닉네임 중복검사
	$('#nickname').keyup(function(){
		let nickname = $('#nickname').val();
		nickname = NicknameCheck(nickname);
	});
	
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
	
	// 생일 형식
	$('#birth').keyup(function(){
		// 8글자 생년월일 정규식
		let birthCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
		if(!birthCheck.test($('#birth').val())){
			//console.log("생일아님");
			$('#bCheckmsg').text("8글자 생일형식이 아닙니다");
			birthFlag = false;
			
		} else {
			$('#bCheckmsg').css("color","green").text("올바른 생일형식입니다");
			birthFlag = true;
		}
		return birthFlag;
		console.log(birthFlag);
	});
	
   	// 버튼 실행
	$('#savebutton').click(function(){
		
		// 성별 체크 했는지 확인
		if($("input[name='user_gender']:checked").val()==null){
			$('#genCheckmsg').css("color","#af1515").text("성별을 체크해주세요.");
			genFlag = false;
		} else {
			$('#genCheckmsg').text("");
			genFlag = true;
		}
		
		// 회원가입 동의 체크 했는지 확인
		if(!$('#agreement').is(':checked')){
			$('#agreeCheckmsg').css("color","#af1515").text("동의에 체크해주세요.");
			agreeFlag = false;
		} else {
			$('#agreeCheckmsg').text("");
			agreeFlag = true;
		}
		//console.log(nicknameFlag);
		//console.log(emailFlag);
		//console.log(pwFlag);
		//console.log(pwEqFlag);
		//console.log(birthFlag);
		//console.log(genFlag);
		//console.log(agreeFlag);
		submitForm();
	});
   	
	function submitForm() {
		event.preventDefault();
		if(
				nicknameFlag == true &&  
				emailFlag == true && 
				pwFlag == true && 
				pwEqFlag == true &&
				birthFlag == true &&
				genFlag == true &&
				agreeFlag ==true
		){
			$('#submitform').submit(); // form 제출
		} else {
			if(emailFlag == false){
				$('#email').focus();
			}
			
			if(nicknameFlag == false) {
				$('#nickname').focus();
			}
			
			if(pwFlag == false) {
				$('#password').focus();
			}
			
			if(pwEqFlag == false) {
				$('#password_check').focus();
			}

			if(birthFlag == false) {
				$('#birth').focus();
			}
			
			if(genFlag == false) {
				$('#gender').focus();
			}
			
			if(agreeFlag == false) {
				$('#agreement').focus();
			}
		}
	}
	
	
	// 이메일 중복검사
	function EmailCheck(id){
		$.ajax({
			url : 'idCheckAjax.do',
			type : 'get',
			dataType : 'json',
			data : {
				'id' : id
			},
			success : function(jsonData){
				//console.log("성공");
				//console.log(jsonData);
				if(jsonData!=0){
					$('#eCheckmsg').css("color","#af1515").text("이미 가입된 이메일 입니다.");
					
					emailFlag = false;
					
				} else {
					// 이메일 정규식
					let emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
					if(emailCheck.test($('#email').val())){
						$('#eCheckmsg').css("color","green").text("가입 가능한 이메일 입니다.");
						emailFlag = true;
						
					} else {
						$('#eCheckmsg').css("color","#af1515").text("이메일 형식을 맞추세요.");
						emailFlag = false;
						
					}
				}
				return emailFlag;
			},
			error : function(e) {
				alert("error !");
			}
		});
	}
	
	// 닉네임 중복검사
	function NicknameCheck(nickname){
		$.ajax({
			url : 'nicknameCheckAjax.do',
			type : 'get',
			dataType : 'json',
			data : {
				'nickname' : nickname
			},
			success : function(jsonData){
				//console.log("성공");
				//console.log(jsonData);
				if(jsonData!=0){
					$('#nCheckmsg').css("color","#af1515").text("사용중인 닉네임입니다.");
					nicknameFlag = false;
				} else {
					// 한글, 영문, 특수문자(-_.)포함한 2~10글자 닉네임
					let nicknameCheck = /^[a-zA-Zㄱ-힣0-9-_.]{2,10}$/;
					if(nicknameCheck.test($('#nickname').val())){
						$('#nCheckmsg').css("color","green").text("사용가능한 닉네임 입니다.");
						nicknameFlag = true;
					} else if(!nicknameCheck.test($('#nickname').val()) ) {
						$('#nCheckmsg').css("color","#af1515").text("2~10자의 닉네임을 입력하세요.");
						nicknameFlag = false;
					}
				}
				return nicknameFlag;
			},
			error : function(e) {
				alert("error !");
			}
		});
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
			<p class="text-start" id="title" style="margin-bottom: 0px;">회원가입</p>
			<hr style="color: #777;" />
				<form class="validation-form" action="./register_ok.do"
					method="post" name="mainform" id="submitform" >
					
					<div class="mb-5">
						<span id="labeltext">이메일*</span><span id="eCheckmsg"></span> 
						<input type="email" name="user_email"
							value="" class="form-control" id="email"
							placeholder="you@example.com" >
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					
					<span id="labeltext">닉네임*</span><span id="nCheckmsg"></span>
					<div class="mb-5">
						<input type="text" name="user_nickname" value=""  class="form-control"
							placeholder=""  aria-label="nickname" id="nickname"
							aria-describedby="button-addon2" >
						<div class="invalid-feedback">닉네임을 입력해주세요.</div>
						<p id="nickname_label">나를 표현할 닉네임을 입력해주세요. (특수문자는 -_.만)</p>
					</div>
					
					<div class="mb-5">
						<span id="labeltext">비밀번호*</span><p id="pCheckmsg"></p> 
						<input type="password"
							name="user_password" class="form-control" id="password">
						<p id="pw_label">•다른 개인 정보와 유사한 비밀번호는 사용할 수 없습니다.<br/>
							•비밀번호는 최소 8자 이상이어야 합니다.<br/>
							•통상적으로 자주 사용되는 비밀번호는 사용할 수 없습니다.<br/>
							•비밀번호는 문자와 숫자를 모두 포함해야 합니다.</p>
					</div>
					
					<div class="mb-5">
						<span id="labeltext">비밀번호 확인*</span><span id="p2Checkmsg"></span>
						<input type="password"
							name="password2" value="" class="form-control" id="password_check">
						<p id="nickname_label">확인을 위해 이전과 동일한 비밀번호를 입력하세요.</p>
					</div>
					
					<div class="mb-5">
						<div>
						<span id="labeltext" for="password_check">성별*</span><span id="genCheckmsg"></span>
						</div>
						<div class="form-check form-check-inline" >
							<input class="form-check-input" type="radio" name="user_gender"
								 value="M"> <label
								class="form-check-label" for="inlineRadio1">남성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="user_gender"
								 value="F"> <label
								class="form-check-label" for="inlineRadio2">여성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="user_gender"
								value="N" > <label
								class="form-check-label" for="inlineRadio2">비공개</label>
						</div>
						<p id="nickname_label">성별에 따른 취향을 분석하기 위해 꼭 입력해주세요.</p>
					</div>

					<div class="mb-5">
						<span id="labeltext" for="birth">생년월일*</span><span id="bCheckmsg"></span>
						<input type="text" name="user_birth"
							value="" class="form-control" id="birth" placeholder="8자리를 입력"
							>
						<div class="invalid-feedback">생년월일을 입력해주세요.</div>
						<p id="nickname_label">연령에 따른 취향을 분석하기 위해 꼭 입력해주세요.</p>
					</div>

					<hr style="color: #777;" />
					<div>
						<input type="checkbox" class="custom-control-input" id="agreement" name="agreement" > 
						<span id="agreetext" class="custom-control-label" >개인정보 수집 및 이용에 동의합니다.</span>
						<p id="agreeCheckmsg"></p>
					</div>
					<hr style="color: #777;" />
					<div class="row" style="margin-top: 39px;">
						<div class="col-auto me-auto">
							<a class="btn btn-outline-secondary" href="./login.do"
								role="button" id="listbtn">뒤로가기</a>
						</div>
						<div class="col-auto">
							<button type="button" id="savebutton" class="btn btn-secondary">회원가입</button>

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