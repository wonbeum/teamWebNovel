<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.ArrayList"%>

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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function AdminBoardListAjax(url, page, category, keyword){
	$.ajax({
		url : url,
		type : 'get',
		dataType : 'json',
		data : {
			'cpage' : page,
			'category' : category,
			'keyword' : keyword
		},
		success : function(jsonData){
			//console.log("성공");
			
			let cpage = jsonData[0].cpage;
			let recordPerPage = jsonData[0].recordPerPage;
			let blockPerPage = jsonData[0].blockPerPage;
			let totalPage = jsonData[0].totalPage;
			let totalRecord = jsonData[0].totalRecord;
			let startBlock = jsonData[0].startBlock;
			let endBlock = jsonData[0].endBlock;
				
			$('#insert').html('');
			
			let ajaxHtml = '';
			
			for(let i=0; i<recordPerPage; i++){
				if( jsonData[0].boardLists[i] == null ){
					ajaxHtml += `
						<tr> 
						</tr>
					`;
					
				} else {
					ajaxHtml += `
							<tr>
							<td>\${jsonData[0].boardLists[i].free_seq}</td>
							<td>[\${jsonData[0].boardLists[i].free_category}]</td>
							<td class='left'><a href='admin_board_view.do?seq=\${jsonData[0].boardLists[i].free_seq}'>
							\${jsonData[0].boardLists[i].free_subject}</a>&nbsp;</td>
							<td>\${jsonData[0].boardLists[i].user_nickname}</td>
							<td>\${jsonData[0].boardLists[i].free_date}</td>
							<td>
								<input type='button' value='상세보기' onclick="location.href='admin_board_view.do?seq=\${jsonData[0].boardLists[i].free_seq}';"/>
								<input type='button' value='삭제' onclick="location.href='admin_board_delete_ok.do?seq=\${jsonData[0].boardLists[i].free_seq}'">
							</td>
							</tr>
						`;
				}
			}
			
			$('#insert').append(ajaxHtml);
			
			$('#insertPagging').html('');
			let page = '';
			
			page += `
			<div style="display: inline-block;" id="pageGroup">
			<ul class="pagination" id="pagging">`;
			
			if( cpage == 1 ){
				page += `<li id="pageLi" class="page-item disabled"><a class="page-link"> <span aria-hidden="true">&laquo;</span>
				</a></li>`;
			} else {
				page += `<li id="pageLi" class="page-item"><a class="goBackPage page-link"> <span aria-hidden="true">&laquo;</span>
				</a></li>`;
			}
			
			for( let i = startBlock ; i <= endBlock ; i ++ ){
				if( cpage == i ){
					page += '	<li id="pageLi" class="page-item disabled"><a class="page-link">' + i + '</a></li>';
				} else {
					page += '	<li id="pageLi" class="page-item"><a class="goPage page-link" data-page="' + i +  '">' + i + '</a></li>';
				}
			}
			
			if( cpage == totalPage ){
				page += `<li id="pageLi" class="page-item disabled"><a class="page-link"><span aria-hidden="true">&raquo;</span></a></li>`;
			} else {
				page += `<li id="pageLi" class="page-item"><a class="goNextPage page-link"><span aria-hidden="true">&raquo;</span></a></li>`;
			}
			
			page += `
					</ul>
				</div>`;
				
				$('#insertPagging').append(page);
				
				$(".goBackPage").click(function(){
			      	page = (cpage - 1);
			      	AdminBoardListAjax( url, page, category, keyword );
		        });
				
				$(".goPage").click(function(){
					page = $(this).attr("data-page");
					AdminBoardListAjax( url, page, category, keyword );
				});

				$(".goNextPage").click(function(){
			      	page = (cpage + 1);
			      	AdminBoardListAjax( url, page, category, keyword );
		        });
		},
		error : function(e) {
			console.log( e.status );
		}
	});
};


$(document).ready(function() {
	
	let url = 'AdminBoardListAjax.do';
	let page = 1;
	let insert = '#insertTotalList';
	AdminBoardListAjax( url, page, insert );

	
	$('#searchbtn').click(function() {
		let category = $('#serch_category').val().trim(); // 분류2
		let target = $('#serch_target').val().trim(); // 제목 or 제목+내용
		let keyword = $('#input_keyword').val().trim(); // 키워드
	
		if($('#serch_target').val()=='제목') {
			AdminBoardListAjax('boardSearch_titleAjax.do', 1 , category, keyword);
		} else if($('#serch_target').val()=='제목+내용') {
			AdminBoardListAjax('boardSearch_contentAjax.do', 1 , category, keyword);
		} else {
			AdminBoardListAjax('AdminBoardListAjax.do', 1 , keyword);
		}
	});
	
	
});

</script>

</head>
<body>

<!-- header -->
	<%@ include file="../include/header2.jsp" %>


<!-- 본문 -->
	<form class="row g-3 justify-content-md-center mt-4">
		<div class="col-md-2"></div>
			<div class="col-md-10">
		    <h5>최신 게시물</h5>
		    </div>
<!-- 조건 검색 -->
		<div class="col-md-1">
		</div>
		<div class="col-md-2">
	    	<select class="form-select" id="serch_category">
	    		<option selected disabled>카테고리를 선택하세요!</option>
	    		<option>공지</option>
	  			<option>질문</option>
	  			<option>이슈</option>
	  			<option>잡담</option>
			</select>
		</div>
		<div class="col-md-2">	
    		<select class="form-select" id="serch_target">
				<option selected>제목</option>
	  			<option>제목+내용</option>
			</select>
		</div>	
		<div class="col-md-4">
			<input type="text" class="form-control" id="input_keyword"/>
		</div>
		<div class="col-md-2">	
  			<button class="btn btn-sm btn-outline-secondary" type="button" id="searchbtn">검색하기</button>
	    </div>
	</form>

<!-- 게시물 리스트 -->

	<div id="boardlist" class="container w-75 mt-3">
		<table class="table table-sm">
            <thead class="table-light text-center">
	            <tr>
	                <th scope="col">번호</th>
	                <th scope="col">분류</th>
    	            <th scope="col">제목</th>
              	  	<th scope="col">작성자</th>
              		<th scope="col">작성일</th>
                	<th scope="col">기능</th>
                </tr>
			</thead>
			<tbody id="insert" class="text-center">
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
	        
            </tbody>
            </table>
        </div>

<!-- paging -->
<div class="container d-flex justify-content-around">
	<div class="container mb-4" id="insertPagging"></div>
	<div class="col-auto">
		<a class="btn btn-outline-dark" href="./admin_board_write.do" id="adwbtn" role="button">글쓰기</a>
	</div>
</div>
    

<!-- footer -->
	<%@ include file="../include/footer1.jsp" %>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>