<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>검색하기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<style type="text/css">
@font-face {
	src: url("/font/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoSB.ttf");
	font-family: "AppleSDGothicNeoSB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoR.ttf");
	font-family: "AppleSDGothicNeoR";
}


.wrapper {
	margin:auto;
	border-radius: 2px;
	height: 300px;
	width: 400px;
}

.input {
  background-color: transparent;
  border: none;
  border-bottom: 1px solid #CCC;
  color: #555;
  font-family: AppleSDGothicNeoSB;
  font-size: 25px;
  text-align: center;
  height: 50px;
  padding: 10px 0px;
  position: relative;
  width: 400px;
  top: 50%;
  &:focus {
    outline: none;    
  }
}

input::-webkit-input-placeholder {
  color: #AAA;
}

input:focus::-webkit-input-placeholder {
  color: #ffb26b;
}

.input:focus+.underline {
  transform: scale(1);
}

.underline {
  background-color: #ffb26b;
  display: inline-block;
  height: 2px;
  position: relative;
  top: 138px;
  -webkit-transform: scale(0, 1);
  transform: scale(0, 1);
  -webkit-transition: all 0.5s linear;
  transition: all 0.5s linear;
  width: 400px;
}

#siteLink{
	text-align:left;
	font-family: AppleSDGothicNeoSB;
	width: 1000px;
}

.col{
	position: relative;
    top: 30%;
    }

</style>
</head>
<body>
	<div class="container">
		<header class="blog-header lh-1 py-3">
			<div
				class="row flex-nowrap justify-content-between align-items-center">
				<div class="col-4 pt-1">
					<a class="link-secondary" href="./main.do">
					<img class="logoimg" src="../images/logo.png"
					srcset="../images/logo@2x.png 2x, ../images/logo@3x.png 3x"></a>
				</div>
				<a href="./main.do" button type="button"
				style="width: 45px; height: 45px; padding: 20px; border-radius: 25px; background-color:#ffb26b;" class="btn-close" aria-label="Close"></a>
			</div>
		</header>
	</div>
	
	<div class="container justify-content-center">
		<div class="wrapper">
    		<input class="input" placeholder="찾으시는 웹소설이 있으신가요?" type="text" >
		    <span class="underline"></span>
		</div>
		<div class="container text-center">
		<span style="font-family: AppleSDGothicNeoR; font-size: 18px;">검색어를 입력해보세요!</span>	
		</div>
	</div>
	
<!--
		<div class="w-75 p-100">
			<div class="input-group mb-3" style="margin-top: 238px; padding-top: 20px; padding-bottom: 20px;">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요"
					aria-describedby="button-addon">
				<button class="btn btn-outline-secondary" type="button"
					id="searchbtn">검색</button>
			</div>
		</div>
-->

	<div class="container" id="siteLink">
		<div class="row" style="height: 300px;">
			<div class="col">
				<h3>장르</h3>
				<p>
					<a href="./novel_list.do">로맨스</a>
				</p>
				<p>
					<a href="./novel_list.do">로맨스 판타지</a>
				</p>
				<p>
					<a href="./novel_list.do">판타지</a>
				</p>
			</div>
			<div class="col">
				<h3>커뮤니티</h3>
				<p>
					<a href="./board_list.do">전체글</a>
				</p>
			</div>
			<div class="col">
				<h3>원작 소설 찾기</h3>
				<p>
					<a href="./origin_list.do">웹툰</a>
				</p>
				<p>
					<a href="./origin_list.do">드라마</a>
				</p>
				<p>
					<a href="./origin_list.do">영화</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
