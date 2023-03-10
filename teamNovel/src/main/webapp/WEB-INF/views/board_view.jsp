<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.model.freeboardTO"%>
<%
	freeboardTO to = (freeboardTO)request.getAttribute("to");
	
	String free_seq = to.getFree_seq();
	String free_subject = to.getFree_subject();
	String user_nickname = to.getUser_nickname();
	String user_email = to.getUser_email();
	String free_date = to.getFree_date();
	String free_hit = to.getFree_hit();
	String free_like = to.getFree_like();
	String free_content = to.getFree_content();
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

@font-face {
	src: url("/font/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoEB.ttf");
	font-family: "AppleSDGothicNeoEB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoSB.ttf");
	font-family: "AppleSDGothicNeoSB";
}

@font-face {
	src: url("/font/AppleSDGothicNeoL.ttf");
	font-family: "AppleSDGothicNeoL";
}

@font-face {
	src: url("/font/AppleSDGothicNeoM.ttf");
	font-family: "AppleSDGothicNeoM";
}

::-webkit-scrollbar {
display: none;
}

.background {
	text-align: center;
	background-color: #f8f8fb;
	height: 100%;
	padding-top: 59px;
	padding-bottom: 100px;
}

#rounded_box {
	width: 77.1%;
	height: 87.2%;
	margin: 0 30px;
	padding: 40px 10px 33px 10px;
	border-radius: 20px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
	display: inline-block;
}

#free_subject {
	font-family: AppleSDGothicNeoB;
	font-size: 27px;
	font-weight: bold;
	color: #000;
	padding-left: 38px;
}

#free_date {
	font-family: AppleSDGothicNeoL;
	font-size: 16px;
	color: #707071;
	padding-right: 38px;
}

#user_nickname {
	font-family: AppleSDGothicNeoM;
	font-size: 20px;
	font-weight: 500;
	color: #777;
	padding-left: 38px;
}

#likenum {
	font-family: AppleSDGothicNeoSB;
	font-size: 15px;
	font-weight: 100;
	text-align: left;
	color: #000;
}

#commentnum {
	font-family: AppleSDGothicNeoSB;
	font-size: 15px;
	font-weight: 100;
	text-align: left;
	color: #000;
	margin-right:10px;
}


#likeicon {
	width: 19px;
	height: 19px;
}

#cmticon {
	width: 19px;
	height: 19px;
}

#free_content {
	font-family: AppleSDGothicNeoM;
  	font-size: 18px;
  	font-weight: 500;
  	text-align: left;
  	color: #777;
}

#listbtn {
	width: 109px;
  	height: 54px;
  	padding: 17px 14px;
  	border-radius: 13px;
  	background-color: #000;
	font-family: AppleSDGothicNeoEB;
  	font-size: 17px;
  	font-weight: 300;
  	color: #fff;
}

#modi, #del {
	width: 70px;
  	height: 54px;
  	padding: 17px 14px;
  	border-radius: 13px;
  	border: 0;
  	margin-top: 0px;
  	margin-right: 4px;
  	background-color: #707071;
	font-family: AppleSDGothicNeoEB;
  	font-size: 17px;
  	font-weight: 300;
  	color: #fff;
}

#modi {
	background-color: #777777;
}

#del {
	background-color: #af1515;
}

#cmt_content {
  	height: auto;
  	padding: 17px 20px 16px 25px;
  	border-radius: 14px;
  	border: solid 1px #e5e8eb;
  	background-color: #fff;
}

#cmtbtn {
	width: 136px;
  	height: 54px;
  	border-radius: 13px;
  	background-color: #ffb26b;
  	border: 0;
  	padding-top: 10px;
  	font-family: AppleSDGothicNeoEB;
  	font-size: 17px;
  	font-weight: 300;
  	color: #fff;
  	margin-left: 15px;
}

