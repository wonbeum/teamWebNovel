<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

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
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}
</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#allbtn").click(function() {
			//만약 전체 선택 체크박스가 체크된상태일경우
			if ($("#allbtn").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
				//input type이 체크박스인것은 모두 체크함
			} else {
				$("input[type=checkbox]").prop("checked", false);
				//input type이 체크박스인것은 모두 체크 해제함
			}
		});
		
		// 선택 삭제 버튼
		conet list = 
		$("#selectalldbtn").click(function(){
			//for(let i = 0; i < )
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

	<!-- main -->

	<!-- 검색 -->
	<form class="row g-3 justify-content-md-center mt-4">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h5>최신리뷰</h5>
		</div>
		<div class="col-md-1">
			<a>조건검색</a>
		</div>
		<div class="col-md-3">
			<select class="form-select" id="validationCustom04" required>
				<option selected value="">제목</option>
				<option>제목+내용</option>
			</select>
		</div>
		<div class="col-md-4">
			<input type="text" class="form-control" id="validationCustom03"
				required>
		</div>
		<div class="col-md-2">
			<button class="btn btn-primary" type="submit">검색하기</button>
		</div>
	</form>

	<!-- 테이블 -->
	<div class="container mt-4">
		<table class="table">
			<thead class="table-light">
				<tr>
				<!-- 전체선택 -->
					<th scope="col"><input class="form-check-input" type="checkbox" role="switch"
				id="allbtn"></th>
				<!-- 전체선택 -->
					<th scope="col">번호</th>
					<th scope="col">작품명</th>
					<th scope="col">별점</th>
					<th scope="col">내용</th>
					<th scope="col">아이디</th>
					<th scope="col">작성일</th>
					<th scope="col">기능</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td scope="col" ><input class="form-check-input"
						type="checkbox" name="select" value=""></td>
					<td scope="col">1</td>
					<td scope="col">test</td>
					<td scope="col">10</td>
					<td scope="col"><a href="admin_review_view.jsp">content</a></td>
					<td scope="col">test@test</td>
					<td scope="col">20230126</td>
					<td scope="col"><input type="button" value="삭제" data-bs-toggle="modal" data-bs-target="#dmodal" /></td>
				</tr>
				<tr>
					<td scope="col"><input class="form-check-input"
						type="checkbox" name="select" value=""></td>
					<td scope="col">2</td>
					<td scope="col">test</td>
					<td scope="col">10</td>
					<td scope="col">contect</td>
					<td scope="col">test@test</td>
					<td scope="col">20230126</td>
					<td scope="col"><input type="button" value="삭제" /></td>
				</tr>
				<tr>
					<td scope="col"><input class="form-check-input"
						type="checkbox" name="select" value=""></td>
					<td scope="col">3</td>
					<td scope="col">test</td>
					<td scope="col">10</td>
					<td scope="col">contect</td>
					<td scope="col">test@test</td>
					<td scope="col">20230126</td>
					<td scope="col"><input type="button" value="삭제" /></td>
				</tr>
			</tbody>
		</table>
		<div>
			<button type="button" class="btn btn-outline-primary" id="selectalldbtn">선택삭제</button>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="dModal" tabindex="-1"
		aria-labelledby="dModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
						title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">  ddd</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<!-- paging -->
	<div class="container mb-4">
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

	<!-- footer -->
	<hr class="footer-div">

	<div class="container">
		<footer class="py-3 my-4">
			<p class="text-center text-muted">&copy; 2023 개발 못하면 죽는 병, Inc</p>
		</footer>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>