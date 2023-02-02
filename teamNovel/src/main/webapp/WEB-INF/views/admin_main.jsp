<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style type="text/css">
	.nav-scroller{
		border: 1px solid black ;
	}

	.btn_area{
	overflow: hidden; margin: 10px 0;
	}
	
	.container{
    width: 90%;
    margin: 10px auto;
	}

	.align_left { float:left; }
	.align_right { float:right; }

</style>
</head>
<body>

<div class="container">
  <header class="blog-header lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center"> 
      <div class="col-4 pt-1">
        <a class="blog-header-logo text-dark" href="./admin_main.do">ADMINISTRATOR</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="#" aria-label="Mainpage">
        	
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><title>Mainpage</title><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg> Home</a>
        <a class="btn btn-sm btn-outline-secondary" href="#">Logout</a>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="./admin_member_list.do">회원 관리</a>
      <a class="p-2 link-secondary" href="./admin_board_list.do">게시물 관리</a>
      <a class="p-2 link-secondary" href="./admin_review_list.do">리뷰 관리</a>
      <a class="p-2 link-secondary" href="./admin_request_list.do">요청 리스트</a>
    </nav>
  </div>
</div>

<!-- 본문 -->
<!-- 상단 디자인 -->

<div class="container d-flex justify-content-around">
        <!--회원리스트-->
        <div class="table-responsive" style="width:500px" id="MemberList">
            <table class="table table-sm caption-top">
            <caption>회원 리스트</caption>
            <thead class="table-dark">
            <tr>
	            <th scope="col">#</th>
                <th scope="col">이메일</th>
                <th scope="col">닉네임</th>
                <th scope="col">가입일</th>
            </tr>
            </thead>
            <tbody>
            <tr>
	            <th scope="row">1</th>
                <td>이메일</td>
                <td>닉네임</td>
                <td>가입일</td>
            </tr>
            <tr>
	            <th scope="row">2</th>
                <td>이메일</td>
                <td>닉네임</td>
                <td>가입일</td>
            </tr>
            <tr>
	            <th scope="row">3</th>
                <td>이메일</td>
                <td>닉네임</td>
                <td>가입일</td>
            </tr>
            <tr>
	            <th scope="row">4</th>
                <td>이메일</td>
                <td>닉네임</td>
                <td>가입일</td>
            </tr>
            <tr>
	            <th scope="row">5</th>
                <td>이메일</td>
                <td>닉네임</td>
                <td>가입일</td>
            </tr>
            </tbody>
            </table>
        </div>

        <!--게시물 리스트-->
        <div class="table-responsive" style="width:500px" id="BoardList">
            <table class="table table-sm caption-top">
            <caption>최신 게시글</caption>
            <thead class="table-dark">
            <tr>
            	<th scope="col">#</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>제목</td>
                <td>작성자</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>제목</td>
                <td>작성자</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>제목</td>
                <td>작성자</td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>제목</td>
                <td>작성자</td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>제목</td>
                <td>작성자</td>
            </tr>
            </tbody>
            </table>
        </div>
</div>

<div class="container d-flex justify-content-around">
        <!--리뷰리스트-->
        <div class="table-responsive" style="width:500px" id="ReviewList">
        <table class="table table-sm caption-top">
            <caption>리뷰 리스트</caption>
            <thead class="table-dark">
            <tr>
            	<th scope="col">#</th>
                <th scope="col">작품명</th>
                <th scope="col">작성자</th>
                <th scope="col">별점</th>         
            </tr>
            </thead>
            <tbody>
            <tr>
            	<th scope="row">1</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            <tr>
            	<th scope="row">2</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            <tr>
            	<th scope="row">3</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            <tr>
            	<th scope="row">4</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            <tr>
            	<th scope="row">5</th>
                <td>작품명</td>
                <td>작성자</td>
                <td>별점</td>         
            </tr>
            </tbody>
            </table>
        </div>
        
        <!--요청리스트-->
        <div class="table-responsive" style="width:500px" id="RequestList">
        <table class="table table-sm caption-top">
            <caption>요청 리스트</caption>
            <thead class="table-dark">
            <tr>
            	<th scope="col">#</th>
                <th scope="col">카테고리</th>
                <th scope="col">제목</th>
                <th scope="col">날짜</th>         
            </tr>
            </thead>
            <tbody>
            <tr>
            	<th scope="row">1</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            <tr>
            	<th scope="row">2</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            <tr>
            	<th scope="row">3</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            <tr>
            	<th scope="row">4</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            <tr>
            	<th scope="row">5</th>
                <td>카테고리</td>
                <td>제목</td>
                <td>날짜</td>         
            </tr>
            </tbody>
            </table>
        </div>
</div>
<!--하단 디자인 -->


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