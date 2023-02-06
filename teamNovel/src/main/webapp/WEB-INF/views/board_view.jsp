<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.model.freeboardTO"%>
<%
	freeboardTO to = (freeboardTO)request.getAttribute("to");
	
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
<!-- Jquery -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

// 자기가 쓴 글을 볼때만 취소 삭제 버튼 나타남
	const board_nickname = "<%=user_nickname%>";
	
	// 삭제
	function clickDel(formName) {
		formName.action = "/board_delete_ok.do";
		formName.method = "post";
		formName.submit();
	}
	
	$(document).ready(function(){
		if("${signIn.user_nickname}" == board_nickname) {
			$('#likebtn').remove();
			$('#btnarea').append('<a class="btn btn-outline-secondary mt-3" href="./board_modify.do?seq=<%=free_seq%>" role="button">수정</a>')
			$('#btnarea').append('<a class="btn btn-outline-secondary mt-3" data-bs-toggle="modal" data-bs-target="#myModal" href="#" role="button">삭제</a>')
		} 
		//console.log(${signIn.user_nickname});
		//console.log(board_nickname);
	
	// 댓글 실시간(1초마다) 가져오기
	$(function(){
		commentList();
		setInterval(commentList, 1000);
		commentList();
	});
	
	
		// 댓글 작성
		$('#cmtbtn').click(function(){
			if(${signIn.user_nickname != null}){
				$.ajax({
					url : 'CommentWriteAjax.do',
					type : 'get',
					data : {
						cmt_content : $("#cmt_content").val(),
						free_seq : "<%=free_seq%>"
					},
					dataType : 'json',
					success : function(jsonData){
						alert("댓글작성완료");
						//console.log(jsonData)
						$("#cmt_content").val("");
					},
					error : function(e) {
						alert("error !");
					}
				});
				
			} else {
				alert('로그인후 댓글을 입력해주세요');
			}
	
	
	});
	

	});
	
	// 댓글 가져오기
	function commentList() {
		$.ajax({
			url : 'CommentListAjax.do',
			type : 'get',
			data : {
				free_seq : "<%=free_seq%>"
			},
			dataType : 'json',
			success : function(jsonData){
			//alert("성공");
					
				$('#cmt_area').html('');
				
				for(let i=0; i<jsonData.length; i++){	
					const result = `
						<li>
							<div>
								<span><strong>\${jsonData[i].user_nickname}</strong></span> <span class='fw-lighter'>\${jsonData[i].cmt_date}</span>
								<span class='fw-lighter'>수정</span>
								<span class='fw-lighter'>삭제</span>
							</div>
							<div>
								<p>\${jsonData[i].cmt_content}</p>
							</div>
						</li>
					`
					$('#cmt_area').append(result);
				}
			
			},
			error : function(e) {
				alert("error !");
			}
	});
}

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
	<main>
		<div class="container w-75">
				<input type="hidden" name="seq" value="" />
				<div class="row mt-5">
					<div class="col-auto me-auto">
						<h5>커뮤니티 게시판</h5>
					</div>
					<div class="col-auto">
						<a href="./main.do"> <img
							src="//image.istarbucks.co.kr/common/img/common/icon_home.png"
							alt="홈으로">
						</a> <img class="arrow"
							src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png"
							alt="하위메뉴"> <a href="./board_list.do">커뮤니티</a>
					</div>
				</div>
		</div>
		<!-- 게시글 -->
		<div class="container w-75 mb-5">
			<div class="row">
				<div class="col-lg-6 col-md-12 mt-3 mb-5">
				<form action="./board_modify_ok.do" method="post" name="userInfo">
				<input type="hidden" name="seq" value="<%=free_seq %>" /> 
						<h4><%=free_subject %></h4>
					<table class="table">
						<thead>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td width="35%" id="user_nickname"><%=user_nickname %></td>
								<td width="25%"><%=free_date %></td>
								<td width="20%">조회 <%=free_hit %></td>
								<td width="25%">추천 <%=free_like%></td>
							</tr>
						</tbody>
					</table>
					</form>
					<div class="form-control" name="content" style="height:300px; overflow:scroll;"><%=free_content %></div>
					<div id ="btnarea">
						<a class="btn btn-outline-dark mt-3" href="./board_list.do"
						role="button" id="listbtn">목록</a>
						<button type="checkbox" id="likebtn" class="btn btn-outline-secondary mt-3">좋아요</button>
					</div>
				</div>

				<!-- 댓글 -->
				<div class="col mt-3">
					<table class="table">
						<tbody>
							<tr>
								<th class="subject"><h4>댓글</h4></th>
						</tbody>
					</table>
					<ul class="list-unstyled" id="cmt_area">
						<!-- 
						<li>
							<div>
								<span><strong>닉네임10</strong></span> <span class="fw-lighter">(23.01.28)</span>
								<span class="fw-lighter">수정</span>
								<span class="fw-lighter">삭제</span>
							</div>
							<div>
								<p>왓챠처럼 예상별점 보여주기는 아무래도 좀 어려울까요? 현재 평균별점에 개인의 연령대, 성별, 선호장르,
									선호작가 등으로 가감하면 예상별점이 산출될 수 있을 것 같은데요. 웹소설 분야의 왓챠가 되면 좋겠네요</p>
							</div>
						</li>
						 -->						 
					</ul>

					<div class="container">
						<div class="row">
							<textarea class="col form-control pr-5" name="cmt_content" id="cmt_content" rows="3"
								placeholder="댓글을 입력해보세요"></textarea>
							<button type="submit" id="cmtbtn" class="col-2 btn btn-outline-secondary">등록</button>
						</div>
					</div>
				</div>
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
				<div class="modal-body">정말로 삭제하시겠습니까?<br/>
				삭제한 데이터는 복구할 수 없습니다.</div>
				<div class="modal-footer">
					<button type="button" id="modalbtn" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" id="modalbtn" onclick=clickDel(userInfo)>삭제하기</button>
				</div>
			</div>
		</div>
	</div>
	
	</main>


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