<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

.nav { -
	-bs-nav-link-padding-x: 1rem; -
	-bs-nav-link-padding-y: 0.5rem; -
	-bs-nav-link-font-weight:; -
	-bs-nav-link-color: #343a40; -
	-bs-nav-link-hover-color: #ffc107; -
	-bs-nav-link-disabled-color: var(- -bs-secondary-color);
	display: flex;
	flex-wrap: wrap;
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	function novelrankLists( url ){
		$.ajax({
			url : url ,
			type : 'get',
			dataType : 'json',
			success : function( jsonData ){
				$('#insertnovelList').html('');
				let listhtml = '';

				listhtml +="<div class='container'>";
				
				for( let i = 0 ; i<25; i ++ ){
					
					if( (i%5) == 0 ){
						listhtml +="<div class='row row-cols-2 row-cols-sm-2 row-cols-md-5 g-2'>";
					}
 
					
					listhtml +="	<div class='col'>";
					listhtml +="		<div class='card shadow-sm'>";
					listhtml +="			<a href='#'> <img src='"+ jsonData[i].novel_img +"' class='img' width='100%'";
					listhtml +="				height='225' role='img' aria-label='Placeholder: Thumbnail'>";
					listhtml +="			</a>";
					listhtml +="			<div class='card-body'>";
					listhtml +="				<p class='card-text'>장르</p>";
					listhtml +="				<p class='card-text'>" + jsonData[i].novel_title + " 작가</p>";
					listhtml +="				<p class='card-text'>별점 평균</p>";
					listhtml +="			</div>";
					listhtml +="		</div>";
					listhtml +="	</div>";
					if( (i%5) == 4 ){
						listhtml +="		</div>";
					}
							
				}
				listhtml += "</div>";

				$('#insertnovelList').append(listhtml);
			},
			error: function( err ) {
				console.log('에러 :',error.status);				
			}
		});
	} 
	$(document).ready( function() {
		let url = 'novel_rank_kakao_romance.do';
		novelrankLists(url);

		$('#kromance').click(function(e){
			url = 'novel_rank_kakao_romance.do';
			novelrankLists(url);
		});
		$('#kromancefantasy').click(function(e){
			url = 'novel_rank_kakao_romancefantasy.do';
			novelrankLists(url);
		});
		$('#kfantasy').click(function(e){
			url = 'novel_rank_kakao_fantasy.do';
			novelrankLists(url);
		});
		$('#nromance').click(function(e){
			url = 'novel_rank_naver_romance.do';
			novelrankLists(url);
		});
		$('#nromancefantasy').click(function(e){
			url = 'novel_rank_naver_romancefantasy.do';
			novelrankLists(url);
		});
		$('#nfantasy').click(function(e){
			url = 'novel_rank_naver_fantasy.do';
			novelrankLists(url);
		}); 
	});
</script>
</head>
<body>


	<!-- header -->
	<jsp:include page="../include/header1.jsp"></jsp:include>


	<!-- 본문 -->

	<div class="container w-75">
		<!-- Nav pills -->
		<ul class="nav nav-tabs justify-content-center bg-light"
			role="tablist">
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#pop30">TOP 30</a>
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="pill" href="#kakaopage">카카오 페이지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#series">네이버 시리즈</a>
		</ul>
	</div>
	<div class="container w-75">

		<div class="tab-content" id="novel_genre">
			<div id="pop30" class="container tab-pane fade"></div>
			<div id="kakaopage" class="container tab-pane active">
				<!-- Nav pills -->
				<ul class="nav justify-content-center bg-light" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="pill" href="#romance" id="kromance">로맨스</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						href="#romancefantasy" id="kromancefantasy">로맨스판타지</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						href="#fantasy" id="kfantasy">판타지</a></li>
				</ul>
			</div>

			<div id="series" class="container tab-pane fade">
				<ul class="nav justify-content-center bg-light" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="pill" href="#romance" id="nromance">로맨스</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						href="#romancefantasy" id="nromancefantasy">로맨스판타지</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						href="#fantasy" id="nfantasy">판타지</a></li>
				</ul>
			</div>

		</div>


		<div class="container" id="insertnovelList"></div>
	</div>


	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>