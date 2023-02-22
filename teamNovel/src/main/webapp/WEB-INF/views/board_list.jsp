<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gathervel</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}

@font-face {
	src: url("/font/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoM.ttf");
	font-family: "AppleSDGothicNeoM";
}

@font-face {
	src: url("/font/AppleSDGothicNeoSB.ttf");
	font-family: "AppleSDGothicNeoSB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoR.ttf");
	font-family: "AppleSDGothicNeoR";
}

@font-face {
	src: url("/font/AppleSDGothicNeoEB.ttf");
	font-family: "AppleSDGothicNeoEB";
}

#nav-button1, #nav-button2, #nav-button3 {
	width: 120px;
	height: 40px;
	margin: 16px;
	margin-top: 51px;
	border-radius: 20px;
	border: solid 2px #ffb26b;
	background-color: #fff;
	padding-top: 6px;
	font-family: AppleSDGothicNeoR;
	font-size: 18px;
	font-weight: 800;
	font-style: normal;
	text-decoration-line: none;
	text-align: center;
	color: #ffb26c;
}

#nav_btn .nav-link.active {
	color: #fff;
	background-color: #ffb26c;
}

#rouded_box {
	width: 77.1%;
	height: 52.2%;
	margin: 0 30px;
	padding: 47px 22.5px 46px 22.5px;
	border-radius: 20px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
	display: inline-block;
}

.background {
	text-align: center;
	background-color: #f8f8fb;
	height: 100%;
}

#thead {
	display: inline-block;
	margin-top: 50px;
}

td {
	font-family: AppleSDGothicNeoM;
	color: rgba(0, 0, 0, 0.4);
	font-size: 20px;
}

th {
	font-family: AppleSDGothicNeoM;
	color: #5b5b5b;
	font-size: 20px;
}

#td_link {
	color: #5b5b5b;
	font-family: AppleSDGothicNeoSB;
	text-decoration: none;
	font-size: 20px;
}

#searchbtn {
	color: #5b5b5b;
}

#wbtn {
	width: 155px;
	height: 45px;
	margin: 0 0 0 auto;
	padding: 8px 45px 10px 45px;
	border-radius: 15px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #000;
	color: #fff;
	font-family: AppleSDGothicNeoEB;
	font-size: 20px;
	float: right;
}

#category {
	width: 83px;
	height: 28px;
	padding: 4px 17px 4px 17px;
	border-radius: 14px;
	background-color: #ffb26c;
	font-family: AppleSDGothicNeoSB;
	font-size: 17px;
	color: #fff;
}

#searchbox {
	max-width: 405px;
	width: 100%;
	height: 45px;
	padding: 11px 20px 10px 20px;
	border-radius: 15px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
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

#swal2-title {
	font-family: AppleSDGothicNeoR;
    font-size: 20px;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
//리스트 가져오기
function BoardListAjax(url, page, insert, keyword){
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
				
			$(insert).html('');
			
			let ajaxHtml = '';
			
			for(let i=0; i<jsonData[0].boardLists.length; i++){	
				ajaxHtml += `
						<tr> 
						<td nowrap width="80px"><a id="category">\${jsonData[0].boardLists[i].free_category}</a></td>
						<td class='text-start'><a id="td_link" href="board_view.do?seq=\${jsonData[0].boardLists[i].free_seq}" class="d-inline-block text-truncate" style="max-width: 230px;">
							\${jsonData[0].boardLists[i].free_subject}</a></td>
						<td>\${jsonData[0].boardLists[i].user_nickname}</td>
						<td>\${jsonData[0].boardLists[i].free_date}</td>
						<td>\${jsonData[0].boardLists[i].free_hit}</td>
						<td>\${jsonData[0].boardLists[i].free_comment}</td>
						<td>\${jsonData[0].boardLists[i].free_like}</td>
						</tr>
					`;
				}
			
				$(insert).append(ajaxHtml);
				
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
				      	BoardListAjax( url, page, insert, keyword);
			        });
					
					$(".goPage").click(function(){
						page = $(this).attr("data-page");
						BoardListAjax( url, page, insert, keyword );
					});

					$(".goNextPage").click(function(){
				      	page = (cpage + 1);
				      	BoardListAjax( url, page, insert, keyword );
			        });
		},
		error : function(e) {
			console.log( e.status );
		}
	});
};


