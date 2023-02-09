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
					let result = "" ;
					result += "<li>";
					result += "<div>";
					result += "	<span><strong>"+jsonData[i].user_nickname+"</strong></span> <span class='fw-lighter'>"+jsonData[i].cmt_date+"</span>";
					result += "	<span class='fw-lighter'>";
					result += "		<button onclick = 'cmt_delete("+ jsonData[i].free_seq +","+ jsonData[i].cmt_seq +")'>삭제</button>";
					result += "	</span>";
					result += "</div>";
					result += "<div>";
					result += "	<p>"+jsonData[i].cmt_content+"</p>";
					result += "</div>";
					result += "</li>";
					
				$('#cmt_area').append(result);
			}
		
		},
		error : function(e) {
			alert("error !");
		}
	});
};

// 댓글 삭제(차단)
function cmt_delete(free_seq, cmt_seq){
	var check = confirm('댓글을 삭제하시겠습니까?');
		if(check){
			$.ajax({
				type : 'get',
				url : 'CommentDeleteAjax.do',
				data : {
					free_seq : free_seq,
					cmt_seq : cmt_seq
				},
				dataType : 'json',
				success : function(list){
					commentList();
					//alert("댓글 삭제 완료");
				
				},
				error : function(){
					alert('댓글 삭제 실패');
				}
			});
		}
	}


</script>
</head>
<body>

<!-- header -->
<jsp:include page="../include/header2.jsp"></jsp:include>

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


<!-- footer -->
<jsp:include page="../include/footer1.jsp"></jsp:include>
		

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>