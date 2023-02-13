<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.model.novel_detailTO"%>
<%
novel_detailTO to = (novel_detailTO) request.getAttribute("to");
String novel_genre = to.getNovel_genre();
String novel_title = to.getNovel_title();
String novel_writer = to.getNovel_writer();
String novel_content = to.getNovel_content();
String novel_img = to.getNovel_img();
String user_name = to.getUser_nickname();
String review_star_grade = to.getReview_star_grade();
String kakao = to.getNovel_kakao();
String ridi = to.getNovel_ridi();
String seriese = to.getNovel_series();
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

.nav-scroller {
	border: 1px solid black;
}

.-\34 9 {
	width: 465px;
	height: 872px;
	margin: 0 41px 172px 0;
	padding: 28px 26px 40px;
	border-radius: 20px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
}

#novelimg {
	margin: 0 0 18px;
	border-radius: 12px;
	background-color: #000;
}

.genre {
	width: 200px;
	height: 20px;
	margin: 18px 304px 3px 3px;
	font-family: AppleSDGothicNeo;
	font-size: 17px;
	font-weight: 300;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	text-align: left;
	color: #9b9b9b;
}

.-\32 {
	width: 100px;
	height: 19px;
	margin: 19px 0 3px 154px;
	font-family: AppleSDGothicNeo;
	font-size: 16px;
	font-weight: 300;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	text-align: left;
	color: #707071;
}

#title {
	width: 200px;
	height: 28px;
	margin: 3px 253px 17.5px 3px;
	font-family: AppleSDGothicNeo;
	font-size: 23px;
	font-weight: 600;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	text-align: left;
	color: #000;
}

.\- {
	width: 179px;
	height: 23px;
	margin: 38.5px 154px 40px 3px;
	object-fit: contain;
	font-family: AppleSDGothicNeo;
	font-size: 19px;
	font-weight: 500;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	text-align: left;
	color: rgba(148, 148, 148, 0.65);
}

#novelinfo {
	width: 300px;
	height: 100%;
	margin: 0 41px 172px 50px;
	padding: 28px 26px 40px;
	border-radius: 20px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
}

.-\35 3 {
	width: 972px;
	height: 315px;
	margin: 30px 0 31px 42px;
	padding: 20px 31px 20px 35px;
	border-radius: 20px;
	background-color: #ffb26b;
}

.form-control {
	width: 902px;
	height: 197px;
	margin: 24px 4px 0 0;
	padding: 21px 711px 152px 25px;
	border-radius: 20px;
	border: solid 1px #ebebeb;
	background-color: #fff;
}

#avrg {
	width: 972px;
	height: 227px;
	margin: 0 0 30px 42px;
	padding: 42px 1.5px 38px;
	border-radius: 20px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
}

