<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.model.userInfoTO"%>
	
<%
	userInfoTO to = (userInfoTO)request.getAttribute("to");

	String email = to.getUser_email();
	String nickname = to.getUser_nickname();
	String cdate = to.getUser_cdate();
	String gender = to.getUser_gender();
	String birth = to.getUser_birth();
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
$().ready(function () {
    $(".confirmStart").click(function () {
        Swal.fire({
            title: '회원 정보 삭제',
            text: "삭제된 회원 정보는 복구할 수 없습니다. 정말 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                location.href="./admin_member_delete_ok.do?email=<%=email%>";
            }
        })
    });
});
</script>
</head>
<body>


	<!-- header -->
	<jsp:include page="../include/header2.jsp"></jsp:include>

	<!-- 본문 -->
	<h2>회원 정보 상세보기</h2>

	<div class="table-responsive">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>닉네임</td>
					<td><%=nickname %></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><%=email %></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><%=gender %></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><%=birth %></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><%=cdate %></td>
				</tr>
			</tbody>
		</table>
		<div>
		<input type="button" class="btn btn-primary" value="돌아가기" /> 
		<input type="button" class="btn btn-primary float-right" value="수정" onClick="location.href='./admin_member_modify.do?email=<%=email%>'"/>
		<input type="button" class="confirmStart btn btn-primary float-right" value="삭제" />
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