#cmt_delbtn{
	width: 55px;
  	height: 25px;
  	border-radius: 13px;
  	background-color: #fff;
  	border-width: 1px;
  	padding-top: 2px;
  	border-color: #e5e8eb;
  	font-family: AppleSDGothicNeoEB;
  	font-size: 13px;
  	font-weight: 100;
  	color: #707071;
  	margin-left: 5px;
  	margin-bottom: 7px;
}

#cmt_nickname {
	font-family: AppleSDGothicNeoM;
  	font-size: 23px;
  	padding-left: 15px;
}

#cmt_date {
	font-family: AppleSDGothicNeoM;
  	font-size: 13px;
  	padding-left: 5px;
}

#cmt_content {
	font-family: AppleSDGothicNeoM;
  	font-size: 18px;
  	margin-bottom: 30px;
}

#likebtn {
	width: 54px;
  	height: 54px;
  	border-radius: 13px;
  	border-color: #e5e8eb;
}

#savebutton, #mbtn {
	font-family: AppleSDGothicNeoEB;
	border-radius: 13px;
	border: 0px;
  	background-color: #ffb26b;
  	width: 109px;
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	color: #fff;
    padding-left: 12px;
    padding-top: 14px;
    padding-bottom: 10px;
}

#modalbtn, #listbtn {
	font-family: AppleSDGothicNeoEB;
	border-radius: 13px;
  	background-color: #000;
  	width: 109px;
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	color: #fff;
    padding-left: 10px;
    padding-top: 13px;
}

#Delmodalbtn {
	font-family: AppleSDGothicNeoEB;
	border-radius: 13px;
  	background-color: #af1515;
  	width: 109px;
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	color: #fff;
    padding-left: 10px;
    padding-top: 13px;
}

#DelModalLabel {
	font-family: AppleSDGothicNeoB;
  	font-size: 27px;
  	text-align: center;
  	color: #000;
}

#ModalContent {
	font-family: AppleSDGothicNeoSB;
  	font-size: 25px;
  	font-weight: 500;
  	line-height: 1.67;
  	text-align: center;
  	color: #000;
}

.swal2-content {
    font-family: AppleSDGothicNeoR;
}

