<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.model.freeboardTO"  %>

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
<style type="text/css">
	.nav-scroller{
		border: 1px solid black ;
	}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="../include/header2.jsp"></jsp:include>

<!-- 본문 -->

	<div class="text-center mt-5">
		<h3>공지사항 작성하기</h3>
	</div>
	<div class="container p-3 mt-4 mb-5 bg-body-tertiary rounded w-50">
		<div class="form">
		<form action="./admin_board_write_ok.do" method="post" name="adminwfrm">
			<div class="mb-3 w-25">
			<label class="form-label">카테고리</label>
				<select class="form-select form-select-sm" name="admin_board_category">
		  			<option value="공지">공지</option>
				</select>
			</div>
			<div class="mb-3">
			<label class="form-label">제목</label>
				<input type="text" class="form-control" name="admin_board_subject"/>
			</div>
			<div class="mb-3"">내용</th>
				<textarea class="form-control" name="admin_board_content"></textarea>
			</div>
			
			<div class="row">
				<div class="col-auto me-auto">
					<a class="btn btn-outline-secondary" role="button" href="./admin_board_list.do"/>목록</a>
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-secondary">
					쓰기
					</button>
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