<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.example.model.novelInfoTO"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<novelInfoTO> kr_list = (ArrayList<novelInfoTO>)request.getAttribute("kr_list");
	ArrayList<novelInfoTO> kf_list = (ArrayList<novelInfoTO>)request.getAttribute("kf_list");
	ArrayList<novelInfoTO> krf_list = (ArrayList<novelInfoTO>)request.getAttribute("krf_list");

	StringBuilder krsbHtml = new StringBuilder();
	StringBuilder kfsbHtml = new StringBuilder();
	StringBuilder krfsbHtml = new StringBuilder();
	
	
	for( int i = 1; i<= 15; i ++ ){
		novelInfoTO to = kr_list.get(i-0);
		
		if( (i%3)==1 ){
			if( i == 1 ){
				krsbHtml.append("	<div class='carousel-item active'>");
				krsbHtml.append("		<div class='cards-wrapper'>");
			} else {
				krsbHtml.append("	<div class='carousel-item'>");
				krsbHtml.append("		<div class='cards-wrapper'>");
			}
		}

		krsbHtml.append("			<div class='card'>");
		krsbHtml.append("				<a href='#'> <img src='"+ to.getNovel_img() +"'");
		krsbHtml.append("					class='card-img-top' alt='...'>");
		krsbHtml.append("				</a>");
		krsbHtml.append("			</div>");
		
		if( (i%3)==0 ){
			krsbHtml.append("		</div>");
			krsbHtml.append("	</div>");
		}
	}
	

	for( int i = 1; i<= 15; i ++ ){
		novelInfoTO to = kf_list.get(i-0);
		if( (i%3)==1 ){
			if( i == 1 ){
				kfsbHtml.append("	<div class='carousel-item active'>");
				kfsbHtml.append("		<div class='cards-wrapper'>");
			} else {
				kfsbHtml.append("	<div class='carousel-item'>");
				kfsbHtml.append("		<div class='cards-wrapper'>");
			}
		}

		kfsbHtml.append("			<div class='card'>");
		kfsbHtml.append("				<a href='#'> <img src='"+ to.getNovel_img() +"'");
		kfsbHtml.append("					class='card-img-top' alt='...'>");
		kfsbHtml.append("				</a>");
		kfsbHtml.append("			</div>");
		
		if( (i%3)==0 ){
			kfsbHtml.append("		</div>");
			kfsbHtml.append("	</div>");
		}
	}

	for( int i = 1; i<= 15; i ++ ){
		novelInfoTO to = krf_list.get(i-0);
		if( (i%3)==1 ){
			if( i == 1 ){
				krfsbHtml.append("	<div class='carousel-item active'>");
				krfsbHtml.append("		<div class='cards-wrapper'>");
			} else {
				krfsbHtml.append("	<div class='carousel-item'>");
				krfsbHtml.append("		<div class='cards-wrapper'>");
			}
		}

		krfsbHtml.append("			<div class='card'>");
		krfsbHtml.append("				<a href='#'> <img src='"+ to.getNovel_img() +"'");
		krfsbHtml.append("					class='card-img-top' alt='...'>");
		krfsbHtml.append("				</a>");
		krfsbHtml.append("			</div>");
		
		if( (i%3)==0 ){
			krfsbHtml.append("		</div>");
			krfsbHtml.append("	</div>");
		}
	}
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

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
</script>
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}

.cards-wrapper {
	display: flex;
	align: center;
}

.card {
	margin: 0 .5em;
	width: calc(50%/ 3);
}
</style>
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

	<!-- 본문 -->

	<div class="container">
		<header
			class="d-flex flex-wrap align-items-center justify-content-center">
			<ul
				class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#carouselExample1"
					class="nav-link px-2 link-secondary">인기순</a></li>
				<li><a href="#carouselExample2" class="nav-link px-2 link-dark">로맨스</a></li>
				<li><a href="#carouselExample3" class="nav-link px-2 link-dark">로맨스
						판타지</a></li>
				<li><a href="#carouselExample4" class="nav-link px-2 link-dark">판타지</a></li>
				<li><a href="#carouselExample5" class="nav-link px-2 link-dark">이달의
						신작</a></li>
			</ul>
		</header>
	</div>

	<div id="container">
		<div align="center">인기순</div>
		<div id="carouselExample1" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="cards-wrapper">
						<div class="card">
							<a href="#"> <img src="././images/kakao.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/ridi.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/series.png"
								class="card-img-top" alt="...">
							</a>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="cards-wrapper">
						<div class="card">
							<a href="#"> <img src="././images/kakao.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/ridi.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/series.png"
								class="card-img-top" alt="...">
							</a>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="cards-wrapper">
						<div class="card">
							<a href="#"> <img src="././images/kakao.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/ridi.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/series.png"
								class="card-img-top" alt="...">
							</a>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample1" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample1" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div id="container">
		<div align="center">로맨스</div>
		<div id="carouselExample2" class="carousel slide">
			<div class="carousel-inner">
			<%=krsbHtml %>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample2" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample2" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div id="container" >
		<div align="center">로맨스 판타지</div>
		<div id="carouselExample3" class="carousel slide">
			<div class="carousel-inner">
			<%=krfsbHtml %>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample3" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample3" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div id="container">
		<div align="center">판타지</div>
		<div id="carouselExample4" class="carousel slide">
			<div class="carousel-inner">
				<%=kfsbHtml %>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample4" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample4" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div id="container">
		<div align="center">이달의 신작</div>
		<div id="carouselExample5" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="cards-wrapper">
						<div class="card">
							<a href="#"> <img src="././images/kakao.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/ridi.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/series.png"
								class="card-img-top" alt="...">
							</a>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="cards-wrapper">
						<div class="card">
							<a href="#"> <img src="././images/kakao.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/ridi.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/series.png"
								class="card-img-top" alt="...">
							</a>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="cards-wrapper">
						<div class="card">
							<a href="#"> <img src="././images/kakao.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/ridi.png"
								class="card-img-top" alt="...">
							</a>
						</div>
						<div class="card">
							<a href="#"> <img src="././images/series.png"
								class="card-img-top" alt="...">
							</a>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample5" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample5" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<hr class="footer-div">

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