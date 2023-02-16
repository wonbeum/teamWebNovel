<%@page import="com.example.model.admin_userPagingTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.userInfoTO"%>
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
.nav-scroller {
	border: 1px solid black;
}

#searchform{
	margin-bottom: 20px;
}

body {
	background-color: rgb(200, 200, 200);
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

#pagehtml{
	text-align: center;
}
</style>
<script type="text/javascript">

function memberList( url , page, search ){
	$.ajax({
		url : url,
		type : 'get',
		dataType : 'json',
		data : {
			'cpage' : page,
			'search' : search
		},
		success : function(jsonData){

			let cpage = jsonData[0].cpage;
			let recordPerPage = jsonData[0].recordPerPage;
			let blockPerPage = jsonData[0].blockPerPage;
			let totalPage = jsonData[0].totalPage;
			let totalRecord = jsonData[0].totalRecord;
			let startBlock = jsonData[0].startBlock;
			let endBlock = jsonData[0].endBlock;
			
			$('#tbodyhtml').html('');
			let list = '';
			for( let i = 0; i < jsonData[0].userLists.length ; i++ ){
				list += "";
				list += "<tr>";
				list += "		<td name='email'>"+ jsonData[0].userLists[i].user_email + "</td>";
				list += "		<td>" + jsonData[0].userLists[i].user_nickname + "</td>";
				list += "		<td>" + jsonData[0].userLists[i].user_gender + "</td>";
				list += "		<td>" + jsonData[0].userLists[i].user_birth + "</td>";
				list += "		<td>" + jsonData[0].userLists[i].user_cdate + "</td>";
				list += "		<td><input type='button' value='상세보기' onClick=\"location.href='./admin_member_view.do?email=" + jsonData[0].userLists[i].user_email + "'\"><input";
				list += "			type='submit' value='삭제' class='deletebutton' data-email='" + jsonData[0].userLists[i].user_email + "'></td>";
				list += "	</tr>";
			}

			$('#tbodyhtml').html(list);	
			// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
			
			$('#pagehtml').html('');
			
			let page = '';
			page += `
				<div id="pageGroup" style="display: inline-block;">
					<ul class="pagination" id="pagging">`;
					
			if( cpage == 1 ){
				page += `<li id="pageLi" class="page-item disabled"><a class="page-link">&laquo;</a></li>`;
			} else {
				page += `<li id="pageLi" class="page-item"><a class="goBackPage page-link">&laquo;</a></li>`;
			}
			
			for( let i = startBlock ; i <= endBlock ; i ++ ){
				if( cpage == i ){
					page += '	<li id="pageLi" class="page-item disabled"><a class="page-link">' + i + '</a></li>';
				} else {
					page += '	<li id="pageLi" class="page-item"><a class="goPage page-link" data-page="' + i +  '">' + i + '</a></li>';
				}
			}
			
			if( cpage == totalPage ){
				page += `<li id="pageLi" class="page-item disabled"><a class="page-link">&raquo;</a></li>`;
			} else {
				page += `<li id="pageLi" class="page-item"><a class="goNextPage page-link">&raquo;</a></li>`;
			}
			
			page += `
					</ul>
				</div>`;
	
			$('#pagehtml').html(page);		
			
			$(".goBackPage").click(function(){
		      	let page = cpage - 1;
		       	novelLists( url, page , search );
	        });
			
			$(".goPage").click(function(){
				page = $(this).attr("data-page");
		       	novelLists( url, page , search );
			});

			$(".goNextPage").click(function(){
		      	let page = cpage + 1;
		       	novelLists( url, page , search );
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
		            	let email = $(this).attr("data-email");
		                location.href = "./admin_member_delete_ok.do?email="+email;
		            }
		        })
		    });
		},
		error : function(err) {
			console.log( err.status );
		}
	});
};

$(document).ready(function() {

    let url = 'admin_member_lists';
    let page = 1 ;
    memberList( url, page );
		// 검색
	$('#searchbtn').click(function(){
		let keyword = $('#input_keyword').val().trim();
	
		if($('#serch_category').val()=='닉네임') {
			memberList( 'adminsearch_nickname' , 1 , keyword )
		} else if($('#serch_category').val()=='이메일') {
			memberList( 'adminsearch_email' , 1 , keyword )
		} 
		
	});
    
});
</script>
</head>
<body>

	<!-- header -->
	<jsp:include page="../include/header2.jsp"></jsp:include>

	<!-- 본문 -->
	<div class="container w-75">
		<h2>회원 리스트</h2>

		<form class="row g-3 justify-content-md-center mt-4" id="searchform">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<h5>회원 리스트</h5>
			</div>
			<div class="col-md-1">
			</div>
			<div class="col-md-3">
				<select class="form-select" id="serch_category">
					<option selected>닉네임</option>
					<option>이메일</option>
				</select>
			</div>
			<div class="col-md-4">
				<input type="text" class="form-control" id="input_keyword">
			</div>
			<div class="col-md-2">
				<button class="btn btn-primary" type="button" id="searchbtn">검색하기</button>
			</div>
		</form>

		<div class="table-responsive">
			<table class="table table-hover">
				<thead class="table-light">
					<tr>
						<th scope="col">이메일</th>
						<th scope="col">닉네임</th>
						<th scope="col">성별</th>
						<th scope="col">생일</th>
						<th scope="col">가입일</th>
						<th scope="col">기능</th>
					</tr>
				</thead>
				<tbody id="tbodyhtml">
				</tbody>
			</table>
		</div>

		<div id="pagehtml">
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>