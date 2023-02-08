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
<title>Insert title here</title>
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
	src: url("/font/AppleSDGothicNeoR.ttf");
	font-family: "AppleSDGothicNeoEB";
}

#nav-button {
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
	margin: 0 0 0 87px;
	padding: 8px 45px 10px 45px;
	border-radius: 15px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #000;
	color: #fff;
	font-family: AppleSDGothicNeoEB;
	font-size: 20px;
}

#category {
	width: 84px;
	height: 28px;
	padding: 4px 27px 4px 28px;
	border-radius: 14px;
	background-color: #ffb26c;
	font-family: AppleSDGothicNeoSB;
	font-size: 17px;
	color: #fff;
	font-size: 17px;
}
#button-search {
  	height: 45px;
  	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
  	background-color: #fff;
  	font-family: AppleSDGothicNeoEB;
  	font-size: 20px;
  	font-weight: 800;
  	color: #999;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
		$('#wbtn').click(function(){
			if(${signIn == null}) {
				alert("로그인후 글쓰기가 가능합니다.");
				return false;
			}
		});	
		
	// 전체 리스트 가져오기
	$.ajax({
		url : 'BoardListAjax.do',
		type : 'get',
		dataType : 'json',
		success : function(jsonData){
			//console.log("성공");
			$('#insertTotalList').html('');
			
			for(let i=0; i<jsonData.length; i++){	
				tr = `
					<tr> 
					<td><a id="category">\${jsonData[i].free_category}</a></td>
					<td class='text-start'><a id="td_link" href='board_view.do?seq=\${jsonData[i].free_seq}'>
						\${jsonData[i].free_subject}</a></td>
					<td>\${jsonData[i].user_nickname}</td>
					<td>\${jsonData[i].free_date}</td>
					<td>\${jsonData[i].free_hit}</td>
					<td>\${jsonData[i].free_comment}</td>
					<td>\${jsonData[i].free_like}</td>
					</tr>
				`
				$('#insertTotalList').append(tr);
			}
		},
		error : function(e) {
			alert("error !");
		}
	});
	
	// 가져오기
	NoticeAjax();
	BestListAjax();
	

});
	// 공지 가져오기
	function NoticeAjax(){
		$.ajax({
			url : 'NoticeListAjax.do',
			type : 'get',
			dataType : 'json',
			success : function(jsonData){
				//console.log("성공");
				
				$('#insertNoticeList').html('');
				
				for(let i=0; i<jsonData.length; i++){	
					tr = `
						<tr> 
						<td><a id="category">\${jsonData[i].free_category}</a></td>
						<td class='text-start'><a id="td_link" href='board_view.do?seq=\${jsonData[i].free_seq}'>
							\${jsonData[i].free_subject}</a></td>
						<td>\${jsonData[i].user_nickname}</td>
						<td>\${jsonData[i].free_date}</td>
						<td>\${jsonData[i].free_hit}</td>
						<td>\${jsonData[i].free_comment}</td>
						<td>\${jsonData[i].free_like}</td>
						</tr>
					`
					$('#insertNoticeList').append(tr);
				}
				
			},
			error : function(e) {
				alert("error !");
			}
		});
	}
	
	// 인기글 가져오기
	function BestListAjax(){
		$.ajax({
			url : 'BestListAjax.do',
			type : 'get',
			dataType : 'json',
			success : function(jsonData){
				//console.log("성공");
				
				$('#insertBestList').html('');
				
				for(let i=0; i<jsonData.length; i++){	
					tr = `
						<tr> 
						<td><a id="category">\${jsonData[i].free_category}</a></td>
						<td class='text-start'><a id="td_link" href='board_view.do?seq=\${jsonData[i].free_seq}'>
							\${jsonData[i].free_subject}</a></td>
						<td>\${jsonData[i].user_nickname}</td>
						<td>\${jsonData[i].free_date}</td>
						<td>\${jsonData[i].free_hit}</td>
						<td>\${jsonData[i].free_comment}</td>
						<td>\${jsonData[i].free_like}</td>
						</tr>
					`
					$('#insertBestList').append(tr);
				}
				
			},
			error : function(e) {
				alert("error !");
			}
		});
	}
	
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
					data-bs-target="#total" href="#total" id="nav-button">전체글</a> <a
					class="nav-link" data-bs-toggle="tab" data-bs-target="#best"
					href="#best" id="nav-button">인기글</a> <a class="nav-link"
					data-bs-toggle="tab" data-bs-target="#notice" href="#notice"
					id="nav-button">공지</a>
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
				<div id="best" class="container tab-pane fade ">
					<div class="container">
						<table class="table table-hover mt-3">
							<thead class="text-center">
								<tr>
									<th scope="col" width="12%">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col" width="13%">작성자</th>
									<th scope="col" width="13%">날짜</th>
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

				<div id="notice" class="container tab-pane fade">
					<div class="container">
						<table class="table table-hover mt-3">
							<thead class="text-center">
								<tr>
									<th scope="col" width="12%">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col" width="13%">작성자</th>
									<th scope="col" width="13%">날짜</th>
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
		<div class="container" style="width: 77.1%; height: 45px">
			<div class="row" style="margin-bottom: 0px;">
				<div class="col-auto me-auto">
					<div class="input-group mb-3" id="button-search">
						<input type="text" class="form-control"
							placeholder="작성자 입력">
						<button class="btn btn-outline-secondary" type="button">검색</button>
					</div>
				</div>
				<div class="col-auto">
					<a class="btn btn-outline-dark" href="./board_write.do" id="wbtn"
						role="button">글쓰기</a>
				</div>
			</div>
		</div>
		<div style="height: 200px"></div>
	</div>


	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>