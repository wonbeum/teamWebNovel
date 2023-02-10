<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.example.model.reviewListTO"%>
<%
/*
reviewListTO to = (reviewListTO)request.getAttribute("to");

String novel_title = to.getNovel_title();
*/
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

.-\32 3 {
	width: 530px;
	height: 55px;
	margin: 77px 473px 100px;
	padding: 13px 30px;
	border-radius: 25px;
	border: solid 4px #ffb26b;
	background-color: #fff;
}

.-\32 5 {
	width: 723px;
	height: 533px;
	margin: 100px 12px 51px 0;
	padding: 28px 19.5px 31px 20.5px;
	border-radius: 15px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function reviewList( url, page ) {
	 console.log("성공");
       $.ajax({
         url : url,
         type : 'get',
         dataType : 'json',
         data : {
       	'novel_title': document.getElementById('textinput').value,
       	'cpage'  : page
         },
         success : function(jsonData){
				console.log("성공");

				let cpage = jsonData[0].cpage;
				let recordPerPage = jsonData[0].recordPerPage;
				let blockPerPage = jsonData[0].blockPerPage;
				let totalPage = jsonData[0].totalPage;
				let totalRecord = jsonData[0].totalRecord;
				let startBlock = jsonData[0].startBlock;
				let endBlock = jsonData[0].endBlock;
				
				$('#reviewall').html('');
				let div = ';'
					for(let i=0; i<recordPerPage; i++){		
						let title = encodeURI(jsonData[0].reviewList[i].novel_title);
						if((i%2)==0){
							div += `
								<div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 g-2">
							`;
						}
							div += `
								<div class="row g-0">
									<div class="col">
										<a href="./novel_detail.do?novel_title=\${title}"> <img src="\${jsonData[0].reviewList[i].novel_img}" class="img" width="100%"
											height="225" role="img">
										</a>
										<div class="card-body">
											<p class="card-text">\${jsonData[0].reviewList[i].user_nickname}</p>
											<p class="card-text">\${jsonData[0].reviewList[i].review_date}</p>
											<p class="card-text">\${jsonData[0].reviewList[i].review_content}</p>
										</div>
									</div>
									<div class="col-md-4">
											<div class="card-body">
											<p class="card-text">\${jsonData[0].reviewList[i].novel_genre}</p>
											<h5 class="card-text">\${jsonData[0].reviewList[i].novel_title}/</h5>
											<p class="card-text">\${jsonData[0].reviewList[i].novel_writer}/</p>
											<p class="card-text">\${jsonData[0].reviewList[i].novel_star_grade}/\${jsonData[0].reviewList[i].novel_star_grade}</p>
											<p class="card-text">\${jsonData[0].reviewList[i].novel_content}</p>
										</div>

									</div>
								</div>
								`;
								
								if((i%2)==1){
									div += `
									</div>
									`;
								}
						
					}
				
				div += `
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">`;
						
				if( cpage == 1 ){
					div += `<li class="page-item disabled"><a class="page-link">Previous</a></li>`;
				} else {
					div += `<li class="page-item"><a class="goBackPage page-link">Previous</a></li>`;
				}
				
				for( let i = startBlock ; i <= endBlock ; i ++ ){
					if( cpage == i ){
						div += '	<li class="page-item disabled"><a class="page-link">' + i + '</a></li>';
					} else {
						div += '	<li class="page-item"><a class="goPage page-link" data-page="' + i +  '">' + i + '</a></li>';
					}
				}
				
				if( cpage == totalPage ){
					div += `<li class="page-item disabled"><a class="page-link">Next</a></li>`;
				} else {
					div += `<li class="page-item"><a class="goNextPage page-link">Next</a></li>`;
				}
				
				div += `
						</ul>
					</nav>`;
					$('#reviewall').append(div);
					
					$(".goBackPage").click(function(){
				      	let page = cpage - 1;
				      	reviewList( url, page );
			        });
					
					$(".goPage").click(function(){
						page = $(this).attr("data-page");
						reviewList( url, page );
					});

					$(".goNextPage").click(function(){
				      	let page = cpage + 1;
				      	reviewList( url, page );
			        });
				},
				error : function(e) {
					alert("error !");
				}
			});
		};
$(document).ready(function() {
		console.log("성공");
		let url = 'ReviewListAll.do';
		let page = 1;
		reviewList( url, page );
		 $("#searchbtn").click(function() {
			 page = 1;
			 url ='ReviewSearch.do';
			 reviewList(url, page);
		 });
	
		$("#tab1").on('click', function() {	
			page = 1;
			url = 'ReviewListAll.do';
			 reviewList(url, page);
		});
		
		$("#tab2").click(function() {	
			page = 1;
				url = 'ReviewRomance.do';
				 reviewList(url, page);
			});
		
		$("#tab3").click(function() {	
			page = 1;
				url = 'ReviewRomanceFantasy.do';
				reviewList(url, page);
			});
		
		$("#tab4").click(function() {	
			page = 1;
				url = 'ReviewFantasy.do';
				reviewList(url, page);
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
					<div class="-\32 3">
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