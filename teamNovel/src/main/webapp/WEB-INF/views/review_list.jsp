<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="com.example.model.reviewListTO"%>
<%
/*
reviewListTO to = (reviewListTO)request.getAttribute("to");

String novel_title = to.getNovel_title();
*/
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
#tab1, #tab2, #tab3, #tab4{
	width: 120px;
	height: 40px;
  	margin: 16px;
  	border-radius: 20px;
  	border: solid 2px #ffb26b;
  	background-color: #fff;
  	
  	font-family: AppleSDGothicNeoR;
	font-size: 18px;
	font-weight: 800;
  	font-style: normal;
  	text-align: center;
  	color: #ffb26c;
}

#review1 {
  width: 100;
  margin: 5px 10px 10px 1px;
  padding: 40px 40px 40px 40px;
  background-color: #f8f8fb;
  overflow:hidden;
}

#img{
	margin: 5px 2px 2px 1px;
  padding: 5px 5px 5px 5px;
	 width: 80%;
	height: 80%;
	  border-radius: 10px;
	  display: flex;
	}
#novelinfo{
	 width: 300px;
	  height: 90%;
	  margin: 19px 12px 8px 10px;
	  float: left;
}
#genre ,#writer {
  width: 200px;
  height: 19px;
  font-family: AppleSDGothicNeo;
  font-size: 16px;
  font-weight: 300;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #9b9b9b;
}

#title {
  
  font-family: AppleSDGothicNeo;
  font-size: 19px;
  font-weight: 600;
  text-align: left;
  color: #000;
}
#novelcontent {
margin: 19px 12px 8px 10px;
  width: 230px;
  height: 500px;
  font-family: AppleSDGothicNeo;
  font-size: 30px;
  font-weight: 500;
  font-stretch: normal;
  font-style: normal;
  line-height: 1.47;
  letter-spacing: normal;
  text-align: left;
  color: #5b5b5b;
  overflow: hidden;
}
#userreeview {
margin: 19px 12px 8px 10px;
  width: 480px;
  height: 290px;
  font-family: AppleSDGothicNeo;
  font-size: 15px;
  font-weight: 600;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #000;
}

#nickname {
  width: 150px;
  height: 23px;
  margin: 32px 11px 6px 5.5px;
  font-family: AppleSDGothicNeo;
  font-size: 15px;
  font-weight: 600;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #000;
}
#novelcontent {
  width: 250px;
  height: 116px;
  margin: 25px 4px 0 5.5px;
  font-family: AppleSDGothicNeo;
  font-size: 10px;
  font-weight: 500;
  font-stretch: normal;
  font-style: normal;
  line-height: 1.63;
  letter-spacing: normal;
  text-align: left;
  color: #5b5b5b;
}
.checked {
	color: orange;
}
#reviewarea{
width: 250px;
  height: 500px;
}

