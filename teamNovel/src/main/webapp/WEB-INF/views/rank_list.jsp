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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style type="text/css">
#nav-button{
	width: 120px;
	height: 40px;
	margin: 16px;
	margin-top: 50px;
	border-radius: 20px;
	border: solid 2px #ffb26b;
	background-color: #fff;
	padding-top: 6px;
	font-family: AppleSDGothicNeoR;
	font-size: 15px;
	font-weight: 800;
	font-style: normal;
	text-decoration-line: none;
	text-align: center;
	color: #ffb26c;
}
#kromance, #kfantasy, #kromancefantasy,
#nromance, #nfantasy, #nromancefantasy{
	width: 120px;
	height: 40px;
	margin: 16px;
	margin-top: 20px;
	border-radius: 20px;
	border: 0;
	background-color: #fff;
	padding-top: 6px;
	font-family: AppleSDGothicNeoR;
	font-size: 15px;
	font-weight: 800;
	font-style: normal;
	text-decoration-line: none;
	text-align: center;
	color: #ffb26c;
}

.img-wrapper{
	max-width: 100%;
	height: 17em;
}

.card-body{
	height : 140px;
	font-size: 10px;
}

#rowcard{
	margin-bottom: 10px;
}


.card-text{
	margin-bottom: 10px;
}

#novel-title{
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	overflow: hidden;
	font-size: 15px;
	font-weight: bold;
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

					let title = encodeURI(jsonData[i].novel_title);
					
					if( (i%5) == 0 ){
						listhtml +="<div class='row row-cols-2 row-cols-sm-2 row-cols-md-5 g-2'>";
					}
 
					
					listhtml +="	<div class='col' id='rowcard'>";
					listhtml +="		<div class='card shadow-sm'>";
					listhtml +="		<div class='card-wrapper'>";
					
					if( jsonData[i].novel_img == null ){
						listhtml +="			<a href='./novel_detail.do?novel_title=" + title + "'> <img src='https://page.kakaocdn.net/pageweb/2.6.3/public/images/img_age19_static.svg' class='img' width='100%'";	
					} else {
						listhtml +="			<a href='./novel_detail.do?novel_title=" + title + "'> <img src='"+ jsonData[i].novel_img +"' class='img' width='100%'";
					}
					
					listhtml +="				height='225' role='img' aria-label='Placeholder: Thumbnail'>";
					listhtml +="			</a>";
					listhtml +="		</div>";
					listhtml +="			<div class='card-body'>";

					if( jsonData[i].novel_genre == "romance" ){
						listhtml += "<p class='card-text' >로맨스</p>";	
					} else if( jsonData[i].novel_genre == "fantasy"  ){
						listhtml += "<p class='card-text' >판타지</p>";	
					} else if( jsonData[i].novel_genre == "romancefantasy" ){
						listhtml += "<p class='card-text' >로맨스 판타지</p>";
					} else {
						listhtml += "<p class='card-text' > </p>";
					}
					listhtml +="				<p class='card-text' id='novel-title'>" + jsonData[i].novel_title + "</p>";

					if( jsonData[i].novel_writer != null ){
						let star = parseFloat(jsonData[i].novel_avgstar).toFixed(2);
						listhtml +="				<p class='card-text'>"+ jsonData[i].novel_writer + "</p>";
					} else {
						listhtml +="				<p class='card-text'> </p>";
					}
					if( jsonData[i].novel_avgstar != null ){
						let star = parseFloat(jsonData[i].novel_avgstar).toFixed(2);
						listhtml +="				<p class='card-text'><i class='bi bi-star-fill'> "+ star + "</i></p>";
					} else {
						listhtml +="				<p class='card-text'><i class='bi bi-star-fill'> 0.0 </i></p>";
					}
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
		

	    $('#tablists').on('show.bs.tab', function(e){
	    	let Target1 = e.target;
	    	Target1.style.background ="#ffb26b"
	    	let Target2 = e.relatedTarget;
	    	Target2.style.background = "white";
	        });
	    
	    $('a[data-link="platform"]').on('show.bs.tab', function(e){
	    	let myTarget = e.target;
	    	myTarget.style.color = "white";
	    	let futureTarget = e.relatedTarget;
	    	futureTarget.style.color = "#ffb26b";
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
		<ul class="nav justify-content-center"
			role="tablist" id="tablists">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="pill" href="#kakaopage" id="nav-button" data-link="platform"
				style="background-color: #ffb26c; color: #fff;">카카오 페이지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#series" id="nav-button" data-link="platform">네이버 시리즈</a>
		</ul>
	</div>
	<div class="container w-75">

		<div class="tab-content" id="novel_genre">
			<div id="pop30" class="container tab-pane fade"></div>
			<div id="kakaopage" class="container tab-pane active">
				<!-- Nav pills -->
				<ul class="nav justify-content-center" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-bs-toggle="pill" href="#romance" id="kromance">로맨스</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						href="#romancefantasy" id="kromancefantasy">로맨스판타지</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						href="#fantasy" id="kfantasy">판타지</a></li>
				</ul>
			</div>

			<div id="series" class="container tab-pane fade">
				<ul class="nav justify-content-center" role="tablist">
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