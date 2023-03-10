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
String novel_kakao = to.getNovel_kakao();
String ridi = to.getNovel_ridi();
String novel_seriese = to.getNovel_series();
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

@font-face {
	src: url("/font/AppleSDGothicNeoM.ttf");
	font-family: "AppleSDGothicNeoM";
}

.nav-scroller {
	border: 1px solid black;
}
#nickname {
  width: 150px;
  height: 23px;
  font-family: AppleSDGothicNeoR;
  font-size: 15px;
  font-weight: 600;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #000;
}
.-\34 9 {
	width: 475px;
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

#genre {
	font-family: AppleSDGothicNeoR;
	font-size: 28px;
	font-weight: 300;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	text-align: left;
	color: #9b9b9b;
}

#starstar {
	font-family: AppleSDGothicNeoR;
	font-size: 15px;
	padding-top: 0px;
    padding-bottom: 50px;
    padding-left: 0px;
}

#date {
	font-family: AppleSDGothicNeoR;
	font-size: 15px;
	padding-top: 0px;
    padding-bottom: 50px;
    padding-left: 5px;
}

#writer {
	font-family: AppleSDGothicNeoR;
	font-size: 18px;
	font-weight: 300;
	font-stretch: normal;
	font-style: normal;
	line-height: normal;
	letter-spacing: normal;
	text-align: right;
	color: #707071;
}

#title {
	font-family: AppleSDGothicNeoR;
	font-size: 20px;
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
	font-family: AppleSDGothicNeoR;
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
	width: 100%;
	height: auto;
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

#avg {
  width: 100%;
  height: 120px;
  margin: 0 0 30px 42px;
  padding: 42px 1.5px 38px;
  border-radius: 20px;
  box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
  background-color: #fff;
}

#avgstar {
  width: 500px;
  height: 31px;
  margin: 10px 10px 10px 35px;
  font-family: AppleSDGothicNeoR;
  font-size: 25px;
  font-weight: 600;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #000;
}

#star {
  width: 500px;
  height: 54px;
  margin: 0px 3px 0 0px;
  text-align: center;
}

#insert {
 width: 100%;
  height: auto;
  margin: 0 0 30px 42px;
  padding: 42px 1.5px 38px;
  border-radius: 20px;
  box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
  background-color: #fff;
}

#insertsmall {
 width: 100%;
  height: 100px;
  margin:  1px 1px 1px 1px;
  padding: 20px 1.5px 38px;
  border-radius: 20px;
  background-color: #fff;
  font-family: AppleSDGothicNeoR;
  font-size: 15opx;
  font-weight: 600;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #000;
}
#reviewlist1 {
	width: 100%;
  	height: auto;
  	margin: 0 0 5px 42px;
  	padding: 20px 1.5px 0px;
  	border-radius: 20px;
  	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
  	background-color: #fff;
    font-family: AppleSDGothicNeoR;
  	font-size: 25px;
  	font-weight: 600;
  	font-stretch: normal;
  	font-style: normal;
  	line-height: normal;
  	letter-spacing: normal;
  	text-align: left;
  	color: #000;
}
#reviewcontent {

  font-family: AppleSDGothicNeoR;
  font-size: 16px;
  font-weight: 500;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #000;
}

#button {
    padding-bottom: 10px;
    padding-top: 0px;
    padding-right: 5px;
    padding-left: 0px;
    text-align: right;
    
}

#comment {
	width: 100%;
	font-family: AppleSDGothicNeoM;
	font-size: 20px;
	margin-bottom: 10px;
}

