<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.example.model.freeboardTO"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<freeboardTO> boardLists = (ArrayList<freeboardTO>)request.getAttribute("boardLists");

	StringBuilder sbHtml = new StringBuilder();

	for( freeboardTO to : boardLists ){
		sbHtml.append("<tr>");
		sbHtml.append("		<td><input type='checkbox' name='board_check'></td>");
		sbHtml.append("		<td>"+ to.getFree_seq() +"</td>");
		sbHtml.append("		<td>["+ to.getFree_category() +"]</td>");
		sbHtml.append("		<td class='left'><a href='admin_board_view.do?seq="+ to.getFree_seq() + "'>"+ to.getFree_subject() +"</a>&nbsp;</td>");
		sbHtml.append("		<td>"+ to.getUser_nickname() +"</td>");
		sbHtml.append("		<td>"+ to.getFree_date()+"</td>");
		sbHtml.append("		<td><input type='button' value='상세보기' class='btn_board_view' onClick=\"location.href='./admin_board_view.do?seq="+ to.getFree_seq() +"'\">&nbsp;<input");
		sbHtml.append("			type='button' value='삭제' class='confirmStart'></td>");
		sbHtml.append("	</tr>");
	}    
%>

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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#cboxAll").click(function() {
		if($("#cboxAll").is(":checked")) $("input[name=board_check]").prop("checked", true);
		else $("input[name=board_check]").prop("checked", false);
	});
	
	$("input[name=board_check]").click(function() {
		var total = $("input[name=board_check]").length;
		var checked = $("input[name=board_check]:checked").length;
		
		if(total != checked) $("#cboxAll").prop("checked", false);
		else $("#cboxAll").prop("checked", true); 
	});
});

$().ready(function () {
    $(".confirmStart").click(function () {
        Swal.fire({
            title: '게시글 삭제',
            text: "삭제된 게시글은 복구할 수 없습니다. 정말 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '삭제가 완료되었습니다.',
                );
                deleteServer( $())
            }
        })
    });
});

</script>

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

<!-- 상단 디자인 -->

<!-- 본문 -->
	<div class="container w-75" id="con_title">
		<h4>게시물 관리</h4>
	    <p><strong>최신 게시물</strong></p>
	</div>

<!-- 조건 검색 -->
 	<div class="search_form">
    <nav class="navbar navbar-light bg-light justify-content-center">
	    <div class="search_form_boxes">조건 검색
    		<select class="search_target">
	  			<option value="title">제목</option>
	  			<option value="title_content">제목+내용</option>
			</select>
			<input type="search" name="search_keyword" placeholder="검색"/>
  			<button type="submit" class="btn btn-sm btn-outline-secondary" onclick="getSearchList()">검색하기</button>
	    </div>
	 </nav> 
	 </div>

<!-- 게시물 리스트 -->

	<div id="boardlist" class="container w-75 mt-3">
		<table class="table table-sm">
            <thead class="table-light text-center">
	            <tr>
             		<th scope="col"><input type="checkbox" id="cboxAll"></th>
	                <th scope="col">번호</th>
	                <th scope="col">분류</th>
    	            <th scope="col">제목</th>
              	  	<th scope="col">작성자</th>
              		<th scope="col">작성일</th>
                	<th scope="col">기능</th>
                </tr>
			</thead>
			<tbody class="text-center">
<!--  게시판 반복되는 부분
            <tr>
				<td><input type="checkbox" name="board_check"></td>
                <td>1</td>
                <td>[카테고리]</td>
                <td class="left"><a href="admin_board_view.do">테스트용 게시글</a>&nbsp;</td>
                <td>tester1</td>
                <td>2023-01-25</td>
                <td>
					<input type="button" value="상세보기">
					<input type="button" value="삭제" class="confirmStart">
                </td>
	        </tr>
-->
            <tr>
				<td><input type="checkbox" name="board_check"></td>
                <td>0</td>
                <td>[카테고리]</td>
                <td class="left"><a href="admin_board_view.do">테스트용 게시글</a>&nbsp;</td>
                <td>tester1</td>
                <td>23-01-25</td>
                <td>
					<input type="button" value="상세보기">
					<input type="button" value="삭제" class="confirmStart">
                </td>
	        </tr>
	        
			<%= sbHtml %>
            </tbody>
            </table>
        </div>

<!-- paging -->
		<div class="container">
				<nav aria-label="Page navigation example"
					class="nav justify-content-center">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
			        
        <!-- 버튼 -->
       	<div class="container d-flex justify-content-around">
				<div class="col-auto me-auto">
					<div class="input-group mb-3">
						<a class="btn btn-outline-dark confirmStart" id="addelbtn" role="button">선택 삭제</a>
					</div>
				</div>
				<div class="col-auto">
					<a class="btn btn-outline-dark" href="./admin_board_write.do" id="adwbtn" role="button">글쓰기</a>
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