<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%

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
<script type="text/javascript">
	$(document).ready(function(){
		$('#wbtn').click(function(){
			if(${signIn == null}) {
				alert("로그인후 글쓰기가 가능합니다.");
				return false;
			}
		});	
			
			$.ajax({
				url : 'BoardListAjax.do',
				type : 'get',
				dataType : 'json',
				success : function(jsonData){
					//console.log("성공");
					$('#insertList').html('');
					
					for(let i=0; i<jsonData.length; i++){	
						tr = `
							<tr> 
							<td>\${jsonData[i].free_seq}</td>
							<td>\${jsonData[i].free_category}</td>
							<td class='text-start'><a href='board_view.do?seq=\${jsonData[i].free_seq}'>
								\${jsonData[i].free_subject}</a></td>
							<td>\${jsonData[i].user_nickname}</td>
							<td>\${jsonData[i].free_date}</td>
							<td>\${jsonData[i].free_hit}</td>
							<td>\${jsonData[i].free_like}</td>
							</tr>
						`
						$('#insertList').append(tr);
					}
				},
				error : function(e) {
					alert("error !");
				}
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

	<div class="container w-75">
		<!-- Nav pills -->
		<ul class="nav justify-content-center bg-light" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="pill" href="#total">전체</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#best">인기글</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#notice">공지</a></li>
		</ul>
	</div>

	<!-- Tab panes -->
	<div class="tab-content">
		<div id="total" class="container tab-pane active w-75 mt-3">
			<h5>전체</h5>
			<div class="container">
				<table class="table table-hover mt-3">
					<thead class="table-light text-center">
						<tr>
							<th scope="col" width="8%">번호</th>
							<th scope="col" width="10%">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col" width="13%">작성자</th>
							<th scope="col" width="13%">날짜</th>
							<th scope="col" width="8%">조회</th>
							<th scope="col" width="8%">추천</th>
						</tr>
					</thead>
					<tbody class="text-center" id="insertList">
						<!-- 
				<tr>
					<th scope="col">1</th>
					<td>공지</td>
      				<td class="text-start"><a href="board_view.jsp">title</td>
      				<td>writer</td>
      				<td>23.01.26</td>
      				<td>1</td>
      				<td>10</td>
				</tr>	
			 -->
					</tbody>
				</table>
			</div>
			<!-- paging -->
			<div class="container">
				<nav aria-label="Page navigation example"
					class="nav justify-content-center">
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
			</div>
		</div>
		<div id="best" class="container tab-pane fade w-75 mt-3">
			<h5>인기글</h5>
			<div class="container">
				<table class="table table-hover mt-3">
					<thead class="table-light text-center">
						<tr>
							<th scope="col" width="8%">번호</th>
							<th scope="col" width="10%">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col" width="13%">작성자</th>
							<th scope="col" width="8%">날짜</th>
							<th scope="col" width="6%">조회</th>
							<th scope="col" width="6%">추천</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr>
							<th scope="col">1</th>
							<td>공지</td>
							<td class="text-start"><a href="board_view.do">title</td>
							<td>writer</td>
							<td>23.01.26</td>
							<td>1</td>
							<td>10</td>
						</tr>
						<tr>
							<th scope="col">2</th>
							<td>공지</td>
							<td class="text-start"><a href="board_view.do">title</td>
							<td>writer</td>
							<td>23.01.26</td>
							<td>3</td>
							<td>10</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- paging -->
			<div class="container">
				<nav aria-label="Page navigation example"
					class="nav justify-content-center">
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
			</div>
		</div>

		<div id="notice" class="container tab-pane fade w-75 mt-3">
			<h5>공지</h5>
			<div class="container">
				<table class="table table-hover mt-3">
					<thead class="table-light text-center">
						<tr>
							<th scope="col" width="8%">번호</th>
							<th scope="col" width="10%">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col" width="13%">작성자</th>
							<th scope="col" width="8%">날짜</th>
							<th scope="col" width="6%">조회</th>
							<th scope="col" width="6%">추천</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr>
							<th scope="col">1</th>
							<td>공지</td>
							<td class="text-start"><a href="board_view.do">title</td>
							<td>writer</td>
							<td>23.01.26</td>
							<td>1</td>
							<td>10</td>
						</tr>
						<tr>
							<th scope="col">2</th>
							<td>공지</td>
							<td class="text-start"><a href="board_view.do">title</td>
							<td>writer</td>
							<td>23.01.26</td>
							<td>3</td>
							<td>10</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!-- paging -->
			<div class="container">
				<nav aria-label="Page navigation example"
					class="nav justify-content-center">
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
			</div>
		</div>
	</div>

	<!-- 글쓰기, 검색 -->
	<div class="container w-75">
		<div class="row">
			<div class="col-auto me-auto">
				<div class="input-group mb-3">
					<input class="form-control" type="text" placeholder="제목/작성자">
					<button class="btn btn-outline-success" type="submit">검색</button>
				</div>
			</div>
			<div class="col-auto">
				<a class="btn btn-outline-dark" href="./board_write.do" id="wbtn"
					role="button">글쓰기</a>
			</div>
		</div>
	</div>



	<!-- footer -->
	<hr class="footer-div mt-5">

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