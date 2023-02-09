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

$(document).ready(function() {
		console.log("성공");
		
		 $("#searchbtn").click(function() {
			 console.log("성공");
		        $.ajax({
		          url : '/ReviewSearch.do',
		          type : 'POST',
		          data : $("#form_Search").serialize(),
		          success : function(jsonData){
						console.log("성공");
						$('#reviewall').html('');
						for(let i=0; i<jsonData.length; i++){	
				
							div = `
								<div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 g-2">
									<div class="row g-0">
										<div class="col">
											<a href=""> <img src="\${jsonData[i].novel_img}" class="img" width="100%"
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
												<h5 class="card-text">\${jsonData[i].novel_title}/</h5>
												<p class="card-text">\${jsonData[i].novel_writer}/</p>
												<p class="card-text">\${jsonData[i].novel_star_grade}/\${jsonData[i].novel_star_grade}</p>
												<p class="card-text">\${jsonData[i].novel_content}</p>
											</div>

										</div>
									</div>
								</div>

						`;
							$('#reviewall').append(div);
						}
					},
					error : function(e) {
						alert("error !");
					}
				});
			});
		$("#tab1").on('click', function() {		
			console.log("성공");
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
										<a href=""> <img src="\${jsonData[i].novel_img}" class="img" width="100%"
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
											<h5 class="card-text">\${jsonData[i].novel_title}/</h5>
											<p class="card-text">\${jsonData[i].novel_writer}/</p>
											<p class="card-text">\${jsonData[i].novel_star_grade}/\${jsonData[i].novel_star_grade}</p>
											<p class="card-text">\${jsonData[i].novel_content}</p>
										</div>

									</div>
								</div>
							</div>

					`;
						$('#reviewall').append(div);
					}
				},
				error : function(e) {
					alert("error !");
				}
			});
		});
		
		$("#tab2").click(function() {		
			console.log("성공");
			$.ajax({
				url : '/ReviewRomance.do',
				type : 'get',
				dataType : 'json',
				success : function(jsonData){
					console.log("성공");
					$('#reviewall').html('');
					for(let i=0; i<jsonData.length; i++){	
			
						div = `
							<div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 g-2">
								<div class="row g-0">
									<div class="col">
										<a href=""> <img src="\${jsonData[i].novel_img}" class="img" width="100%"
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
											<h5 class="card-text">\${jsonData[i].novel_title}/</h5>
											<p class="card-text">\${jsonData[i].novel_writer}/</p>
											<p class="card-text">\${jsonData[i].novel_star_grade}/\${jsonData[i].novel_star_grade}</p>
											<p class="card-text">\${jsonData[i].novel_content}</p>
										</div>

									</div>
								</div>
							</div>

					`;
						$('#reviewall').append(div);
					}
				},
				error : function(e) {
					alert("error !");
				}
			});
		});
		
		$("#tab3").click(function() {		
			console.log("성공");
			$.ajax({
				url : '/ReviewRomanceFantasy.do',
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
										<a href=""> <img src="\${jsonData[i].novel_img}" class="img" width="100%"
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
											<h5 class="card-text">\${jsonData[i].novel_title}/</h5>
											<p class="card-text">\${jsonData[i].novel_writer}/</p>
											<p class="card-text">\${jsonData[i].novel_star_grade}/\${jsonData[i].novel_star_grade}</p>
											<p class="card-text">\${jsonData[i].novel_content}</p>
										</div>

									</div>
								</div>
							</div>

					`;
						$('#reviewall').append(div);
					}
				},
				error : function(e) {
					alert("error !");
				}
			});
		});
		
		$("#tab4").click(function() {		
			console.log("성공");
			$.ajax({
				url : '/ReviewFantasy.do',
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
										<a href=""> <img src="\${jsonData[i].novel_img}" class="img" width="100%"
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
											<h5 class="card-text">\${jsonData[i].novel_title}/</h5>
											<p class="card-text">\${jsonData[i].novel_writer}/</p>>
											<p class="card-text">\${jsonData[i].novel_star_grade}/\${jsonData[i].novel_star_grade}</p>
											<p class="card-text">\${jsonData[i].novel_content}</p>
										</div>

									</div>
								</div>
							</div>

					`;
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
<jsp:include page="../include/header1.jsp"></jsp:include>

	<!-- 본문 -->
	<div class="container">
		<header
			class="d-flex flex-wrap align-items-center justify-content-center">
			<a href="/" class="d-flex align-items-center"> <svg
					class="bi me-2" width="40" height="32" role="img"
					aria-label="Bootstrap">
					<use xlink:href="#bootstrap" /></svg>
			</a>
			<div>
				<ul
					class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
					<li class="tabs"><a href="#tab-1"
						class="nav-link px-2 link-secondary" id="tab1">전체</a></li>
					<li class="tabs"><a href="#tab-2"
						class="nav-link px-2 link-dark" id="tab2">로맨스</a></li>
					<li class="tabs"><a href="#tab-3"
						class="nav-link px-2 link-dark" id="tab3">로맨스 판타지</a></li>
					<li class="tabs"><a href="#tab-4"
						class="nav-link px-2 link-dark" id="tab4">판타지</a></li>
				</ul>
			</div>
		</header>
	</div>
	<div class="container" id="novellist">
		<div class="row">
			<div class="col">
				<div class="col w-75 p-100" style="float: none; margin: 0 auto;">
					<div class="input-group mb-3">
						<input type="text" id="textinput" class="form-control center"
							placeholder="검색어를 입력하세요" aria-describedby="button-addon">
						<button class="btn btn-outline-secondary" type="button"
							id="searchbtn">검색</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="text-center" id="reviewall"></div>
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


<!-- footer -->
<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	
</body>