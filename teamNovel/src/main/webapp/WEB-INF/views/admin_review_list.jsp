<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

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
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}

#td_link {
	color: #000;
}

#pageGroup > ul > li > a{
	color: #999;
	border: none;
	font-family: AppleSDGothicNeoEB;
  	font-size: 20px;
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
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function ReviewListAjax(url, page, keyword){
	$.ajax({
		url : url,
		type : 'get',
		dataType : 'json',
		data : {
			'cpage' : page,
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
				if( jsonData[0].reviewLists[i] == null ){
					ajaxHtml += `
						<tr> 
						</tr>
					`;
					
				} else {
					ajaxHtml += `
							<tr> 
							<td>\${jsonData[0].reviewLists[i].review_seq}</td>
							<td><a id="td_link" href="novel_detail.do?novel_title=\${jsonData[0].reviewLists[i].novel_title}">\${jsonData[0].reviewLists[i].novel_title}</td>
							<td>\${jsonData[0].reviewLists[i].user_nickname}</td>
							<td><a id="td_link" href="admin_review_view.do?seq=\${jsonData[0].reviewLists[i].review_seq}" class="d-inline-block text-truncate" style="max-width: 400px;">
								\${jsonData[0].reviewLists[i].review_content}</a></td>
							<td>\${jsonData[0].reviewLists[i].review_star_grade}</td>
							<td>\${jsonData[0].reviewLists[i].review_date}</td>
							<td><input type='submit' value='삭제' class='deletebutton' data-seq="\${jsonData[0].reviewLists[i].review_seq}"></td>
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
				      	ReviewListAjax( url, page, keyword);
			        });
					
					$(".goPage").click(function(){
						page = $(this).attr("data-page");
						ReviewListAjax( url, page, keyword );
					});

					$(".goNextPage").click(function(){
				      	page = (cpage + 1);
				      	ReviewListAjax( url, page, keyword );
			        });
					
					$(".deletebutton").click(function () {
				        Swal.fire({
				            title: '회원 정보 삭제',
				            text: "삭제된 회원 정보는 복구할 수 없습니다. 정말 삭제하시겠습니까?",
				            icon: 'warning',
				            showCancelButton: true,
				            confirmButtonColor: '#3085d6',
				            cancelButtonColor: '#d33',
				            confirmButtonText: '확인',
				            cancelButtonText: '취소'
				        }).then((result) => {
				            if (result.isConfirmed) {
				            	let seq = $(this).attr("data-seq");
				                location.href = "./admin_review_delete_ok.do?seq="+seq;
				            }
				        })
				    });
		},
		error : function(e) {
			alert("error !");
		}
	});
};
	
	$(document).ready(function() {
		
		let url = 'ReviewListAjax.do';
		let page = 1;
		let keyword = '';
		ReviewListAjax( url, page, keyword );
		
		// 검색
		$('#searchbtn').click(function(){
			let keyword = $('#input_keyword').val().trim();
		
			if($('#serch_category').val()=='작품명') {
				ReviewListAjax('SearchReview_titleAjax.do', 1 , keyword);
				
			} else if($('#serch_category').val()=='별점') {
				ReviewListAjax('SearchReview_starAjax.do', 1 , keyword);
				
			} else {
				ReviewListAjax('SearchReview_contentAjax.do', 1 , keyword);
			}	
					//console.log(keyword);
			
		});
	
	});
	
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="../include/header2.jsp" %>

	<!-- main -->
	<!-- 검색 -->
	<form class="row g-3 justify-content-md-center mt-4">
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h5>최신리뷰</h5>
		</div>
		<div class="col-md-1">
			<a>조건검색</a>
		</div>
		<div class="col-md-3">
			<select class="form-select" id="serch_category">
				<option selected>작품명</option>
				<option>별점</option>
				<option>닉네임+내용</option>
			</select>
		</div>
		<div class="col-md-4">
			<input type="text" class="form-control" id="input_keyword">
		</div>
		<div class="col-md-2">
			<button class="btn btn-primary" type="button" id="searchbtn">검색하기</button>
		</div>
	</form>

	<!-- 테이블 -->
	<div class="container mt-4">
		<table class="table">
			<thead class="table-light">
				<tr>
					<th>번호</th>
					<th>작품명</th>
					<th>닉네임</th>
					<th>내용</th>
					<th>별점</th>
					<th>작성일</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody id="insert">
			<!-- 
				<tr>
					<td scope="col">1</td>
					<td scope="col">test</td>
					<td scope="col">10</td>
					<td scope="col"><a href="admin_review_view.do">content</a></td>
					<td scope="col">test@test</td>
					<td scope="col">20230126</td>
					<td scope="col"><input type="button" value="삭제" data-bs-toggle="modal" data-bs-target="#dmodal" /></td>
				</tr>
			 -->
			</tbody>
		</table>
	</div>
	

	<!-- Modal -->
	<div class="modal fade" id="dModal" tabindex="-1"
		aria-labelledby="dModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
						title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">  ddd</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<!-- paging -->
	<div class="container mb-4 text-center" id="insertPagging">
	</div>
	<!-- 
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
	 -->

	<!-- footer -->
	<%@ include file="../include/footer1.jsp" %>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>