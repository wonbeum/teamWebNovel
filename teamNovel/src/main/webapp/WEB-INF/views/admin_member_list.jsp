<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.userInfoTO"%>
<%@page import="java.util.ArrayList"%>
	
<%
	ArrayList<userInfoTO> userLists = (ArrayList<userInfoTO>)request.getAttribute("userLists");
	
	StringBuilder sbHtml = new StringBuilder();

	for( userInfoTO to : userLists ){
		sbHtml.append("<tr>");
		sbHtml.append("		<td><input type='checkbox' name='user_check'></td>");
		sbHtml.append("		<td><input name='email' value='"+ to.getUser_email() +"' disabled/></td>");
		sbHtml.append("		<td><input value='"+ to.getUser_nickname() +"' disabled/></td>");
		sbHtml.append("		<td><input value='"+to.getUser_gender()+"' disabled/></td>");
		sbHtml.append("		<td><input value='"+to.getUser_birth()+"' disabled/></td>");
		sbHtml.append("		<td><input value='"+to.getUser_cdate()+"' disabled/></td>");
		sbHtml.append("		<td><input type='button' value='상세보기' onClick=\"location.href='./admin_member_view.do?email="+ to.getUser_email() +"'\"><input");
		sbHtml.append("			type='submit' value='삭제' class='deletebutton'></td>");
		sbHtml.append("	</tr>");
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
$(document).ready(function() {
	$("#cboxAll").click(function() {
		if($("#cboxAll").is(":checked")) $("input[name=user_check]").prop("checked", true);
		else $("input[name=user_check]").prop("checked", false);
	});
	
	$("input[name=user_check]").click(function() {
		var total = $("input[name=user_check]").length;
		var checked = $("input[name=user_check]:checked").length;
		
		if(total != checked) $("#cboxAll").prop("checked", false);
		else $("#cboxAll").prop("checked", true); 
	});
});

$().ready(function () {
    $(".deletebutton").click(function () {
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
                Swal.fire(
                    '삭제가 완료되었습니다.'
                ),
                location.href = "./main.do"
            }
        })
    });
});
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
	<h2>회원 리스트</h2>
	<div>
		<table border="1" align="center">
			<tr>
				<td>조건 검색</td>
				<td>
					<form action="#" method="get" name="frm1">
						<select name="search">
							<option value="1">닉네임</option>
							<option value="2">이메일</option>
						</select>
					</form>

				</td>
				<td>
					<form action="#" method="get">
						<input type="text" /> <input type="submit" value="검색" />
					</form>
				</td>
			</tr>
		</table>
	</div>
	<div class="table-responsive">
		<table class="table table-striped table-sm  table-bordered">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" id="cboxAll"></th>
					<th scope="col">이메일</th>
					<th scope="col">닉네임</th>
					<th scope="col">성별</th>
					<th scope="col">생일</th>
					<th scope="col">가입일</th>
					<th scope="col">기능</th>
				</tr>
			</thead>
			<tbody>
			
			<%= sbHtml %>
			<!--  
				<tr>
					<td><input type="checkbox" name="user_check"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><input type="button" value="상세보기"><input
						type="button" value="삭제" class="confirmStart"></td>
				</tr>
				-->
			</tbody>
		</table>
	</div>

	<input type="button" value="선택삭제">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
	
	
	<hr class="footer-div">

	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="./rank_list.do"
					class="nav-link px-2 text-muted">랭킹</a></li>
				<li class="nav-item"><a href="./review_list.do"
					class="nav-link px-2 text-muted">리뷰</a></li>
				<li class="nav-item"><a href="./novel_list.do"
					class="nav-link px-2 text-muted">웹소설</a></li>
				<li class="nav-item"><a href="./board_list.do"
					class="nav-link px-2 text-muted">커뮤니티</a></li>
				<li class="nav-item"><a href="./origin_list.do"
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