.checked {
	color: orange;
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	// ????????????
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
function allreviewlist( novel_title ) {
		
		$.ajax({
			url : 'allreviewlist.do',
			type : 'get',
			data : {
				"novel_title" : novel_title,
			},
			dataType : 'json',
			success : function(jsonData){	

				
				
				
				$('#reviewarea').html('');

				$('#avg').html('');
				
				let div = '';
				
				let avg = 0.00;
				for(let i=0; i<jsonData.length; i++){
					avg += parseFloat(jsonData[i].review_star_grade);
				}
				if( avg != 0 ){
					avg = (avg/ parseFloat(jsonData.length) ).toFixed(2);
				}
					let div2 = '';
					
						div2+=`<p id="avgstar">????????????(\${avg})</p>
						<div id="star">
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
								div+= `
								</div>`;
							

							$('#avg').append(div2);
				
				
					
			},
			error : function(e) {
				console.log( e.status );
			}
		});
};
	function reviewarea( url, novel_title  , page ) {
		
		$.ajax({
			url : url,
			type : 'get',
			data : {
				'cpage' : page,
				"novel_title" : novel_title
			},
			dataType : 'json',
			success : function(jsonData){

				let cpage = jsonData[0].cpage;
				let recordPerPage = jsonData[0].recordPerPage;
				let blockPerPage = jsonData[0].blockPerPage;
				let totalPage = jsonData[0].totalPage;
				let totalRecord = jsonData[0].totalRecord;
				let startBlock = jsonData[0].startBlock;
				let endBlock = jsonData[0].endBlock;
				
				$('#reviewarea').html('');
				
				let div = '';
				
				let avg = 0;
				for(let i=0; i<jsonData[0].reviewdetail.length; i++){
					avg += parseInt(jsonData[0].reviewdetail[i].review_star_grade);
				}
				avg = (avg/ parseInt(jsonData[0].reviewdetail.length) ).toFixed(2);
				
				for(let i=0; i<jsonData[0].reviewdetail.length; i++){
					div+=`
					<a href="#"
						class="list-group-item list-group-item-action d-flex gap-3 py-4 px-4"
						aria-current="true" id="insertsmall">
						<div class="d-flex gap-2 w-100 justify-content-between">
							<div>
								<h6 class="mb-0" id="nickname">????????? : \${jsonData[0].reviewdetail[i].user_nickname}</h6>
								<p class="mb-0 opacity-75" id="reviewcontent">\${jsonData[0].reviewdetail[i].review_content}</p>
							</div>
							<div>
							<span id="starstar">?????????(\${jsonData[0].reviewdetail[i].review_star_grade})</span><span id="date" class="opacity-50 text-nowrap">  ????????????:\${jsonData[0].reviewdetail[i].review_date}</span>
							</div>
						</div>
					</a>
						`;
				}
					
					
			
				div += `
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">`;
						
				if( cpage == 1 ){
					div += `<li class="page-item disabled"><a class="page-link">??????</a></li>`;
				} else {
					div += `<li class="page-item"><a class="goBackPage page-link">??????</a></li>`;
				}
				
				for( let i = startBlock ; i <= endBlock ; i ++ ){
					if( cpage == i ){
						div += '	<li class="page-item disabled"><a class="page-link">' + i + '</a></li>';
					} else {
						div += '	<li class="page-item"><a class="goPage page-link" data-page="' + i +  '">' + i + '</a></li>';
					}
				}
				
				if( cpage == totalPage ){
					div += `<li class="page-item disabled"><a class="page-link">??????</a></li>`;
				} else {
					div += `<li class="page-item"><a class="goNextPage page-link">??????</a></li>`;
				}
				
				div += `
						</ul>
					</nav>`;
			
				
				$('#reviewarea').append(div);
				
				$(".goBackPage").click(function(){
			      	let page = cpage - 1;
			      	reviewarea(url,novel_title , page);
		        });
				
				$(".goPage").click(function(){
					page = $(this).attr("data-page");
					reviewarea(url,novel_title , page);
				});

				$(".goNextPage").click(function(){
			      	let page = cpage + 1;
			      	reviewarea(url,novel_title , page);
		        });
				
			},
			error : function(e) {
				console.log( e.status );
			}
		});
};

	$(document).ready(function() {
		const novel_title = $('#title').attr('novel-title');
		let url ='reviewlist.do';
		
		let page = 1;
		
		allreviewlist(novel_title);
		reviewarea(url,novel_title , page);
		
			$('#recent').on('click', function() {	
				page = 1;
				url = 'review_recent.do';
				reviewarea(url,novel_title, page);
			});
			
			$('#high').on('click', function() {	
				url = 'review_star_high.do';
				reviewarea(url,novel_title, page);
			});
			
			$('#low').on('click', function() {	
				url = 'review_star_low.do';
				reviewarea(url,novel_title, page);
			});
			
		//?????? ??????
		$('#reviewbtn').click(function() {
			// ????????? ?????? ?????? 
			if(${signIn.user_nickname == null}){

		        Swal.fire('???????????? ????????? ??????????????????');
			}
			// ????????? ????????????
			else if(count == null){
		        Swal.fire('????????? ??????????????????');
			}
			// ????????? ????????????
			
			// ??????
			
			
			else{
				
				let review_content = document.getElementById('comment').value;
				let review_star_grade = count;
	
	
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
						reviewarea(url,novel_title);
					},
					error : function(e) {
						console.log( e.status );
					}
				});
			}
			allreviewlist(novel_title);
		});
		reviewarea(url,novel_title);
		
	
});

