<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

  $(document).ready(function() {
		
		$("#tab1").click(function() {		
			
			$.ajax({
				url : '/ReviewListAll.do',
				type : 'get',
				dataType : 'json',
				success : function(jsonData){
					//console.log("성공");
					$('#reviewall').html('');
					for(let i=0; i<jsonData.length; i++){	
			
						div = `
							<div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 g-2">
								<div class="row g-0">
									<div class="col">
										<a href="\${jsonData[i].novel_platform}"> <img src="\${jsonData[i].user_nickname}" class="img" width="100%"
											height="225" role="img">
										</a>
										<div class="card-body">
											<p class="card-text">\${jsonData[i].user_nickname}</p>
											<p class="card-text">\${jsonData[i].review_date}</p>
											<p class="card-text">\${jsonData[i].review_content}</p>
										</div>
									</div>
									<div class="col-md-4">
										<div class="card-body">
											<p class="card-text">\${jsonData[i].novel_genre}</p>
											<h5 class="card-text">\${jsonData[i].novel_title}/\${jsonData[i].novel_writer}</h5>
											<p class="card-text">\${jsonData[i].novel_star_grade}/\${jsonData[i].novel_star_grade}</p>
											<p class="card-text">\${jsonData[i].novel_content}</p>
										</div>

									</div>
								</div>
							</div>

					`
						$('#reviewall').append(div);
					}
				},
				error : function(e) {
					alert("error !");
				}
			});
		});
		
		
	});

</script>
</head>
<body>

	<div class="container">
		<header class="blog-header lh-1 py-3">
			<div class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">
					<a class="link-secondary" href="./main.do">사이트 로고</a>
				</div>
				<div class="col-4 text-center">
					<a class="blog-header-logo text-dark" href="./main.do">사이트 이름</a>
				</div>
				<div class="col-4 d-flex justify-content-end align-items-center">
					<a class="link-secondary" href="./novel_search.do" aria-label="Search"> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24">
							<title>Search</title><circle cx="10.5" cy="10.5" r="7.5" />
							<path d="M21 21l-5.2-5.2" /></svg>
					</a>
					<c:if test="${signIn == null}">
						<a class="btn btn-sm btn-outline-secondary" href="./login.do">Sign up</a>
					</c:if>
					<c:if test="${signIn != null}">
						<div class="dropdown text-end">
							<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"> <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
							</a>
							<ul class="dropdown-menu text-small">
								<li><a class="dropdown-item" href="#">New project...</a></li>
								<li><a class="dropdown-item" href="#">Settings</a></li>
								<li><a class="dropdown-item" href="#">Profile</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="./logout.do">Sign out</a></li>
							</ul>
						</div>
					</c:if>
				</div>
			</div>
		</header>
		<div class="nav-scroller py-1 mb-2">
			<nav class="nav d-flex justify-content-between">
				<a class="p-2 link-secondary" href="./rank_list.do">랭킹</a> <a class="p-2 link-secondary" href="./review_list.do">리뷰</a> <a class="p-2 link-secondary" href="./novel_list.do">웹소설</a> <a class="p-2 link-secondary" href="./board_list.do">커뮤니티</a> <a class="p-2 link-secondary" href="./origin_list.do">원작 소설 찾기</a>
			</nav>
		</div>
	</div>

	<!-- 본문 -->
	<div class="container">
		<header class="d-flex flex-wrap align-items-center justify-content-center">
			<a href="/" class="d-flex align-items-center"> <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
					<use xlink:href="#bootstrap" /></svg>
			</a>
			<div>
				<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
					<li class="tabs"><a href="#tab-1" class="nav-link px-2 link-secondary">전체</a></li>
					<li class="tabs"><a href="#tab-2" class="nav-link px-2 link-dark">로맨스</a></li>
					<li class="tabs"><a href="#tab-3" class="nav-link px-2 link-dark">로맨스 판타지</a></li>
					<li class="tabs"><a href="#tab-4" class="nav-link px-2 link-dark">판타지</a></li>
				</ul>
			</div>
		</header>
	</div>
	<div class="container" id="novellist">
		<div class="row">
			<div class="col">
				<div class="col w-75 p-100" style="float: none; margin: 0 auto;">
					<div class="input-group mb-3">
						<input type="text" class="form-control center" placeholder="검색어를 입력하세요" aria-describedby="button-addon">
						<button class="btn btn-outline-secondary" type="button" id="searchbtn">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="text-center" id="reviewall"></div>
		<div class="text-center" id="reviewromance"></div>
		<div class="text-center" id="reviewromancefantasy"></div>
		<div class="text-center" id="reviewfantasy"></div>
	</div>
	<!-- 
	<div class="container">
		<div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 g-2">
			<div class="row g-0">
				<div class="col">
					<a href="#"> <img src="..." class="img" width="100%"
						height="225" role="img">
					</a>
					<div class="card-body">
						<p class="card-text">닉네임</p>
						<p class="card-text">작성일자</p>
						<p class="card-text">작성 내용</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card-body">
						<p class="card-text">장르</p>
						<h5 class="card-text">제목/작가</h5>
						<p class="card-text">별점/평점</p>
						<p class="card-text">내용</p>
					</div>

				</div>
			</div>
		</div>
	</div>
 -->


	<hr class="footer-div">

	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="./rank_list.do" class="nav-link px-2 text-muted">랭킹</a></li>
				<li class="nav-item"><a href="./review_list.do" class="nav-link px-2 text-muted">리뷰</a></li>
				<li class="nav-item"><a href="./novel_list.do" class="nav-link px-2 text-muted">웹소설</a></li>
				<li class="nav-item"><a href="./board_list.do" class="nav-link px-2 text-muted">커뮤니티</a></li>
				<li class="nav-item"><a href="./origin_list.do" class="nav-link px-2 text-muted">원작 소설 찾기</a></li>
			</ul>
			<p class="text-center text-muted">&copy; 2023 개발 못하면 죽는 병, Inc</p>
		</footer>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>