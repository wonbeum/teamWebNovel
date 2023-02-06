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
		
	// 전체 리스트 가져오기
	$.ajax({
		url : 'BoardListAjax.do',
		type : 'get',
		dataType : 'json',
		success : function(jsonData){
			//console.log("성공");
			$('#insertTotalList').html('');
			
			for(let i=0; i<jsonData.length; i++){	
				tr = `
					<tr> 
					<td>\${jsonData[i].free_category}</td>
					<td class='text-start'><a href='board_view.do?seq=\${jsonData[i].free_seq}'>
						\${jsonData[i].free_subject}</a></td>
					<td>\${jsonData[i].user_nickname}</td>
					<td>\${jsonData[i].free_date}</td>
					<td>\${jsonData[i].free_hit}</td>
					<td>\${jsonData[i].free_like}</td>
					</tr>
				`
				$('#insertTotalList').append(tr);
			}
		},
		error : function(e) {
			alert("error !");
		}
	});
	
	
	NoticeAjax();
	
	// 인기글 가져오기
	
	
	// 공지 가져오기
	
		
});
	// 공지 가져오기
	function NoticeAjax(){
		$.ajax({
			url : 'NoticeListAjax.do',
			type : 'get',
			dataType : 'json',
			success : function(jsonData){
				//console.log("성공");
				
				$('#insertNoticeList').html('');
				
				for(let i=0; i<jsonData.length; i++){	
					tr = `
						<tr> 
						<td>\${jsonData[i].free_category}</td>
						<td class='text-start'><a href='board_view.do?seq=\${jsonData[i].free_seq}'>
							\${jsonData[i].free_subject}</a></td>
						<td>\${jsonData[i].user_nickname}</td>
						<td>\${jsonData[i].free_date}</td>
						<td>\${jsonData[i].free_hit}</td>
						<td>\${jsonData[i].free_like}</td>
						</tr>
					`
					$('#insertNoticeList').append(tr);
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
	<jsp:include page="../include/header1.jsp"></jsp:include>

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
							<th scope="col" width="10%">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col" width="13%">작성자</th>
							<th scope="col" width="13%">날짜</th>
							<th scope="col" width="8%">조회</th>
							<th scope="col" width="8%">추천</th>
						</tr>
					</thead>
					<tbody class="text-center" id="insertTotalList">
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
							<th scope="col" width="10%">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col" width="13%">작성자</th>
							<th scope="col" width="13%">날짜</th>
							<th scope="col" width="8%">조회</th>
							<th scope="col" width="8%">추천</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr>
							<td>공지</td>
							<td class="text-start"><a href="board_view.do">title</td>
							<td>writer</td>
							<td>23.01.26</td>
							<td>1</td>
							<td>10</td>
						</tr>
						<tr>
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
							<th scope="col" width="10%">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col" width="13%">작성자</th>
							<th scope="col" width="13%">날짜</th>
							<th scope="col" width="8%">조회</th>
							<th scope="col" width="8%">추천</th>
						</tr>
					</thead>
					<tbody class="text-center" id="insertNoticeList">
						<!-- 
						<tr>
							<th scope="col">1</th>
							<td>공지</td>
							<td class="text-start"><a href="board_view.do">title</td>
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
	</div>

	<!-- 글쓰기, 검색 -->
	<div class="container w-75">
		<div class="row" style="margin-bottom: 30px;">
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
	<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>