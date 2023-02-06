<%@page import="com.example.model.commentTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.model.freeboardTO"%>
	
<%
	freeboardTO to = (freeboardTO)request.getAttribute("to");
	
	String free_seq = to.getFree_seq();
	String email = to.getUser_email();
	String nickname = to.getUser_nickname();
	String wdate = to.getFree_date();
	String subject = to.getFree_subject();
	String date = to.getFree_date();
	String wip = to.getFree_ip();
	String hit = to.getFree_hit();
	String like = to.getFree_like();
	String content = to.getFree_content();
	
	commentTO cto = (commentTO)request.getAttribute("cto");

	
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
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$(function(){
		commentList();
		setInterval(commentList, 1000);
		commentList();
	});
});

//댓글 가져오기
const commentList =function() {
	$.ajax({
		url : 'AdminCommentListAjax.do',
		type : 'get',
		data : {
			free_seq : "<%=free_seq%>"
		},
		dataType : 'json',
		success : function(jsonData){
				
			$('#cmt_area').html('');
			
			for(let i=0; i<jsonData.length; i++){	
				const result = `
					<li>
						<div>
							<span><strong>\${jsonData[i].user_nickname}(\${jsonData[i].user_email})</strong></span> <span class='fw-lighter'>\${jsonData[i].cmt_date}</span>
							<input type="button" class="cmtdelbtn" value="삭제">
						</div>
						<div>
							<p>\${jsonData[i].cmt_content}</p>
						</div>
					</li>
				`
				$('#cmt_area').append(result);
				$(".cmtdelbtn").on('click', deleteReply);
			}
		
		},
		error : function(e) {
			alert("error !");
		}
	});
};

function deleteReply(){
	alert("삭제!");
}

const deleteOkServer = function(){
	$.ajax({
		url:'./board_comment_delete_ok.json?seq='+ <%=free_seq%>,
		type: 'get',
		dataType: 'json',
		success: function(jsonData) {
			if(jsonData.flag==0){
				alert( "삭제 성공!");
			
				$( '#d_password').val('');
				$( '#deleteDialog').dialog('close');
				commentList();
			}
		},
		error: function(err) {
			alert( "[에러] :" + err.status );
		}
	})
};

</script>
</head>
<body>

<div class="container" >
  <header class="blog-header lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center"> 
      <div class="col-4 pt-1">
        <a class="blog-header-logo text-dark" href="./admin_main.do">ADMINISTRATOR</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="#" aria-label="Mainpage">
        	
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="./main.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16"><title>Mainpage</title><path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/></svg> Home</a>
        <a class="btn btn-sm btn-outline-secondary" href="#">Logout</a>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
				<a class="p-2 link-secondary" href="./admin_member_list.do">회원 관리</a> <a
					class="p-2 link-secondary" href="./admin_board_list.do">게시물 관리</a> <a
					class="p-2 link-secondary" href="./admin_review_list.do">리뷰 관리</a> <a
					class="p-2 link-secondary" href="./admin_origin_request_list.do">요청 리스트</a>
			</nav>
  </div>
</div>
<!-- 상단 디자인 -->
<!-- 본문 -->

<!-- 게시판 헤더 -->
<main>
<div class="container w-75">
	<div class="row mt-5">
		<div class="col-auto me-auto">
  		  <h5>커뮤니티 게시판 상세보기</h5>
		</div>
		<div class="col-auto">
			<a href="./admin_main.do">
			<img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로">
			</a>
			<img class="arrow" src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" alt="하위메뉴"><a href="./admin_board_list.do">게시판 관리</a>
		</div>
	</div>
</div>

<!-- 게시판 내용 -->
	<div class="container w-75 mb-5">
        <div class="container w-75">
 		<form action="./admin_board_delete_ok.do" method="post" name="AdminBoardDelete">
		<input type="hidden" name="seq" value="<%=free_seq %>" />
			<table class="table">
           	<thead>
           		<tr>
	                <th width="10%">제목</th>
	                <td width="40%"><%=subject %></td>
	                <th width="10%">등록일</th>
	                <td width="20%"><%=wdate %></td>
	                <th width="10%"></th>
	            </tr>
				<tr>
	                <th>글쓴이</th>
                	<td><%=nickname %>(<%=email %>)(<%=wip %>)</td>
                	<th>추천</th>
                	<td><%=like %></td>
                	<th>조회</th>
                	<td><%=hit %></td>
         	   </tr>
         	</thead>
         	<tbody>
         		<tr>
               		<td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%=content %></td>
	            </tr>
            </tbody>
            </table>
            </form>
        </div>
        
        <!-- 댓글 -->
			<div class="container w-75 mb-5">
					<table class="table">
						<tbody>
							<tr>
								<th class="subject"><h4>댓글</h4></th>
							</tr>
						</tbody>
					</table>
					<ul class="list-unstyled" id="cmt_area">					 
					</ul>
			</div>
		</div>


<!-- 버튼 -->
        <div class="container d-flex justify-content-around">
            <div class="col-auto me-auto">
            	<a class="btn btn-outline-secondary mt-3" href="./admin_board_list.do" role="button">목록</a>
            </div>
            <div class="col-auto">
            	<a class="btn btn-outline-secondary mt-3" href="./admin_board_delete_ok.do?seq=<%=free_seq%>" role="button">삭제</a>
            	<a class="btn btn-outline-secondary mt-3" href="./admin_board_write.do" role="button">쓰기</a>
            </div>
        </div>
</main>
<!-- 하단 디자인 -->


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