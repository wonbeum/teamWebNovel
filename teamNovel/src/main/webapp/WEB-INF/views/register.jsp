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
  	width: 109px;
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	color: #fff;
    padding-left: 12px;
    padding-top: 14px;
    padding-bottom: 10px;
}

</style>

<script>
	// 입력값 검사
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

   	Array.prototype.filter.call(forms, (form) => {
    	form.addEventListener('submit', function (event) {
       
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          
          // 비밀번호 확인 다를때
          if(document.mainform.password.value.trim() != document.mainform.password2.value.trim() ){
        		alert( '입력한 두 비밀번호가 다릅니다.' );
                event.preventDefault();
                event.stopPropagation();
				return false;
          }
			
          form.classList.add('was-validated');
        }, false);
      });
      
      document.getElementById( 'nicknamebtn' ).onclick = function() {
    	  if(document.getElementById('nickname').value.trim()!='중복'
      			|| document.getElementById('nickname').value.trim()!=null){
   	    	  alert('사용 가능한 닉네임 입니다.');
    	  } else {
   	    	  alert('사용 불가능한 닉네임 입니다.');    		  
    	  }
      }
      
      
    }, false);
	
	
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
					method="post" name="mainform"novalidate>
					
					<div class="mb-3">
						<p id="labeltext" for="email">이메일*</p> <input type="email" name="user_email"
							value="" class="form-control" id="email"
							placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					
					<p id="labeltext" for="nickname">닉네임*</p>
					<div class="mb-3">
						<input type="text" name="user_nickname" value=""  class="form-control"
							placeholder=""  aria-label="nickname"
							aria-describedby="button-addon2" required>
						<div class="invalid-feedback">닉네임을 입력해주세요.</div>
						<p id="nickname_label">나를 표현할 닉네임을 입력해주세요.</p>
					</div>
					
					<div class="mb-3">
						<p id="labeltext" for="password">비밀번호*</p> <input type="password"
							name="user_password" value="" class="form-control" id="password"
							placeholder="" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						<p id="pw_label">•다른 개인 정보와 유사한 비밀번호는 사용할 수 없습니다.<br/>
							•비밀번호는 최소 8자 이상이어야 합니다.<br/>
							•통상적으로 자주 사용되는 비밀번호는 사용할 수 없습니다.<br/>
							•숫자로만 이루어진 비밀번호는 사용할 수 없습니다.</p>
					</div>
					
					<div class="mb-3">
						<p id="labeltext" for="password_check">비밀번호 확인*</p> <input type="password"
							name="password2" value="" class="form-control"
							id="password_check" placeholder="" required>
						<div class="invalid-feedback">비밀번호를 다시 입력해주세요.</div>
						<p id="nickname_label">확인을 위해 이전과 동일한 비밀번호를 입력하세요.</p>
					</div>
					
						<div class="mb-3">
						<p id="labeltext" for="password_check">성별*</p>
						<div class="form-check form-check-inline" >
							<input class="form-check-input" type="radio" name="user_gender"
								id="inlineRadio1" value="M"> <label
								class="form-check-label" for="inlineRadio1">남성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="user_gender"
								id="inlineRadio2" value="F"> <label
								class="form-check-label" for="inlineRadio2">여성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="user_gender"
								id="inlineRadio2" value="N" required> <label
								class="form-check-label" for="inlineRadio2">비공개</label>
						</div>
						<p id="nickname_label">성별에 따른 취향을 분석하기 위해 꼭 입력해주세요.</p>
					</div>

					<div class="mb-3">
						<p id="labeltext" for="birth">생년월일*</p> <input type="text" name="user_birth"
							value="" class="form-control" id="birth" placeholder="8자리를 입력"
							required>
						<div class="invalid-feedback">생년월일을 입력해주세요.</div>
						<p id="nickname_label">연령에 따른 취향을 분석하기 위해 꼭 입력해주세요.</p>
					</div>

					<hr style="color: #777;" />
					<div>
						<input type="checkbox" class="custom-control-input" id="aggrement" required > 
						<span id="agreetext" class="custom-control-label" >개인정보 수집 및 이용에 동의합니다.</span>
						<div class="invalid-feedback">반드시 동의에 체크해주세요.</div>
					</div>
					<hr style="color: #777;" />
					<div class="row" style="margin-top: 39px;">
						<div class="col-auto me-auto">
							<a class="btn btn-outline-secondary" href="./login.do"
								role="button" id="listbtn">뒤로가기</a>
						</div>
						<div class="col-auto">
							<button type="submit" id="savebutton" class="btn btn-secondary">회원가입</button>

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