<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	.nav-scroller{
		border: 1px solid black ;
	}
	
	
	.card-imgs{
	  position: relative;
	  width: 350px;
	  height: 350px;
	}
	.card-imgs img{
	  position:absolute;
	  width: 100%;
	  height: 100%;
	}
	.card-imgs img.img-hover{
	  display:none;
	}
	.card-imgs:hover img.img{
	  display:block;
	  transition: 1s ease-out;
	  opacity: 0;
	}
	.card-imgs:hover img.img-hover{
	  display:block;
	  transition: 1s ease-out;
	  opacity : 0.6;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#rqbtn').click(function(){
			if(true) {
				alert("로그인 후 요청이 가능합니다!");
				return false;
			}
		});
	});

</script>
</style>
</head>
<body>

<div class="container" >
  <header class="blog-header lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary" href="./main.do">사이트 로고</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="./main.do">사이트 이름</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="./novel_search.do" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
        <c:if test="${signIn == null}">
        	<a class="btn btn-sm btn-outline-secondary" href="./login.do">Sign up</a>
        </c:if>
        <c:if test="${signIn != null}">
        	<div class="dropdown text-end">
        		<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
        			<img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
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
      <a class="p-2 link-secondary" href="./rank_list.do">랭킹</a>
      <a class="p-2 link-secondary" href="./review_list.do">리뷰</a>
      <a class="p-2 link-secondary" href="./novel_list.do">웹소설</a>
      <a class="p-2 link-secondary" href="./board_list.do">커뮤니티</a>
      <a class="p-2 link-secondary" href="./origin_list.do">원작 소설 찾기</a>
    </nav>
  </div>
</div>

<!-- 본문 -->


<div class="container w-75">
	<!-- Nav pills -->
	<ul class="nav justify-content-center bg-light" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" data-bs-toggle="pill" href="#weptoon">웹툰</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="pill" href="#drama">드라마</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-bs-toggle="pill" href="#movie">영화</a>
		</li>
	</ul>
</div>

<!-- 요청하기 버튼 -->
<div class="container w-75">
	<div class="row">
		<div align="right">
		  	<a class="btn btn-outline-dark" href=#" id="rqbtn" role="button">요청하기</a>
		</div>
	</div>
</div>

<!-- Tab panes -->
<div class="tab-content">


	<!-- 웹툰 리스트 -->
	<div class="container tab-pane show active w-75" id="webtoon" role="tabpanel"><br />	
	<h5>웹툰</h5>
	<div class="container">
		<div class="card-group">
	  		<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
			<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
			<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
	</div>
	<div class="container">
	<div class="card-group">
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
	</div>
	</div>
	<div class="container">
	<div class="card-group">
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
	</div>
	</div>
	</div>
<!-- paging -->
	<nav aria-label="Page navigation example">	
  	<ul class="pagination justify-content-center">
    	<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
    	<span aria-hidden="true">&laquo;</span></a></li>
      	<li class="page-item"><a class="page-link" href="#">1</a></li>
      	<li class="page-item"><a class="page-link" href="#">2</a></li>
      	<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#" aria-label="Next">
			<span aria-hidden="true">&raquo;</span></a></li>
      </ul>
	</nav>
</div>

	<!-- 드라마 리스트 -->
	<div class="container tab-pane fade w-75" id="drama" role="tabpanel"><br />
	<h5>드라마</h5>
	<div class="container">
		<div class="card-group">
	  		<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
			<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
			<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
	</div>
	<div class="container w-75">
	<div class="card-group">
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
	</div>
	</div>
	<div class="container w-75">
	<div class="card-group">
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
	</div>
	</div>
	</div>
<!-- paging -->
	<nav aria-label="Page navigation example">	
  	<ul class="pagination justify-content-center">
    	<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
    	<span aria-hidden="true">&laquo;</span></a></li>
      	<li class="page-item"><a class="page-link" href="#">1</a></li>
      	<li class="page-item"><a class="page-link" href="#">2</a></li>
      	<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#" aria-label="Next">
			<span aria-hidden="true">&raquo;</span></a></li>
      </ul>
	</nav>
	</div>

	<!-- 영화 리스트 -->
	<div class="container tab-pane fade w-75" id="movie" role="tabpanel"><br />
	<h5>영화</h5>
	<div class="container">
		<div class="card-group">
	  		<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
			<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
			<div class="card">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
	</div>
	<div class="container w-75">
	<div class="card-group">
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
	</div>
	</div>
	<div class="container w-75">
	<div class="card-group">
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
		<div class="card">
    		<img src="..." class="card-img-top" alt="...">
		    <div class="card-body">
		      <h5 class="card-title">제목</h5>
		      <p class="card-text">원작 : 작가이름</p>
		      <p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
		    </div>
		</div>
	</div>
	</div>
	</div>
<!-- paging -->
	<nav aria-label="Page navigation example">	
  	<ul class="pagination justify-content-center">
    	<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
    	<span aria-hidden="true">&laquo;</span></a></li>
      	<li class="page-item"><a class="page-link" href="#">1</a></li>
      	<li class="page-item"><a class="page-link" href="#">2</a></li>
      	<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#" aria-label="Next">
			<span aria-hidden="true">&raquo;</span></a></li>
      </ul>
	</nav>
	</div>
</div>

<!-- paging 
	<nav aria-label="Page navigation example">	
  	<ul class="pagination justify-content-center">
    	<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
    	<span aria-hidden="true">&laquo;</span></a></li>
      	<li class="page-item"><a class="page-link" href="#">1</a></li>
      	<li class="page-item"><a class="page-link" href="#">2</a></li>
      	<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#" aria-label="Next">
			<span aria-hidden="true">&raquo;</span></a></li>
      </ul>
	</nav>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>