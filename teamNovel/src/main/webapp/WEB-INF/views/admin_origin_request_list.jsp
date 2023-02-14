<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.admin_origin_requestTO"%>
<%@page import="com.example.model.admin_RQPagingTO"%>
<%@page import="java.util.ArrayList"%>

<%

admin_RQPagingTO Lists = (admin_RQPagingTO) request.getAttribute("Lists");

int cpage = Lists.getCpage();
int recordPerPage = Lists.getRecordPerPage();

int totalPage = Lists.getTotalPage();
int totalRecord = Lists.getTotalRecord();
	
int startBlock = Lists.getStartBlock();
int endBlock = Lists.getEndBlock();
int blockPerPage = Lists.getBlockPerPage();


ArrayList<admin_origin_requestTO> requestLists = Lists.getRequestLists();

StringBuilder sbHtml = new StringBuilder();
	
	for( admin_origin_requestTO to : requestLists ){
		sbHtml.append("<tr>");
		sbHtml.append("<td>" + to.getRequest_seq() + "</td>");
		sbHtml.append("<td>" + to.getRequest_category() + "</td>");
		sbHtml.append("<td>" + to.getRequest_title() + "</td>");
		sbHtml.append("<td>" + to.getUser_email() + "</td>");
		sbHtml.append("<td><input type='button' value='완료' onClick='#'>");
		sbHtml.append("<input type='button' value='삭제' onClick='location.href=\"admin_origin_request_delete_ok.do?seq=" + to.getRequest_seq() + "\"'></td>");
		sbHtml.append("</tr>");
		}


	StringBuilder pagehtml = new StringBuilder();

	String html = "";

	html += "<nav aria-label='Page navigation example'>";
	html += "<ul class='pagination justify-content-center'>";

	if (cpage == 1) {
		html += "<li class='page-item disabled'><a class='page-link'>Previous</a></li>";
	} else {
		html += "<li class='page-item'><a href='./admin_origin_request_list.do?cpage=" + (cpage - 1)
		+ "' class='goBackPage page-link'>Previous</a></li>";
	}

	for (int i = startBlock; i <= endBlock; i++) {
		if (cpage == i) {
			html += "	<li class='page-item disabled'><a class='page-link'>" + i + "</a></li>";
		} else {
			html += "	<li class='page-item'><a href='./admin_origin_request_list.do?cpage=" + i
			+ "' class='goPage page-link' data-page='' + i +  ''>" + i + "</a></li>";
		}
	}

	if (cpage == totalPage) {
		html += "<li class='page-item disabled'><a class='page-link'>Next</a></li>";
	} else {
		html += "<li class='page-item'><a href='./admin_origin_request_list.do?cpage=" + (cpage + 1)
		+ "' class='goNextPage page-link'>Next</a></li>";
	}

	html += "</ul>";
	html += "</nav>";

	pagehtml.append(html);
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
.nav-scroller {
	border: 1px solid black;
}

body {
	background-color: rgb(200, 200, 200);
}
</style>
<script type="text/javascript">
$(document).ready(function() {

});

$().ready(function () {
    $("#confirmStart").click(function () {
        Swal.fire({
            title: '요청 삭제',
            text: "삭제된 요청은 복구할 수 없습니다. 정말 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '삭제되었습니다.',
                )
            }
        })
    });
});
</script>
</head>
<body>

<!-- header -->
	<%@ include file="../include/header2.jsp" %>
	
	<!-- 본문 -->
	<div class="container w-75">
		<h2>요청 리스트</h2>
		<div class="table-responsive">
		<table class="table table-striped table-sm  table-bordered">
			<thead class="text-center">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">카테고리</th>
					<th scope="col">작품명</th>
					<th scope="col">아이디</th>
					<th scope="col">기능</th>
				</tr>
			</thead>
			<tbody class="text-center">
			<%=sbHtml %>
			</tbody>
		</table>
		</div>

		<div>
			<%=pagehtml%>
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