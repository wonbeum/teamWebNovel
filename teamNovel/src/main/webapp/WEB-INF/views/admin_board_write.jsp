<%@page
	import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
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

	#smart_editor2_content {
	border-radius: 7px;
	}

</style>

<!-- SmartEditor2 라이브러리  -->
<script type="text/javascript" src="smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
<!-- SmartEditor2 -->
	let oEditors = []

	smartEditor = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "editorTxt",
			sSkinURI : "smarteditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,

				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : false,

				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : false
			}
		});
	}

	// 입력값 검사
	$(document).ready(
			function() { 
	smartEditor();
	});

</script>

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
			
			<!-- SmartEditor2  -->
			<div id="smarteditor">
			<textarea name="free_content" id="editorTxt" rows="10" cols="10"
			style="width: 100%"></textarea>
			</div>
			
			<div class="row">
				<div class="col-auto me-auto">
					<a class="btn btn-outline-secondary" role="button" href="./admin_board_list.do">목록</a>
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