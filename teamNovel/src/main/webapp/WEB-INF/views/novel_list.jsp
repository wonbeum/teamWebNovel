<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.example.model.novelInfoTO"%>
<%@page import="java.util.ArrayList"%>

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
#nav-button {
	width: 120px;
	height: 40px;
	margin: 16px;
	margin-top: 20px;
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

#kromance, #kfantasy, #kromancefantasy, #nromance, #nfantasy,
	#nromancefantasy {
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

#pageGroup>ul>li>a {
	color: #999;
	border: none;
	font-family: AppleSDGothicNeoEB;
	font-size: 18px;
	width: 40px;
	height: 40px;
	margin-right: 10px;
	margin-left: 10px;
}

#pagging {
	height: 69px;
	margin: 50px 64px 0 57px;
	padding: 15px 25px 14px;
	border-radius: 15px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
	max-width: 555px;
	text-align: center;
}

li #pageli {
	display: inline-block;
}

#search {
	width: 350px;
	border: 1px solid;
	border-color: black;
	border-bottom-left-radius: 0.375rem;
	border-top-left-radius: 0.375rem;
}

.input-group {
	margin-bottom: 10px;
	text-align: center;
}
.card-body{
	height : 150px;
	font-size: 10px;
}

#paginggroup{
	text-align: center;
}

.card-text{
	margin-bottom: 10px;
}

