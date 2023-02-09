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

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 
<script type="text/javascript">
	var naver_id_login = new naver_id_login("t_lypkaq8BrTPJcNpFhx",
			"http://localhost:8080/main.do");
	// 접근 토큰 값 출력
	// alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		// 요거 안됨
		alert(naver_id_login.getProfileData('birthyear'));
		alert(naver_id_login.getProfileData('birthday'));
		alert(naver_id_login.getProfileData('gender'));
	}
</script> -->
<style type="text/css">

#kakaonovelRank, #navernovelRank, #nav-button1, 
#nav-button2, #nav-button3, #nav-button4,
#nav-button5{
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

#contentname {
	width: 120px;
	height: 40px;
	margin: 16px;
	margin-top: 20px;
	border-radius: 20px;
	border: 0;
	padding-top: 6px;
	font-family: AppleSDGothicNeoR;
	font-size: 20px;
	font-weight: 800;
	font-style: normal;
	text-decoration-line: none;
	text-align: center;
	display: inline-block;
}

.button {
	width: 6px;
	height: 6px;
	margin: 10px;
	margin-top: 20px;
	margin-bottom: 40px;
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
	border-radius: 100%;
}

.cards-wrapper {
	display: flex;
	align: center;
}

.card {
	width: calc(75%/ 3);
}

.eventimg {
	width: 30%;
}

