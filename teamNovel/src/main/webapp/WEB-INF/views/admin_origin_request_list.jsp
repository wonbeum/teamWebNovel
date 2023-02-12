<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.admin_origin_requestTO"%>
<%@page import="java.util.ArrayList"%>

<%

ArrayList<admin_origin_requestTO> requestLists = (ArrayList<admin_origin_requestTO>)request.getAttribute("requestLists");

StringBuilder sbHtml = new StringBuilder();
	
	for( admin_origin_requestTO to : requestLists ){
		sbHtml.append("<tr>");
		sbHtml.append("<td><input type='checkbox' name='user_check'></td>");
		sbHtml.append("<td>" + to.getRequest_seq() + "</td>");
		sbHtml.append("<td>" + to.getRequest_category() + "</td>");
		sbHtml.append("<td>" + to.getRequest_title() + "</td>");
		sbHtml.append("<td>" + to.getUser_email() + "</td>");
		sbHtml.append("<td><input type='button' value='완료' onClick='#'>");
		sbHtml.append("<input type='button' value='삭제'></td>");
		sbHtml.append("</tr>");
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
    $("#confirmStart").click(function () {
        Swal.fire({
            title: '요청 삭제',
            text: "삭제된 요청은 복구할 수 없습니다. 정말 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '삭제되었습니다.',
                )
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
	<h2>요청 리스트</h2>
	<div class="table-responsive">
		<table class="table table-striped table-sm  table-bordered">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">번호</th>
					<th scope="col">카테고리</th>
					<th scope="col">작품명</th>
					<th scope="col">아이디</th>
					<th scope="col">기능</th>
				</tr>
			</thead>
			<tbody>
			<%=sbHtml %>
			<!--
				<tr>
					<td><input type="checkbox" name="user_check"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><input type="button" value="완료"><input
						type="button" value="삭제"></td>
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

	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>
	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>