</script>
</head>
<body>

	<jsp:include page="../include/header1.jsp"></jsp:include>


	<!-- ?????? -->
	<div class="row justify-content-center" style="margin: 80px 0px 60px 0px;">

		<div class="col-lg-3 col-md-4 col-sm-8">
			<div class="card p-3 text-end" id="novelinfo">
				<img src="<%=novel_img%>" class="-\35 0" role="img" id="novelimg">

				<div class="card-body">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div>
							<p id="genre"><%=novel_genre%></p>
						</div>
						<div>
							<small class="opacity-50 text-nowrap" id="writer" >??????: <%=novel_writer%></small>
						</div>
					</div>
					<p class="title" id="title" novel-title="<%=novel_title%>"><%=novel_title%></p>
					<p class="\-"><%=novel_content%></p>
					<div class="-\34 9">
				
						<%
						if(novel_kakao.equals("null")){
					%>
							<a href="<%=novel_seriese%>" target="_blank"><button type="button" class="btn btn-warning">????????? ??????</button></a>
					<%
						}else if(novel_seriese.equals("null")) {						
					%>
							<a href="<%=novel_kakao%>" target="_blank"><button type="button" class="btn btn-warning">????????? ??????</button></a>
					<%
						}
					%>
					</div>
				</div>
			</div>
		</div>
		<!-- ?????? ?????? -->
		<div class="col-lg-5 col-md-4" style="margin-left: 15px;" >
		
			<!-- ?????? ?????? -->
			<div class="card p-3"  id="avg">
			</div>
			
			<!-- ?????? / ?????? ?????? -->
			<div>
				<div class="card p-3"  id="insert">
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label"
						style="font-size: 15px;padding: 5px 10px;font-family: 'AppleSDGothicNeoM';"
						>????????? ??????????????????</label>
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

									<button type="button"
										style="margin-top: 10px; margin-left: 5px;"
										class="btn btn-lg btn-warning" id="reviewbtn">????????????</button>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- ??????????????? -->
			<div id="reviewlist1">
			<nav id="button">
			<a></a> <button class="btn rounded-pill text-bg-warning" id="recent" href="#recent">?????????</button>
			<button class="btn rounded-pill text-bg-warning id="high" href="#high">?????????</button> <button
				class="btn rounded-pill text-bg-warning" id="low" href="#low">?????????</button>
				</nav>
			<div class="list-group w-auto" id="reviewarea">
				<!-- 
				<a href="#"
					class="list-group-item list-group-item-action d-flex gap-3 py-3"
					aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div>
							<h6 class="mb-0">?????????</h6>
							<p class="mb-0 opacity-75">????????????</p>
						</div>
						<small class="opacity-50 text-nowrap">????????????</small>
					</div>

				</a> <a href="#"
					class="list-group-item list-group-item-action d-flex gap-3 py-3"
					aria-current="true">
					<div class="d-flex gap-2 w-100 justify-content-between">
						<div>
							<h6 class="mb-0">?????????</h6>
							<p class="mb-0 opacity-75">????????????</p>
						</div>
						<small class="opacity-50 text-nowrap">????????????</small>
					</div>
				</a>
				 -->
			</div>
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