//실행
$(document).ready(function(){
	$('#wbtn').click(function(){
		if(${signIn == null}) {
			Swal.fire("로그인후 글쓰기가 가능합니다.");
			return false;
		}
	});	
		
	
		// 가져오기
		let url = 'BoardListAjax.do';
		let page = 1;
		let insert = '#insertTotalList';
		BoardListAjax( url, page, insert );
	
		$('#nav-button1').click(function(){
			BoardListAjax( 'BoardListAjax.do', 1 , '#insertTotalList','');
		});
		
		// 인기글
		$('#nav-button2').click(function(){
			BoardListAjax( 'BestListAjax.do' , 1 ,'#insertBestList','');
		});
		
		// 공지
		$('#nav-button3').click(function(){
			BoardListAjax('NoticeListAjax.do', 1 , '#insertNoticeList','');
		});
		
		
		// 검색
		$('#searchbtn').click(function(){
			let keyword = $('#input_keyword').val().trim();
			if(keyword.length<2){
				Swal.fire({
					  icon: 'info',
					  text: '두 글자이상 입력해주세요.'
				});
			} else {
				BoardListAjax('SearchListAjax.do', 1 , '#insertTotalList',keyword);
			}
			//console.log(keyword);
			$('#input_keyword').val('');
		});
		
});



	
</script>
</head>
<body>

	<!-- header -->
	<jsp:include page="../include/header1.jsp"></jsp:include>

	<!-- main -->

	<div class="background">
		<!-- Nav pills -->
		<div class="container d-flex justify-content-center">
			<nav class="nav nav-pills nav-fill justify-content-center"
				role="tablist" id="nav_btn">
				<a class="nav-link active" data-bs-toggle="tab"
					data-bs-target="#total" href="#total" id="nav-button1">전체글</a> <a
					class="nav-link" data-bs-toggle="tab" data-bs-target="#best"
					href="#best" id="nav-button2">인기글</a> <a class="nav-link"
					data-bs-toggle="tab" data-bs-target="#notice" href="#notice"
					id="nav-button3">공지</a>
			</nav>
		</div>
		<div class="container justify-content-center" id="rouded_box"
			style="margin-top: 20px; margin-bottom: 30px; padding-top: 20px; padding-bottom: 20px;">
			<!-- Tab panes -->
			<div class="tab-content">
				<div id="total" class="tab-pane active">
					<div class="container">
						<table class="table table-hover mt-3">
							<thead class="text-center">
								<tr>
									<th scope="col" width="17%">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col" width="13%">작성자</th>
									<th scope="col" width="15%">날짜</th>
									<th scope="col" width="8%">조회</th>
									<th scope="col" width="8%">댓글</th>
									<th scope="col" width="8%">추천</th>
								</tr>
							</thead>
							<tbody id="insertTotalList">
								<!-- 
				<tr>
					<th scope="col">1</th>
					<td>공지</td>
      				<td class="text-start"><a href="board_view.jsp">title</td>
      				<td>writer</td>
      				<td>23.01.26</td>
      				<td>1</td>
      				<td>10</td>
				</tr>	
			 -->
							</tbody>
						</table>
					</div>
				</div>
				<div id="best" class="tab-pane fade ">
					<div class="container">
						<table class="table table-hover mt-3">
							<thead class="text-center">
								<tr>
									<th scope="col" width="17%">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col" width="13%">작성자</th>
									<th scope="col" width="15%">날짜</th>
									<th scope="col" width="8%">조회</th>
									<th scope="col" width="8%">댓글</th>
									<th scope="col" width="8%">추천</th>
								</tr>
							</thead>
							<tbody id="insertBestList">

							</tbody>
						</table>
					</div>
				</div>

				<div id="notice" class="tab-pane fade">
					<div class="container">
						<table class="table table-hover mt-3">
							<thead class="text-center">
								<tr>
									<th scope="col" width="17%">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col" width="13%">작성자</th>
									<th scope="col" width="15%">날짜</th>
									<th scope="col" width="8%">조회</th>
									<th scope="col" width="8%">댓글</th>
									<th scope="col" width="8%">추천</th>
								</tr>
							</thead>
							<tbody id="insertNoticeList">

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- 글쓰기, 검색 -->
		<div class="container"
			style="width: 77.1%; height: 45px; padding-left: 0px; padding-right: 0px;">
			<div class="row" style="margin-bottom: 0px; padding-right: 0px; display: flex ">
				<div class="col-auto col-md-6 me-auto col-sm-6">
					<div id="searchbox" class="text-start">
						<input type="text" placeholder="2자 이상 작성자/제목 입력" id="input_keyword"
							style="border: none; outline: none; max-width: 75%; font-family: AppleSDGothicNeoSB; font-size: 17px;">
						<a type="button" id="searchbtn"
							style="font-family: AppleSDGothicNeoB; font-size: 20px; color: #999; float: right;">검색</a>
					</div>
				</div>
				<div class="col-auto col-md-6 col-sm-6">
					<a class="btn btn-outline-dark " href="./board_write.do" id="wbtn"
						role="button">글쓰기</a>
				</div>
			</div>
		</div>
		<!-- 페이징 -->
		<div id="insertPagging">
		<!-- 
		<div style="display: inline-block;" id="pageGroup">
				<ul class="pagination" id="pagging">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
		</div>
		 -->
		</div>
		<div style="height: 100px"></div>
	</div>


	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>