.checked {
	color: orange;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	// 별점찍기
	var count;

	function starmark(item) {
		count = item.id[0];
		sessionStorage.starRating = count;
		var subid = item.id.substring(1);
		for (var i = 0; i < 5; i++) {
			if (i < count) {
				document.getElementById((i + 1) + subid).style.color = "orange";
			} else {
				document.getElementById((i + 1) + subid).style.color = "black";
			}
			
		}
	};

	function result() {
		alert("Rating : " + count + "\nReview : "
				+ document.getElementById("comment").value);
	};
	
	function reviewarea(novel_title) {
		
		console.log(novel_title);
		$.ajax({
			url : 'reviewlist.do',
			type : 'get',
			data : {
				"novel_title" : novel_title
				
			},
			dataType : 'json',
			success : function(jsonData){
			
				console.log(jsonData);
			
					$('#reviewarea').html('');
					
					let div = '';
					
					let avg = 0;
					for(let i=0; i<jsonData.length; i++){
						avg += parseInt(jsonData[i].review_star_grade);
					}
					avg = (avg/ parseInt(jsonData.length) ).toFixed(2);
					
					for(let i=0; i<jsonData.length; i++){
						div+=`
						<a href="#"
							class="list-group-item list-group-item-action d-flex gap-3 py-3"
							aria-current="true">
							<div class="d-flex gap-2 w-100 justify-content-between">
								<div>
									<h6 class="mb-0">\${jsonData[i].user_nickname}</h6>
									<p class="mb-0 opacity-75">\${jsonData[i].review_content}</p>
								</div>
								<small class="opacity-50 text-nowrap">\${jsonData[i].review_date}</small>
							</div>
						</a>
							`;
						$('#reviewarea').append(div);
						
						$('#avg').html('');
						
						let div2 = '';
						
							div2+=`\${avg}★ 평균별점
								`;
								
							
								if( avg >= 4 ){
									for( let j = 1 ; j <= avg ;  j++ ){
									
										div2+=`<span style="font-size: 40px;" class="fa fa-star checked"></span>`;
										
									}
								} else if ( avg >= 3 ) {
									for( let j = 1 ; j <= avg ;  j++ ){
										
										div2+=`<span style="font-size: 40px;" class="fa fa-star checked"></span>`;
										
									}
								} else if ( avg >=2 ){
									for( let j = 1 ; j <=  avg;  j++ ){
										
										div2+=`<span style="font-size: 40px;" class="fa fa-star checked"></span>`;
										
									}
								} else if ( avg >=1 ) {
									for( let j = 1 ; j <= avg ;  j++ ){
									div2+=`<span style="font-size: 40px;" class="fa fa-star checked"></span>`;
									}	
								}
								
						
								
							$('#avg').append(div2);
						}
			},
			error : function(e) {
				alert("error !");
			}
		});
};

	$(document).ready(function() {
		
		let novel_title = $('#title').attr('novel-title');
		//리뷰 작성
		$('#reviewbtn').click(function() {

			let review_content = document.getElementById('comment').value;
			let review_star_grade = count;

			console.log(${novel_title});
			console.log(review_content);
			console.log(review_star_grade);

			$.ajax({
				url : 'review_write.do',
				type : 'get',
				data : {
					"novel_title" : novel_title,
					"review_content" : review_content,
					"review_star_grade" : review_star_grade
				},
				dataType : 'json',
				success : function(jsonData) {
					$("#comment").val("");
					reviewarea(novel_title);
				},
				error : function(e) {
					alert("error !");
				}
			});
		});
		reviewarea(novel_title);
});

</script>
</head>
<body>

	<jsp:include page="../include/header1.jsp"></jsp:include>
<body>
	<!-- 본문 -->

	<hr class="my-5">
	<div class="row">

		<div class="col-sm-6 col-lg-4">
			<div class="card p-3" id="novelinfo">
				<img src="<%=novel_img%>" class="-\35 0" role="img" id="novelimg">

				<div class="card-body">
					<span class="genre"><%=novel_genre%></span> <span class="-\32 "><%=novel_writer%></span>
					<span class="title" id="title" novel-title="<%=novel_title%>"><%=novel_title%></span>
					<p class="\-"><%=novel_content%></p>
					<div class="-\34 9">
						<a href=""><button type="button" class="btn btn-warning">플랫폼
								이동</button></a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6 col-4">
			<div class="card p-3">
				<div class="p-3 mb-0">

					<p id="avg"></p>

				</div>
				<!-- 리뷰 별점 -->



			</div>
			<div class="-\35 3">
				<div class="card p-3">


					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label">별점을
							선택해주세요</label>
						<div class="container">
							<div class="rating-wrap">
								<div class="center">
									<span onmouseover="starmark(this)" onclick="starmark(this)"
										id="1one" style="font-size: 40px; cursor: pointer;"
										class="fa fa-star checked"></span> <span
										onmouseover="starmark(this)" onclick="starmark(this)"
										id="2one" style="font-size: 40px; cursor: pointer;"
										class="fa fa-star "></span> <span onmouseover="starmark(this)"
										onclick="starmark(this)" id="3one"
										style="font-size: 40px; cursor: pointer;" class="fa fa-star "></span>
									<span onmouseover="starmark(this)" onclick="starmark(this)"
										id="4one" style="font-size: 40px; cursor: pointer;"
										class="fa fa-star"></span> <span onmouseover="starmark(this)"
										onclick="starmark(this)" id="5one"
										style="font-size: 40px; cursor: pointer;" class="fa fa-star"></span>
									<br />
									<textarea style="margin-top: 5px;" class="form-control"
										rows="3" id="comment" placeholder="Enter your review"></textarea>

									<button onclick="result()" type="button"
										style="margin-top: 10px; margin-left: 5px;"
										class="btn btn-lg btn-warning" id="reviewbtn">리뷰등록</button>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<a>ReviewList</a> <span class="btn rounded-pill text-bg-warning">최신순</span>
			<span class="btn rounded-pill text-bg-warning">별점▲</span> <span
				class="btn rounded-pill text-bg-warning">별점▼</span>
			<div class="list-group w-auto" id="reviewarea">
				<!-- 
				<a href="#"
					class="list-group-item list-group-item-action d-flex gap-3 py-3"
					aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div>
							<h6 class="mb-0">닉네임</h6>
							<p class="mb-0 opacity-75">리뷰내용</p>
						</div>
						<small class="opacity-50 text-nowrap">작성날짜</small>
					</div>

				</a> <a href="#"
					class="list-group-item list-group-item-action d-flex gap-3 py-3"
					aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div>
							<h6 class="mb-0">닉네임</h6>
							<p class="mb-0 opacity-75">리뷰내용</p>
						</div>
						<small class="opacity-50 text-nowrap">작성날자</small>
					</div>
				</a>
				 -->
			</div>
		</div>


	</div>

</body>

<!-- footer -->
<jsp:include page="../include/footer1.jsp"></jsp:include>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</body>
</html>