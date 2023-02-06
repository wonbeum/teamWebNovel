<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
@font-face {
	src: url("/font/AppleSDGothicNeoR.ttf");
	font-family: 'AppleSDGothicNeoR';
}

.footer {
	height: 190px;
	background-color: #000;
}

.nav-link {
	font-family: AppleSDGothicNeoR;
	font-size: 18px;
	font-weight: 500;
}

.text-muted { -
	-bs-text-opacity: 1;
	color: #fff !important;
}
</style>

</head>
<body>

	<!-- footer -->
	<footer class="mt-10">
		<div class="footer">
			<div class="text-center" style="height: 67px; padding-top: 25px;">
				<a href="./main.do"><img src="/images/footerLogo.png"
					style="height: 42px; padding-top: 0px; margin-bottom: 25px; width: 196px;"></a>
			</div>
			<div>
				<ul class="nav justify-content-center pb-2"
					style="margin-top: 21px;padding-bottom: 0px;margin-bottom: 0px;">
					<li class="nav-item"><a href="./rank_list.do"
						class="nav-link px-4 text-muted">랭킹</a></li>
					<li class="nav-item"><a href="./review_list.do"
						class="nav-link px-4 text-muted">리뷰</a></li>
					<li class="nav-item"><a href="./novel_list.do"
						class="nav-link px-4 text-muted">웹소설</a></li>
					<li class="nav-item"><a href="./board_list.do"
						class="nav-link px-4 text-muted">커뮤니티</a></li>
					<li class="nav-item"><a href="./origin_list.do"
						class="nav-link px-4 text-muted">원작 소설 찾기</a></li>
				</ul>
			</div>
			<div>
			<p class="text-center text-muted">&copy; 2023 개발 못하면 죽는 병, Inc</p>
			</div>
		</div>
	</footer>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>