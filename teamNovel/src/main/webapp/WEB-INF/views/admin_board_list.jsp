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
	
	.search_form{
		width: 1200px;
		margin: 0 auto;
	}
	
	.search_form_boxes{
		float: left;
	}

	.btn_area{
	overflow: hidden; margin: 10px 0;
	}
	
	.align_left { float:left; }
	.align_right { float:right; }

	.board { width:100%; }
	.board th { height:41px; border-bottom:1px solid #dadada; background-color:#f9f9fb; color:#464646; font-weight:600; word-wrap: break-word; border-top:1px solid #464646; word-break: break-all; }
	.board td { height:30px; border-bottom:1px solid #dadada; color:#797979; text-align:center; padding:5px; word-wrap: break-word; word-break: break-all; }
	.board td.left {text-align:left;}
	.board td.category{ font-weight:bold; }  
	.board_title { font-size:14px; font-weight:bold; color:#000; }

	
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
<div class="con_title">
	<h3>게시물 관리</h3>
    <p><strong>최신 게시물</strong></p>
</div>

 	<div class="search_form">
    <nav class="navbar navbar-light bg-light justify-content-center">
	    <div class="search_form_boxes">조건 검색
    		<select class="search_target">
	  			<option value="title">제목</option>
	  			<option value="content">내용</option>
			</select>
			<input type="search" name="search_keyword" placeholder="검색" aria-label="Search" aria-describedby="search-addon" />
  			<button type="submit" class="btn btn-sm btn-outline-secondary" href="#">검색</button>
	    </div>
	 </nav> 
	 </div>

<div class="con_txt">
    <div class="contents_sub">
        <div class="board_top">
            <div class="bold">총 <span class="txt_orange">1</span>건</div>
        </div>

        <!--게시판-->
        <div class="board">
            <table>
            <tr>
             	<th width="3%">&nbsp;</th>
                <th width="3%">
                	&nbsp;<input class="form-check-input" type="checkbox" name="deletebox" value="selectall" aria-label="..."  onclick='selectAll(this)'>
                </th>
                <th width="5%">번호</th>
                <th>제목</th>
                <th width="10%">아이디</th>
                <th width="17%">작성일</th>
                <th width="5%">기능</th>
                <th width="3%">&nbsp;</th>
            </tr>
            
<!--  게시판 반복되는 부분
            <tr>
                <td>
                	<div>
                	<input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="...">
					</div>
				</td>
                <td>1</td>
                <td class="left"><a href="board_view1.jsp">adfas</a>&nbsp;<img src="../../images/icon_new.gif" alt="NEW"></td>
                <td>asdfa</td>
                <td>2017-01-31</td>
                <td>6</td>
                <td>&nbsp;</td>
            </tr>
-->
            <tr>
	            <td>&nbsp;</td>
                <td>
                	<input class="form-check-input" type="checkbox" name="deletebox" value="" aria-label="...">
				</td>
                <td>1</td>
                <td class="left"><a href="admin_board_view.do">테스트용 게시글</a>&nbsp;</td>
                <td>tester1</td>
                <td>2023-01-25</td>
                <td>
                	<input type="button" value="상세보기" class="btn_board_view" style="cursor: pointer;" onclick="location.href='admin_board_view.do'" />
                	<input type="button" value="삭제" class="btn_board_delete" style="cursor: pointer;" onclick="location.href='admin_board_delete_ok.do'" />
				<td>&nbsp;</td>
            </tr>
            
            </table>
        </div>  

        <div class="btn_area">
        	<div class="align_letf">
                <input type="button" value="전체 삭제" class="btn_admin_board_delete" style="cursor: pointer;" onclick="location.href='admin_board_delete_ok.do'" />
			</div>
			<div class="align_right">
                <input type="button" value="공지글 작성" class="btn_admin_board_write" style="cursor: pointer;" onclick="location.href='admin_board_write.do'" />
            </div>
        </div>
        <!--게시판-->
    </div>
</div>
<!--//하단 디자인 -->


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