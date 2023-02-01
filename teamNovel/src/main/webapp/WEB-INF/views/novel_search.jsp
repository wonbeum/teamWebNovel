<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>novel_search</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<style type="text/css">
</style>
<script type="text/javascript" src="./js/jquery-3.6.1.min.js"></script>

<body>
	<div class="container">
		<header class="blog-header lh-1 py-3">
			<div
				class="row flex-nowrap justify-content-between align-items-center">

				<div class="col-4 pt-1">
					<a class="link-secondary" href="./main.do">사이트 로고</a>
				</div>
				<button type="button" class="btn-close" aria-label="Close"></button>

			</div>
		</header>
	</div>
	<div class="d-flex align-items-center">
		<div class="w-75 p-100">
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요"
					aria-describedby="button-addon">
				<button class="btn btn-outline-secondary" type="button"
					id="searchbtn">검색</button>
			</div>
		</div>
	</div>

	<div class="container text-center">
		<div class="row">
			<div class="col">
				<h3>장르</h3>
				<p>
					<a href="#">로맨스</a>
				</p>
				<p>
					<a href="#">로맨스 판타지</a>
				</p>
				<p>
					<a href="#">판타지</a>
				</p>
			</div>
			<div class="col">
				<h3>커뮤니티</h3>
				<p>
					<a href="#">인기글</a>
				</p>
			</div>
			<div class="col">
				<h3>원작 소설 찾기</h3>
				<p>
					<a href="#">웹툰</a>
				</p>
				<p>
					<a href="#">드라마</a>
				</p>
				<p>
					<a href="#">영화</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