</style>
<!-- Jquery -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	const board_nickname = "<%=user_nickname%>";
	
	// ????????? ??????
	function clickDel(formName) {
		formName.action = "/board_delete_ok.do";
		formName.method = "post";
		formName.submit();
	}
	
	// ????????? ??? ?????? ????????? ?????? ?????? ?????? ?????????
	$(document).ready(function(){
		if("${signIn.user_nickname}" == board_nickname) {
			$('#likebtn').remove();
			$('#btnarea').append('<a id="modi" class="btn" href="./board_modify.do?seq=<%=free_seq%>" role="button">??????</a>')
			$('#btnarea').append('<a id="del" class="btn" data-bs-toggle="modal" data-bs-target="#myModal" href="#" role="button">??????</a>')
		} 
		//console.log(${signIn.user_nickname});
		//console.log(board_nickname);
	
	// ?????? ?????????(1?????????) ????????????
	$(function(){
		commentList();
		setInterval(commentList, 1000);
		commentList();
	});
	// ????????? ????????? ????????????
	$(function(){
		LikeResult();
		setInterval(LikeResult(), 1000);
		LikeResult();
	});
	LikeNum();
	CommentNum();
	
	
	
		// ?????? ??????
		$('#cmtbtn').click(function(){
			if(${signIn.user_nickname != null}){
				$.ajax({
					url : 'CommentWriteAjax.do',
					type : 'get',
					data : {
						cmt_content : $("#cmt_content").val(),
						free_seq : "<%=free_seq%>"
					},
					dataType : 'json',
					success : function(jsonData){
						//alert("??????????????????");
						//console.log(jsonData)
						$("#cmt_content").val("");
						CommentNum();
					},
					error : function(e) {
						console.log(e.status);
					}
				});
				
			} else {
				Swal.fire({
					  icon: 'info',
					  text: '???????????? ????????? ????????? ??? ????????????.'
				});
			}
		});
		
		
		// ????????? ?????? ????????? ???
		$('#likebtn').click(function(){
			if(${signIn.user_nickname != null}){
				LikeClick();
				LikeResult();
			} else if(${signIn.user_nickname == null}){
				Swal.fire({
					  icon: 'info',
					  text: '???????????? ???????????? ????????? ????????????.'
				});
			}
		});
		
		
	}); // ?????? ???????????? ?????????
	
	// ?????? ????????????
	function commentList() {
		$.ajax({
			url : 'CommentListAjax.do',
			type : 'get',
			data : {
				free_seq : "<%=free_seq%>"
			},
			dataType : 'json',
			success : function(jsonData){
			//alert("??????");
			//console.log(jsonData);
		
				$('#cmt_area').html('');
				
				for(let i=0; i<jsonData.length; i++){	
					let result = "" ;
						result += "<li>";
						result += "<div>";
						result += "	<span id='cmt_nickname'><strong>"+jsonData[i].user_nickname+"</strong></span> <span id='cmt_date'class='fw-lighter'>"+jsonData[i].cmt_date+"</span>";
						if(jsonData[i].user_nickname == '${signIn.user_nickname}' ) {
						result += "	<span class='fw-lighter'>";
						result += "		<button id='cmt_delbtn' onclick = 'cmt_delete("+ jsonData[i].free_seq +","+ jsonData[i].cmt_seq +")'>??????</button>";
						result += "	</span>";
						}
						result += "</div>";
						result += "<div>";
						result += "	<p id='cmt_content'>"+jsonData[i].cmt_content+"</p>";
						result += "</div>";
						result += "</li>";
							
					$('#cmt_area').append(result);
				}
			
			},
			error : function(e) {
				console.log(e.status);
			}
		});
	}
	
	// ?????? ??????(??????)
	function cmt_delete(free_seq, cmt_seq){
		var check = confirm('????????? ?????????????????????????');
		if(check){
			$.ajax({
				type : 'get',
				url : 'CommentDeleteAjax.do',
				data : {
					free_seq : free_seq,
					cmt_seq : cmt_seq
				},
				dataType : 'json',
				success : function(list){
					commentList();
					//alert("?????? ?????? ??????");
					CommentNum();
				
				},
				error : function(){
					Swal.fire({
						  icon: 'error',
						  text: '?????? ?????? ??????'
					});
				}
			});
		}
	}

	// ????????? ????????????
	function LikeResult() {
		if(${signIn.user_nickname != null}){
		$.ajax({
			url : 'LikeResultAjax.do',
			type : 'get',
			data : {
				free_seq : "<%=free_seq%>"
			},
			dataType : 'json',
			success : function(Data){
				//alert("????????? ???????????? ??????");
				//console.log(Data);
				if(Data==2){
					$('#likeimg').attr("src","../images/like_ok.png");
				} else if(Data==1){
					$('#likeimg').attr("src","../images/like_no.png");					
				}
			},
			error : function(e) {
				Swal.fire({
					  icon: 'error',
					  text: "????????? ???????????? ??????"
				});
			}
		});
		}
	}
	
	
	// ????????? ????????????
		function LikeClick() {
			if(${signIn.user_nickname != null}){
				$.ajax({
					url : 'LikeClickAjax.do',
					type : 'get',
					data : {
						free_seq : "<%=free_seq%>"
					},
					dataType : 'json',
					success : function(jsonData){
						LikeResult();
						LikeNum();
						//alert("????????? ??????");
					},
					error : function(e) {
						console.log(e.status);
					}
				});
				
			} else {
				Swal.fire({
					  icon: 'error',
					  text: '???????????? ???????????? ???????????????'
				});
			}
		}
	
	// ???????????? ????????????
	function LikeNum() {
		$.ajax({
			url : 'LikeNumAjax.do',
			type : 'get',
			data : {
				free_seq : "<%=free_seq%>"
			},
			dataType : 'json',
			success : function(Data){
				//alert("???????????? ???????????? ??????");
				//console.log(Data);
				$('#likenum').text(Data);
			},
			error : function(e) {
				Swal.fire({
					  icon: 'error',
					  text: '????????? ??? ???????????? ??????'
				});
			}
		});
	}
	
	//????????? ????????????
	function CommentNum() {
		$.ajax({
			url : 'CommentNumAjax.do',
			type : 'get',
			data : {
				free_seq : "<%=free_seq%>"
			},
			dataType : 'json',
			success : function(Data){
				//alert("????????? ???????????? ??????");
				//console.log(Data);
				$('#commentnum').text(Data);
			},
			error : function(e) {
				Swal.fire({
					  icon: 'error',
					  text: '?????? ??? ???????????? ??????'
				});
			}
		});
	}
	
		