#rowcard{
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

	function novelLists( url, page , search ){
		
		$.ajax({
			url : url,
			type : 'get',
	        data : {
		        'cpage' : page,
		        'search' : search
	        },
			dataType : 'json',
			success : function(jsonData) {

				let cpage = jsonData[0].cpage;
				let recordPerPage = jsonData[0].recordPerPage;
				let blockPerPage = jsonData[0].blockPerPage;
				let totalPage = jsonData[0].totalPage;
				let totalRecord = jsonData[0].totalRecord;
				let startBlock = jsonData[0].startBlock;
				let endBlock = jsonData[0].endBlock;
				
				$('#insertnovelList').html('');
				let listhtml = '';
				for( let i = 0; i < jsonData[0].novelLists.length ; i++ ){
					
					let title = encodeURI(jsonData[0].novelLists[i].novel_title);
					
					if( (i % 5) == 0 ){
						listhtml += `<div class='row row-cols-2 row-cols-sm-2 row-cols-md-5 g-2'>`;
					}
					listhtml += `	<div class='col'>`;
					
						listhtml += `										
						<div class='card shadow-sm' id='rowcard'>
							<a href='./novel_detail.do?novel_title=\${title}'> <img src='\${jsonData[0].novelLists[i].novel_img}' class='img' width='100%'
							height='225' role='img' aria-label='Placeholder: Thumbnail'>
							</a>
							<div class='card-body'>`;

							if( jsonData[0].novelLists[i].novel_genre == "romance" ){
								listhtml += `		
									<p class='card-text'>로맨스</p>`;
							} else if( jsonData[0].novelLists[i].novel_genre == "fantasy"  ){
								listhtml += `		
									<p class='card-text'>판타지</p>`;
							} else if( jsonData[0].novelLists[i].novel_genre == "romancefantasy" ){
								listhtml += `		
									<p class='card-text'>로맨스 판타지</p>`;
							}

						listhtml += `		
								<p class='card-text' id='novel-title'>\${jsonData[0].novelLists[i].novel_title}</p>
								<p class='card-text'>\${jsonData[0].novelLists[i].novel_writer}</p>`;
								
							if( jsonData[0].novelLists[i].novel_avgstar != null ){
								let star = parseFloat(jsonData[0].novelLists[i].novel_avgstar).toFixed(2);
								listhtml += `<p class='card-text'><i class='bi bi-star-fill'> \${star}</i> </p>`;
							} else {
								listhtml += `<p class='card-text'><i class='bi bi-star-fill'> 0.0 </i> </p>`;
							}
								
					listhtml += `
							</div>
						</div>`;
					
					listhtml += `	</div>`;
					
					if( (i % 5) == 4 ){
						listhtml += `</div>`;
					}
				}
				
				if( (jsonData[0].novelLists.length % 5)!= 0 ){
					for( let i = 1 ; i <= ( 5 - (jsonData[0].novelLists.length % 5 ) ) ; i ++ ){
						listhtml += `										
							<div class='card shadow-sm'>
								<div class='card-body'>
								</div>
							</div>
							`;
					}
					listhtml += `</div>`;
				}
				
				
				listhtml += `
					<div id="paginggroup">
					<div class="justify-content-center" id="pageGroup" style="display: inline-block;" >
						<ul class="pagination " id="pagging">`;
						
				if( cpage == 1 ){
					listhtml += `<li id="pageLi" class="page-item disabled"><a class="page-link">&laquo;</a></li>`;
				} else {
					listhtml += `<li id="pageLi" class="page-item"><a class="goBackPage page-link">&laquo;</a></li>`;
				}
				
				for( let i = startBlock ; i <= endBlock ; i ++ ){
					if( cpage == i ){
						listhtml += '	<li id="pageLi" class="page-item disabled"><a class="page-link">' + i + '</a></li>';
					} else {
						listhtml += '	<li id="pageLi" class="page-item"><a class="goPage page-link" data-page="' + i +  '">' + i + '</a></li>';
					}
				}
				
				if( cpage == totalPage ){
					listhtml += `<li id="pageLi" class="page-item disabled"><a class="page-link">&raquo;</a></li>`;
				} else {
					listhtml += `<li id="pageLi" class="page-item"><a class="goNextPage page-link">&raquo;</a></li>`;
				}
				
				listhtml += `
						</ul>
					</div>
					</div>`;
					
				$('#insertnovelList').append(listhtml);
				
				$(".goBackPage").click(function(){
			      	let page = cpage - 1;
			       	novelLists( url, page , search );
		        });
				
				$(".goPage").click(function(){
					page = $(this).attr("data-page");
			       	novelLists( url, page , search );
				});

				$(".goNextPage").click(function(){
			      	let page = cpage + 1;
			       	novelLists( url, page , search );
		        });

				$('#kromance').click(function(e){
					page = 1;
					url = 'novel_list_kakao_romance.do';
					novelLists( url, page );
				});
				$('#kromancefantasy').click(function(e){
					page = 1;
					url = 'novel_list_kakao_romancefantasy.do';
					novelLists( url, page );
				});
				$('#kfantasy').click(function(e){
					page = 1;
					url = 'novel_list_kakao_fantasy.do';
					novelLists( url, page );
				});
				$('#nromance').click(function(e){
					page = 1;
					url = 'novel_list_naver_romance.do';
					novelLists( url, page );
				});
				$('#nromancefantasy').click(function(e){
					page = 1;
					url = 'novel_list_naver_romancefantasy.do';
					novelLists( url, page );
				});
				$('#nfantasy').click(function(e){
					page = 1;
					url = 'novel_list_naver_fantasy.do';
					novelLists( url, page );
				}); 
				
			},
			error : function(err) {
				alert('[에러] : ' + err.status);
			}
		});
	};
	
	$(document).ready(function() {
		
		let urlStr = window.location.href;
		let url = new URL(urlStr);

		let urlParams = url.searchParams;

		let tag = urlParams.get('search');
		
		if( tag != null && tag != "" ){
			page=1;
			url = 'novel_list_search.do';
			novelLists( url, page, tag );
			$("input[id=search]").attr('value', tag );
		} else {
			url = 'novel_list_kakao_romance.do';
			let page = 1;
			novelLists( url, page );
		}
		
		$('#searchbtn').click(function(){
			page=1;
			url = 'novel_list_search.do';
			let search = document.getElementById('search').value;
			novelLists( url, page, search )
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
<body>
	<!-- 본문 -->



	<div class="container w-75">
		<ul class="nav justify-content-center" role="tablist" id="tablists">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="pill" href="#kakaopage" id="nav-button"
				data-link="platform" style="background-color: #ffb26c; color: #fff;">카카오
					페이지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
				href="#series" id="nav-button" data-link="platform">네이버 시리즈</a>
		</ul>
	</div>
	<div class="container w-75">

		<div class="tab-content" id="novel_genre">
			<div id="kakaopage" class="container tab-pane active">
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
						data-bs-toggle="pill" href="romance" id="nromance">로맨스</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						href="#romancefantasy" id="nromancefantasy">로맨스판타지</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						href="#fantasy" id="nfantasy">판타지</a></li>
				</ul>
			</div>
		</div>

		<div class="container" id="novellist">
			<div class="row">
				<div class="col" id="searchcol">
					<div class="col w-75 p-100" style="float: none; margin: 0 auto;">
						<div class="input-group justify-content-center">
							<input type="text" placeholder="검색어를 입력하세요"
								aria-describedby="button-addon" id="search">
							<button class="btn btn-outline-secondary" type="button"
								id="searchbtn">검색</button>
						</div>
					</div>
				</div>
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