<%@page import="com.example.model.admin_userPagingTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.example.model.userInfoTO"%>
<%@page import="java.util.ArrayList"%>

<%
admin_userPagingTO Lists = (admin_userPagingTO) request.getAttribute("Lists");

int cpage = Lists.getCpage();
int recordPerPage = Lists.getRecordPerPage();

int totalPage = Lists.getTotalPage();
int totalRecord = Lists.getTotalRecord();

int startBlock = Lists.getStartBlock();
int endBlock = Lists.getEndBlock();
int blockPerPage = Lists.getBlockPerPage();

ArrayList<userInfoTO> userLists = Lists.getUserLists();

StringBuilder sbHtml = new StringBuilder();

for (userInfoTO to : userLists) {
	sbHtml.append("<tr>");
	sbHtml.append("		<td><input name='email' value='" + to.getUser_email() + "' disabled/></td>");
	sbHtml.append("		<td><input size='15' value='" + to.getUser_nickname() + "' disabled/></td>");
	sbHtml.append("		<td><input size='7' value='" + to.getUser_gender() + "' disabled/></td>");
	sbHtml.append("		<td><input value='" + to.getUser_birth() + "' disabled/></td>");
	sbHtml.append("		<td><input value='" + to.getUser_cdate() + "' disabled/></td>");
	sbHtml.append("		<td><input type='button' value='상세보기' onClick=\"location.href='./admin_member_view.do?email="
	+ to.getUser_email() + "'\"><input");
	sbHtml.append(
	"			type='submit' value='삭제' class='deletebutton' data-email='" + to.getUser_email() + "'></td>");
	sbHtml.append("	</tr>");
}

StringBuilder pagehtml = new StringBuilder();

String html = "";

html += "<nav aria-label='Page navigation example'>";
html += "<ul class='pagination justify-content-center'>";

if (cpage == 1) {
	html += "<li class='page-item disabled'><a class='page-link'>Previous</a></li>";
} else {
	html += "<li class='page-item'><a href='./admin_member_list.do?cpage=" + (cpage - 1)
	+ "' class='goBackPage page-link'>Previous</a></li>";
}

for (int i = startBlock; i <= endBlock; i++) {
	if (cpage == i) {
		html += "	<li class='page-item disabled'><a class='page-link'>" + i + "</a></li>";
	} else {
		html += "	<li class='page-item'><a href='./admin_member_list.do?cpage=" + i
		+ "' class='goPage page-link' data-page='' + i +  ''>" + i + "</a></li>";
	}
}

if (cpage == totalPage) {
	html += "<li class='page-item disabled'><a class='page-link'>Next</a></li>";
} else {
	html += "<li class='page-item'><a href='./admin_member_list.do?cpage=" + (cpage + 1)
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
});
</script>
</head>
<body>

	<!-- header -->
	<jsp:include page="../include/header2.jsp"></jsp:include>

	<!-- 본문 -->
	<div class="container w-75">
		<h2>회원 리스트</h2>
		<div>
			<table border="1" align="center">
				<tr>
					<td>조건 검색</td>
					<td>
						<form action="#" method="get" name="frm1">
							<select name="search">
								<option value="nickname">닉네임</option>
								<option value="email">이메일</option>
							</select>
						</form>

					</td>
					<td>
						<form action="" method="get">
							<input type="text" /> <input type="submit" value="검색" />
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div class="table-responsive">
			<table class="table table-striped table-sm  table-bordered">
				<thead>
					<tr>
						<th scope="col">이메일</th>
						<th scope="col">닉네임</th>
						<th scope="col">성별</th>
						<th scope="col">생일</th>
						<th scope="col">가입일</th>
						<th scope="col">기능</th>
					</tr>
				</thead>
				<tbody>

					<%=sbHtml%>
					<!--  
				<tr>
					<td><input type="checkbox" name="user_check"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><input type="button" value="상세보기"><input
						type="button" value="삭제" class="confirmStart"></td>
				</tr>
				-->
				</tbody>
			</table>
		</div>

		<div>
			<%=pagehtml%>
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