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

if (gender.equals("M")) {
	genderM = "checked";
} else if (gender.equals("F")) {
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}

body {
	background-color: rgb(200, 200, 200);
}

td{
	text-align: center;
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


	<!-- header -->
	<jsp:include page="../include/header2.jsp"></jsp:include>

	<div class="container w-50">
		<!-- 본문 -->
		
		<h2>회원 정보 상세보기</h2>

		<div class="table-responsive">
			<form action="./admin_member_modify_ok.do" method="post" name="mfrm">
				<table class="table">
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
										id="inlineRadio1" value="M" <%=genderM%>> <label
										class="form-check-label" for="inlineRadio1">남성</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="inlineRadio2" value="F" <%=genderF%>> <label
										class="form-check-label" for="inlineRadio2">여성</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										id="inlineRadio3" value="N" required <%=genderN%>> <label
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
	</div>

	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>