</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">


	
function reviewList( url, page ) {
	 //console.log("성공");
       $.ajax({
         url : url,
         type : 'get',
         dataType : 'json',
         data : {
       	'novel_title': document.getElementById('textinput').value,
       	'cpage'  : page
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
				
				$('#reviewall').html('');
				let div = '';
					for(let i=0; i<recordPerPage; i++){		
						let title = encodeURI(jsonData[0].reviewList[i].novel_title);
						
							div += `
								<div id="review1">
								<div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 g-2">
							`;
						
							div += `
								<div class="row g-0">
							
									<div class="col" >
									<div class="card-img">
										<a href="./novel_detail.do?novel_title=\${title}"> <img src="\${jsonData[0].reviewList[i].novel_img}" id= "img">
										</a>
										</div>
										
									</div>
									<div class="col">
									<div class="card"id="novelinfo" >
											<div class="card-body" >
											<span class="card-text" id="genre">\${jsonData[0].reviewList[i].novel_genre}</span>
											<span class="card-text" id="writer">작가: \${jsonData[0].reviewList[i].novel_writer}</span>
											<p class="card-text" id="title">\${jsonData[0].reviewList[i].novel_title}</p>
											
											<p class="card-text" id="stargrade">
									`;
								let avg= parseInt(jsonData[0].reviewList[i].review_star_grade);
							if( avg >= 4 ){
								for( let i = 1 ; i <= avg ;  i++ ){
								
									div+=`<span style="font-size: 40px;" class="fa fa-star checked"></span>`;
									
								}
							} else if ( avg >= 3 ) {
								for( let i = 1 ; i <= avg ;  i++ ){
									
									div+=`<span style="font-size: 40px;" class="fa fa-star checked"></span>`;
									
								}
							} else if ( avg >=2 ){
								for( let j = i ; j <=  avg;  i++ ){
									
									div+=`<span style="font-size: 40px;" class="fa fa-star checked"></span>`;
									
								}
							} else if ( avg >=1 ) {
								for( let i = 1 ; i <= avg ;  i++ ){
								div+=`<span style="font-size: 40px;" class="fa fa-star checked"></span>`;
								}	
							}
											
								div += `</p>
											<p class="card-text" id="novelcontent">\${jsonData[0].reviewList[i].novel_content}</p>
										</div>
										</div>
										</div>
									</div>
									
									<div class="card" id="userreeview">
									<p class="card-text"> 사용자 리뷰</p>
									<p id="avgstar">평균리뷰점수 ★(\${avg})</p>
									<div class="list-group w-auto" id="reviewarea">
									<a href="#"
										class="list-group-item list-group-item-action d-flex gap-3 py-3"
										aria-current="true" id="insertsmall">
									
										<div class="d-flex gap-2 w-100 justify-content-between">
											<div>
												
												<h6 class="mb-0">닉네임 : \${jsonData[0].reviewList[i].user_nickname}</h6>
												<p class="mb-0 opacity-75">\${jsonData[0].reviewList[i].review_content}</p>
											</div>
											<small class="opacity-50 text-nowrap">\${jsonData[0].reviewList[i].review_date}</small>
										</div>
									</a>
									</div>
									
									</div>
								
								`;
								
							
									div += `
									</div>
									</div>
									`;
								
						
					}
				
				div += `
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">`;
						
				if( cpage == 1 ){
					div += `<li class="page-item disabled"><a class="page-link">Previous</a></li>`;
				} else {
					div += `<li class="page-item"><a class="goBackPage page-link">Previous</a></li>`;
				}
				
				for( let i = startBlock ; i <= endBlock ; i ++ ){
					if( cpage == i ){
						div += '	<li class="page-item disabled"><a class="page-link">' + i + '</a></li>';
					} else {
						div += '	<li class="page-item"><a class="goPage page-link" data-page="' + i +  '">' + i + '</a></li>';
					}
				}
				
				if( cpage == totalPage ){
					div += `<li class="page-item disabled"><a class="page-link">Next</a></li>`;
				} else {
					div += `<li class="page-item"><a class="goNextPage page-link">Next</a></li>`;
				}
				
				div += `
						</ul>
					</nav>`;
					$('#reviewall').append(div);
					
					$(".goBackPage").click(function(){
				      	let page = cpage - 1;
				      	reviewList( url, page );
			        });
					
					$(".goPage").click(function(){
						page = $(this).attr("data-page");
						reviewList( url, page );
					});

					$(".goNextPage").click(function(){
				      	let page = cpage + 1;
				      	reviewList( url, page );
			        });
				},
				error : function(e) {
					alert("error !");
				}
			});
		};
		$(document).ready(function() {
			 $('#tablists').on('show.bs.tab', function(e){
			    	var Target1 = e.target;
			    	Target1.style.background ="#ffb26b"
			    	var Target2 = e.relatedTarget;
			    	Target2.style.background = "white";
			    	//alert( $(e.target).text() );
			        });
			    
			    $('a[data-bs-toggle="tab"]').on('show.bs.tab', function(e){
			    	var myTarget = e.target;
			    	myTarget.style.color = "white";
			    	var futureTarget = e.relatedTarget;
			    	futureTarget.style.color = "#ffb26b";
			    	//alert( $(e.target).text() );
			        });
			    
			//console.log("성공");
			let url = 'ReviewListAll.do';
			let page = 1;
			reviewList( url, page );
			 $("#searchbtn").click(function() {
				 page = 1;
				 url ='ReviewSearch.do';
				 reviewList(url, page);
			 });
		
	
		$("#tab1").on('click', function() {	
			page = 1;
			url = 'ReviewListAll.do';
			 reviewList(url, page);
		});
		
		$("#tab2").click(function() {	
			page = 1;
				url = 'ReviewRomance.do';
				 reviewList(url, page);
			});
		
		$("#tab3").click(function() {	
			page = 1;
				url = 'ReviewRomanceFantasy.do';
				reviewList(url, page);
			});
		
		$("#tab4").click(function() {	
			page = 1;
				url = 'ReviewFantasy.do';
				reviewList(url, page);
			});	
		
	});
	
	
</script>
</head>
<body>
	<jsp:include page="../include/header1.jsp"></jsp:include>

	<!-- 본문 -->
	<div class="container">
		<header
			class="d-flex flex-wrap align-items-center justify-content-center">
			<a href="/" class="d-flex align-items-center"> <svg
					class="bi me-2" width="40" height="32" role="img"
					aria-label="Bootstrap">
					<use xlink:href="#bootstrap" /></svg>
			</a>
			<div>
				<ul
					class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0" id="tablists">
					<li class="tabs" ><a href="#tab-1"
						class="nav-link px-2 link-secondary" data-bs-toggle="tab" data-bs-target="#all"id="tab1">전체</a></li>
					<li class="tabs"><a href="#tab-2"
						class="nav-link px-2 link-dark" data-bs-toggle="tab" data-bs-target="#romance" id="tab2">로맨스</a></li>
					<li class="tabs"><a href="#tab-3"
						class="nav-link px-2 link-dark" data-bs-toggle="tab" data-bs-target="#romancefantasy" id="tab3">로맨스 판타지</a></li>
					<li class="tabs"><a href="#tab-4"
						class="nav-link px-2 link-dark" data-bs-toggle="tab" data-bs-target="#fantasy" id="tab4">판타지</a></li>
				</ul>
			</div>
		</header>
	</div>
	<div class="container" id="novellist">
		<div class="row">
			<div class="col">

				<div class="col w-75 p-100" style="float: none; margin: 0 auto;">
					<div class="-\32 3">
						<div class="input-group mb-3">

							<input type="text" id="textinput" class="form-control center"
								placeholder="검색어를 입력하세요" aria-describedby="button-addon">
							<button class="btn btn-outline-secondary" type="button"
								id="searchbtn">검색</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="text-center" id="reviewall"></div>
	</div>

	<!-- 
	<div class="container">
		<div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 g-2">
			<div class="row g-0">
				<div class="col">
					<a href="#"> <img src="..." class="img" width="100%"
						height="225" role="img">
					</a>
					<div class="card-body">
						<p class="card-text">닉네임</p>
						<p class="card-text">작성일자</p>
						<p class="card-text">작성 내용</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card-body">
						<p class="card-text">장르</p>
						<h5 class="card-text">제목/작가</h5>
						<p class="card-text">별점/평점</p>
						<p class="card-text">내용</p>
					</div>

				</div>
			</div>
		</div>
	</div>
 -->


	<!-- footer -->
	<jsp:include page="../include/footer1.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

</body>