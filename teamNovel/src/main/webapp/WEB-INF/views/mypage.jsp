<%@page
	import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.model.userInfoTO"%>
<%

%>
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
	width: 77.1%;
	height: 87.2%;
	margin: 0 30px;
	padding: 40px 38px 33px 38px;
	border-radius: 20px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
	display: inline-block;
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
	font-size: 27px;
	text-align: left;
	color: #000;
	text-align: left;
}

#sub_title {
	font-family: AppleSDGothicNeoM;
	font-size: 18px;
	font-weight: 500;
	text-align: left;
	color: #777777;
	
}

#delete_user {
	font-family: AppleSDGothicNeoM;
	font-size: 15px;
	font-weight: 500;
	text-align: right;
	color: #777777;
	text-decoration: underline;
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

#passbtn {
	font-family: AppleSDGothicNeoEB;
	border-radius: 13px;
	background-color: #000;
	width: 200px;
	height: 54px;
	font-size: 18px;
	font-weight: 300;
	color: #fff;
	padding-left: 10px;
	padding-top: 14px;
}

#labeltext {
	font-family: AppleSDGothicNeoB;
	font-size: 18px;
	font-weight: 500;
	text-align: left;
	color: #777;
	min-width: 95px;
}

#textmsg, #nCheckmsg, #bCheckmsg {
	font-family: AppleSDGothicNeoM;
	font-size: 14px;
	font-weight: 500;
	text-align: left;
	color: #777777;
}

label.form-check-label {
	font-family: AppleSDGothicNeoM;
	font-size: 17px;
	font-weight: 500;
	text-align: left;
	color: #777;
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
</style>

<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
//????????? ??????
window.addEventListener('load', () => {

	let nicknameFlag = true;
	let birthFlag = true;

	// ????????? ????????????
	$('#nickname').keyup(function(){
		let nickname = $('#nickname').val();
		nickname = NicknameCheck(nickname);
	});

	
	// ?????? ??????
	$('#birth').keyup(function(){
		// 8?????? ???????????? ?????????
		let birthCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
		if(!birthCheck.test($('#birth').val())){
			$('#bCheckmsg').css("color","#af1515").text("8?????? ??????????????? ????????????");
			birthFlag = false;
		
		} else {
			$('#bCheckmsg').css("color","green").text("????????? ?????????????????????");
			birthFlag = true;
		}
	});
	  
	
  	// ??????
	$("input[name='user_gender'][value=${signIn.user_gender}]").prop("checked",true);
  	
	$('#savebutton').click(function(){
		//console.log(nicknameFlag);
		//console.log(birthFlag);
		submitForm();
	});
   	
	function submitForm() {
		event.preventDefault();
		if(
				nicknameFlag == true &&  
				birthFlag == true
		){
			$('#submitform').submit(); // form ??????
		} else {
			
			if(nicknameFlag == false) {
				$('#nickname').focus();
			}

			if(birthFlag == false) {
				$('#birth').focus();
			}
		}
	}
  	
	//????????? ????????????
	function NicknameCheck(nickname){
		$.ajax({
			url : 'nicknameCheckAjax.do',
			type : 'get',
			dataType : 'json',
			data : {
				'nickname' : nickname
			},
			success : function(jsonData){
				//console.log("??????");
				//console.log(jsonData);
				if(jsonData==1){
					if($('#nickname').val()=="${signIn.user_nickname}"){	
						$('#nCheckmsg').css("color","green").text("?????? ????????? ?????????.");
						nicknameFlag = true;
					} else {
						$('#nCheckmsg').css("color","#af1515").text("???????????? ??????????????????.");
						nicknameFlag = false;
					}
				} else {
					// ??????, ??????, ????????????(-_.)????????? 2~10?????? ?????????
					let nicknameCheck = /^[a-zA-Z???-???0-9-_.]{2,10}$/;
					if(nicknameCheck.test($('#nickname').val())){
						$('#nCheckmsg').css("color","green").text("??????????????? ????????? ?????????.");
						nicknameFlag = true;
					} else {
						$('#nCheckmsg').css("color","#af1515").text("2~10?????? ???????????? ??????????????????.");
						nicknameFlag = false;
					}
				}
				return nicknameFlag;
			},
			error : function(e) {
				console.log(e.status);
			}
		});
	}
});

function mypage_delete_ok() {
	let email = "${signIn.user_email}";
	let check = confirm('????????? ????????????????????????? ??????????????? ?????? ???????????????.');
	if(check){
		location.href='./mypage_delete_ok.do?user_email='+email;
	}
}
	



</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../include/header1.jsp"></jsp:include>

	<!-- main -->
	<div class="background">
		<div class="container justify-content-center" id="rouded_box">
			<div class="row">
				<div class="text-start col" id="title" style="margin-bottom: 0px;">???????????????</div>
				<div class="text-end col">
					<div id="delete_user" onclick='mypage_delete_ok()'>????????????</div>
				</div>
			</div>
			<p id="sub_title">???????????? ??????</p>
			<hr style="color: #e5e8eb;" />
			<div class="form">
				<form class="validation-form" action="./mypage_modify_ok.do"
					method="post" id="submitform" >
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-2 col-form-label"
							id="labeltext">?????????*</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="email"
								value="${signIn.user_email }" readonly>
							<p id="textmsg">???????????? ????????? ??? ????????????.</p>
						</div>
					</div>

					<div class="mb-5 row">
						<label class="col-sm-2 col-form-label" id="labeltext">?????????*</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="user_nickname"
								required value="${signIn.user_nickname}" id="nickname">
							<div id="nCheckmsg"></div>
						</div>
					</div>

					<div class="mb-5 row">
						<label class="col-sm-2 col-form-label" id="labeltext">??????*</label>
						<div class="col text-start">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="user_gender"
									value="M"> <label class="form-check-label"
									for="inlineRadio1">??????</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="user_gender"
									value="F"> <label class="form-check-label"
									for="inlineRadio2">??????</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="user_gender"
									value="N" required> <label class="form-check-label"
									for="inlineRadio2">?????????</label>
							</div>
						</div>
					</div>

					<div class="mb-5 row">
						<label for="inputPassword" class="col-sm-2 col-form-label"
							id="labeltext">????????????*</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="user_birth"
								id="birth" value="${signIn.user_birth}">
							<div id="bCheckmsg"></div>
						</div>
					</div>



					<div class="row" style="margin-top: 39px;">
						<div class="col-auto me-auto">
							<button type="submit" id="savebutton" class="btn btn-secondary">??????
								?????? ??????</button>
						</div>
						<div class="col-auto">
							<a class="btn btn-outline-secondary" href="mypage_password.do" role="button"
								id="passbtn">???????????? ?????? ??????</a>
						</div>
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

