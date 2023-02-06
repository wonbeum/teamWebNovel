<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page import="com.example.model.freeboardTO"%>
<%
	freeboardTO to = (freeboardTO)request.getAttribute("to");
	
	String free_category = to.getFree_category();
	String free_seq = to.getFree_seq();
	String free_subject = to.getFree_subject();
	String user_nickname = to.getUser_nickname();
	String user_email = to.getUser_email();
	String free_date = to.getFree_date();
	String free_hit = to.getFree_hit();
	String free_like = to.getFree_like();
	String free_content = to.getFree_content();
%>
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
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
	<!-- SmartEditor2 라이브러리  -->
<script type="text/javascript" src="smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>

function clickModi(formName) {
	formName.action = "/board_modify_ok.do";
	formName.method = "post";
	
	   oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
       let content = document.getElementById("editorTxt").value;
	
    if(content == "" || content == null || content == '&nbsp;' || 
			content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
		//alert("내용을 입력해주세요.");
		return false;
	}
    
    if (title == null || title == "") {
		//alert("제목을 입력해주세요.");
		//$("#title").focus();
		return false;
	}
	formName.submit();
}


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
	$(document).ready(function(){
		smartEditor();
		$("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
	        let content = document.getElementById("editorTxt").value;
	        let title = $("#free_subject").val();
	        // 입력값 검사
	        if(content == "" || content == null || content == '&nbsp;' || 
					content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
				alert("내용을 입력해주세요.");
				return false;
			}
	        
	        if (title == null || title == "") {
				alert("제목을 입력해주세요.");
				//$("#title").focus();
				return false;
			}
	        
	        //폼 submit
	        $("#frm").submit();
	    });
		
	});
	
</script>
</head>
<body>
	<!-- header -->
	<div class="container">
		<header class="blog-header lh-1 py-3">
			<div
				class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">
					<a class="link-secondary" href="./main.do">사이트 로고</a>
				</div>
				<div class="col-4 text-center">
					<a class="blog-header-logo text-dark" href="./main.do">사이트 이름</a>
				</div>
				<div class="col-4 d-flex justify-content-end align-items-center">
					<a class="link-secondary" href="./novel_search.do"
						aria-label="Search"> <svg xmlns="http://www.w3.org/2000/svg"
							width="20" height="20" fill="none" stroke="currentColor"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							class="mx-3" role="img" viewBox="0 0 24 24">
							<title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
							<path d="M21 21l-5.2-5.2" /></svg>
					</a>
					<c:if test="${signIn == null}">
						<a class="btn btn-sm btn-outline-secondary" href="./login.do">Sign
							up</a>
					</c:if>
					<c:if test="${signIn != null}">
						<div class="dropdown text-end">
							<a href="#"
								class="d-block link-dark text-decoration-none dropdown-toggle"
								data-bs-toggle="dropdown" aria-expanded="false"> <img
								src="https://github.com/mdo.png" alt="mdo" width="32"
								height="32" class="rounded-circle">
							</a>
							<ul class="dropdown-menu text-small">
								<li><a class="dropdown-item" href="#">New project...</a></li>
								<li><a class="dropdown-item" href="#">Settings</a></li>
								<li><a class="dropdown-item" href="#">Profile</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="./logout.do">Sign
										out</a></li>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
		</header>

		<div class="nav-scroller py-1 mb-2">
			<nav class="nav d-flex justify-content-between">
				<a class="p-2 link-secondary" href="./rank_list.do">랭킹</a> <a
					class="p-2 link-secondary" href="./review_list.do">리뷰</a> <a
					class="p-2 link-secondary" href="./novel_list.do">웹소설</a> <a
					class="p-2 link-secondary" href="./board_list.do">커뮤니티</a> <a
					class="p-2 link-secondary" href="./origin_list.do">원작 소설 찾기</a>
			</nav>
		</div>
	</div>

	<!-- main -->
	<div class="text-center mt-5">
		<h3>커뮤니티 나의 글 수정하기</h3>
	</div>
	<div
		class="container shadow p-3 mt-4 mb-5 bg-body-tertiary rounded w-50">
		<div class="form">
			<form class="validation-form" name="userInfo" id="frm" novalidate>
				<input type="hidden" name="seq" value=<%=free_seq %>>
				<div class="mb-3 w-25">
					<label class="form-label">카테고리</label> <select
						class="form-select form-select-sm" name="free_category" required>
						<option disabled>수정전 : <%=free_category %></option>
						<option value="질문">질문</option>
						<option value="이슈">이슈</option>
						<option value="잡담">잡담</option>
					</select>
				</div>
				<div class="mb-3">
					<label class="form-label">제목</label> <input type="text"
						name="free_subject" id="free_subject" class="form-control" placeholder="제목 입력"
						value=<%=free_subject %>>
				</div>
				<div class="mb-3">
					<label class="form-label">내용</label>
						<!-- SmartEditor2  -->
					<div id="smarteditor">
						<textarea name="free_content" id="editorTxt" rows="10" cols="10"
							placeholder="내용을 입력해주세요" style="width: 100%"><%=free_content %></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col-auto me-auto">
						<a class="btn btn-outline-secondary" href="./board_list.do"
							role="button">목록</a>
					</div>
					<div class="col-auto">
						<button type="button" id="mbtn" class="btn btn-secondary"
							data-bs-toggle="modal" data-bs-target="#myModal">
							수정하기</button>
					</div>

				</div>
			</form>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">수정을 완료하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" id="modalbtn" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" id="savebutton" onclick=clickModi(userInfo)>수정하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
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