</script>

</head>
<body>

	<!-- header -->
	<jsp:include page="../include/header1.jsp" />

	<!-- main -->
	<main>
		<div class="background">
			<div id="rounded_box">
				<!-- ????????? -->
				<form action="./board_modify_ok.do" method="post" name="userInfo">
					<input type="hidden" name="seq" value="<%=free_seq%>" />
				</form>
				<div class="container">
					<input type="hidden" name="seq" value="" />
					<div class="row">
						<div class="col-auto me-auto">
							<p id="free_subject"><%=free_subject%></p>
						</div>
						<div class="col-auto">
							<p id="free_date"><%=free_date%></p>
						</div>
					</div>
					<hr style="color: #707071; height: 1px; margin-bottom: 26px; margin-top: 0px;" />
					<div class="row" style="height: 24px;">
						<div class="col-auto me-auto">
							<p id="user_nickname"><%=user_nickname%></p>
						</div>
						<div class="col-auto" style="padding-right: 38px;">
							<a id="cmtnum"> 
								<img id="cmticon" alt="4" src="../images/comment.png" /> 
								<a id="commentnum"></a>
							</a> 
							<a> <img id="likeicon" src="../images/like_icon.png" /> 
								<a id="likenum"></a>
							</a>
						</div>
					</div>
					<div>
						<div class="container">
							<div class="form-control" name="content" id="free_content"
							style="height: 300px; scrollbar-width: none; overflow-y: scroll;  margin-top: 35px;padding-top: 20px;padding-left: 23px;padding-right: 23px;" >
								<%=free_content%>
							</div>
						</div>
					</div>
					
					<hr style="color: #707071;height: 1px;margin-bottom: 15px;margin-top: 30px;" />
					
					<div class="row"  style="padding-left: 15px;padding-right: 20px;">
						<div id="btnarea" class="col-xxl-3 col-xl-4 col-lg-5 col-md-6 col-sm-12 text-start">
							<a class="btn btn-outline-dark" href="./board_list.do"
								role="button" id="listbtn">????????????</a>
							<button id="likebtn"
								class="btn btn-outline-secondary">
								<img id="likeimg" src="../images/like_no.png"
									style="width: 32px;"></img>
							</button>
						</div>
					<!-- ?????? -->
						<div class="col-xxl-9 col-xl-8 col-lg-7 col-md-6 col-sm-12">
							<div class="row">
								<textarea class="col form-control pr-5" name="cmt_content"
									id="cmt_content" rows="3" placeholder="????????? ??????????????????"
									style="height: 60px;"></textarea>
								<button type="submit" id="cmtbtn"
									class="col-2 btn btn-outline-secondary">?????? ????????????</button>
							</div>
						</div>
					</div>
					<div class="text-start">
						<ul class="list-unstyled" id="cmt_area" style=" margin-top: 30px;margin-left: 10px;margin-right: 10px;">
							<!-- 
					
						 -->
						</ul>
					</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="DelModalLabel">????????????</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body" id="ModalContent">
							????????? ?????????????????????????<br /> ???????????? ????????? ??? ????????????.
						</div>
						<div class="modal-footer">
							<button type="button" id="modalbtn" class="btn btn-secondary"
								data-bs-dismiss="modal">??????</button>
							<button type="submit" class="btn btn-primary" id="Delmodalbtn"
								onclick=clickDel(userInfo)>????????????</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</main>


	<!-- footer -->
	<jsp:include page="../include/footer1.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>