.eventcontainer {
	text-align: center;
}
</style>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	function novelLists(url) {
		$.ajax({
			url : url,
			type : 'get',
			datatype : 'json',
			success : function(jsonData) {
				
				let romance = jsonData[0].novelLists;
				let fantasy = jsonData[1].novelLists;
				let romancefantasy = jsonData[2].novelLists;
				
				$('#insertnovelList').html('');
				let listhtml = '';

				/* 인기순 - 데이터 필요 */
				listhtml +=`
					<div id="container">
					<div id="contentname" class="justify-content-center">인기순</div>
					<div id="carouselExample1" class="carousel slide">
						<div class="carousel-inner">
							`;
				for(let i=0, j=1 ; j<=2 ; j++ ){

					
					if( j==1 ){
						listhtml +=`
							<div class="carousel-item active">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(romance[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${romance[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					} else {
						listhtml +=`
							<div class="carousel-item">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(romance[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${romance[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					}
				}
				listhtml += `
							</div>
						</div>
					</div>
					<button class="button" type="button"
						data-bs-target="#carouselExample1" data-bs-slide="prev">
					</button>
					<button class="button" type="button"
						data-bs-target="#carouselExample1" data-bs-slide="next">
					</button>
					`;

					
				/* 로맨스 */
				listhtml +=`
					<div id="container">
					<div id="contentname" align="center">로맨스</div>
					<div id="carouselExample2" class="carousel slide">
						<div class="carousel-inner">
							`;
				for(let i=0, j=1 ; j<=2 ; j++ ){
					if( j==1 ){
						listhtml +=`
							<div class="carousel-item active">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(romance[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${romance[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					} else {
						listhtml +=`
							<div class="carousel-item">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(romance[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${romance[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					}
				}
				listhtml += `
							</div>
						</div>
					</div>
					<button class="button" type="button"
						data-bs-target="#carouselExample2" data-bs-slide="prev">
					</button>
					<button class="button" type="button"
						data-bs-target="#carouselExample2" data-bs-slide="next">
					</button>
					`;
					

				/* 로맨스 판타지 */
				listhtml +=`
					<div id="container">
					<div id="contentname" align="center">로맨스 판타지</div>
					<div id="carouselExample3" class="carousel slide">
						<div class="carousel-inner">
							`;
				for(let i=0, j=1 ; j<=2 ; j++ ){
					if( j==1 ){
						listhtml +=`
							<div class="carousel-item active">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(romancefantasy[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${romancefantasy[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					} else {
						listhtml +=`
							<div class="carousel-item">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(romancefantasy[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${romancefantasy[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					}
				}
				listhtml += `
							</div>
						</div>
					</div>
					<button class="button" type="button"
						data-bs-target="#carouselExample3" data-bs-slide="prev">
					</button>
					<button class="button" type="button"
						data-bs-target="#carouselExample3" data-bs-slide="next">
					</button>
					`;
				/* 판타지 */
				listhtml +=`
					<div id="container">
					<div id="contentname" align="center">판타지</div>
					<div id="carouselExample4" class="carousel slide">
						<div class="carousel-inner">
							`;
				for(let i=0, j=1 ; j<=2 ; j++ ){
					if( j==1 ){
						listhtml +=`
							<div class="carousel-item active">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(fantasy[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${fantasy[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					} else {
						listhtml +=`
							<div class="carousel-item">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(fantasy[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${fantasy[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					}
				}
				listhtml += `
							</div>
						</div>
					</div>
					<button class="button" type="button"
						data-bs-target="#carouselExample4" data-bs-slide="prev">
					</button>
					<button class="button" type="button"
						data-bs-target="#carouselExample4" data-bs-slide="next">
					</button>
					`;
				/* 이달의 신작 */
				listhtml +=`
					<div id="container">
						<div id="contentname" align="center">이달의 신작</div>
						<div id="carouselExample5" class="carousel slide">
							<div class="carousel-inner">
							`;
				for(let i=0, j=1 ; j<=2 ; j++ ){
					if( j==1 ){
						listhtml +=`
							<div class="carousel-item active">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(romance[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${romance[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					} else {
						listhtml +=`
							<div class="carousel-item">
							<div class="cards-wrapper">
							`;
						for( let k=0; k<5 ; k++, i++ ){
							let title = encodeURI(romance[i].novel_title);
							listhtml +=`
								<div class="card">
								<a href="novel_detail.do?novel_title=\${title}"> <img src="\${romance[i].novel_img}"
									class="card-img-top" alt="...">
								</a>
								</div>
								`;
						}
						listhtml +=`
							</div>
						</div>
						`;
					}
				}
				listhtml += `
							</div>
						</div>
					</div>
					<button class="button" type="button"
						data-bs-target="#carouselExample5" data-bs-slide="prev">
					</button>
					<button class="button" type="button"
						data-bs-target="#carouselExample5" data-bs-slide="next">
					</button>
					`;
					
					
					
				$('#insertnovelList').append(listhtml);
			},
			error : function(err) {
				alert('[에러] : ' + err.status);
			}
		})
	};
	$(document).ready(function() {
		
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
		
		let url = 'novel_main_kakaolists.do';
		novelLists(url);
		
		$('#kakaonovelRank').click(function(e){
			url = 'novel_main_kakaolists.do';
			novelLists(url);
		});
		$('#navernovelRank').click(function(e){
			url = 'novel_main_naverlists.do';
			novelLists(url);
		});
		

		$('#nav-button1').click(function(){
			let offset = $('#carouselExample1').offset(); 
	        $('html').animate({scrollTop : offset.top-250}, 200);
		});
		$('#nav-button2').click(function(){
			let offset = $('#carouselExample2').offset(); 
	        $('html').animate({scrollTop : offset.top-250}, 200);
		});
		$('#nav-button3').click(function(){
			let offset = $('#carouselExample3').offset(); 
	        $('html').animate({scrollTop : offset.top-250}, 200);
		});
		$('#nav-button4').click(function(){
			let offset = $('#carouselExample4').offset(); 
	        $('html').animate({scrollTop : offset.top-250}, 200);
		});
		$('#nav-button5').click(function(){
			let offset = $('#carouselExample5').offset(); 
	        $('html').animate({scrollTop : offset.top-250}, 200);
		});
	});
</script>
</head>
<body>

	<!-- header -->
	<jsp:include page="../include/header1.jsp"></jsp:include>

	<!-- 본문 -->

	<div class="container w-90">
		<div class="eventcontainer">
		<a>
			<img class="eventimg" alt=""
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/640px-A_black_image.jpg">
			</a>
		<a><img class="eventimg" alt=""
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/640px-A_black_image.jpg">
			</a>
		<a><img class="eventimg" alt=""
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/A_black_image.jpg/640px-A_black_image.jpg">
		</a>
		</div>
	</div>

	<div class="container w-75">
		<!-- Nav pills -->
		<ul class="nav nav-pills justify-content-center" role="tablists" id="tablists">
			<li class="nav-item"><a class="nav-link active" data-link="platform"
				data-bs-toggle="pill" href="#kakaopage" id="kakaonovelRank" style="background-color: #ffb26c; color: #fff;">카카오
					페이지</a></li>
			<li class="nav-item"><a class="nav-link" data-link="platform" data-bs-toggle="pill"
				href="#series" id="navernovelRank">네이버 시리즈</a>
		</ul>
	</div>
	<div class="container w-75">

		<div class="tab-content" id="novel_genre">
			<div id="kakaopage" class="container tab-pane active">
				<!-- Nav pills -->
				<ul class="nav justify-content-center" role="tablist">
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button1" href="carouselExample1">인기순</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button2" href="#carouselExample2">로맨스</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button3" href="#carouselExample3">로맨스판타지</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button4" href="#carouselExample4">판타지</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button5" href="#carouselExample5">이달의 신작</a></li>
				</ul>
			</div>

			<div id="series" class="container tab-pane fade">
				<ul class="nav justify-content-center" role="tablist">
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button1" href="carouselExample1">인기순</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button2" href="#carouselExample2">로맨스</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button3" href="#carouselExample3">로맨스판타지</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button4" href="#carouselExample4">판타지</a></li>
					<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
						id="nav-button5" href="#carouselExample5">이달의 신작</a></li>
				</ul>
			</div>

		</div>


		<div class="container text-center" id="insertnovelList"></div>
	</div>


	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>


</body>
</html>