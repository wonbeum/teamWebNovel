<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page import="com.example.model.freeboardTO"%>
<%
	freeboardTO to = (freeboardTO)request.getAttribute("to");
	
	String free_category = to.getFree_category();
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
	src: url("/font/AppleSDGothicNeoM.ttf");
	font-family: "AppleSDGothicNeoM";
}

@font-face {
	src: url("/font/AppleSDGothicNeoEB.ttf");
	font-family: "AppleSDGothicNeoEB";
}

#rouded_box {
	width: 77.1%;
	height: 87.2%;
	margin: 0 30px;
	padding: 40px 38px 33px 38px;
	border-radius: 20px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #fff;
	display: inline-block;
}

.background {
	text-align: center;
	background-color: #f8f8fb;
	height: 100%;
	padding-top: 59px;
	padding-bottom: 100px;
}

#title {
	font-family: AppleSDGothicNeoB;
	font-size: 27px; text-align : left;
	color: #000;
	text-align: left;
}

#floatingSelect.form-select {
	font-family: AppleSDGothicNeoM;
	font-size: 18px;
	font-weight: 500;
	color: #000000;
	height: 58px;
	border-radius: 14px;
	margin-bottom: 20px;
	padding-left: 25px;
	padding-bottom: 7px;
}

#free_subject.form-control {
	font-family: AppleSDGothicNeoM;
	font-size: 18px;
	font-weight: 500;
	color: #000000;
	height: 58px;
	border-radius: 14px;
	margin-bottom: 22px;
	padding-left: 25px;
	padding-bottom: 7px;
}

#smart_editor2_content {
	border-radius: 7px;
}

#listbtn {
	font-family: AppleSDGothicNeoEB;
	border-radius: 13px;
  	background-color: #000;
  	width: 109px;
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	color: #fff;
    padding-left: 10px;
    padding-top: 14px;
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

#modalbtn, #backbtn {
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

#ModiModalLabel {
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


</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
	<!-- SmartEditor2 ???????????????  -->
<script type="text/javascript" src="smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>


<!-- SmartEditor2 -->
	let oEditors = []

	smartEditor = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "editorTxt",
			sSkinURI : "smarteditor/SmartEditor2Skin.html",
			fCreator : "createSEditor2",
			htParams : {
				// ?????? ?????? ?????? (true:??????/ false:???????????? ??????)
				bUseToolbar : true,

				// ????????? ?????? ????????? ?????? ?????? (true:??????/ false:???????????? ??????)
				bUseVerticalResizer : false,

				// ?????? ???(Editor | HTML | TEXT) ?????? ?????? (true:??????/ false:???????????? ??????)
				bUseModeChanger : false
			}
		});
	}
	

	// ????????? ??????
	$(document).ready( function() {
		smartEditor();
		$("#savebutton").click(function() {
					//id??? smarteditor??? textarea??? ??????????????? ??????
					oEditors.getById["editorTxt"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					let content = document
							.getElementById("editorTxt").value;
					let title = $("#free_subject").val();
					// ????????? ??????
					if (content == "" || content == null
							|| content == '&nbsp;'
							|| content == '<br>'
							|| content == '<br/>'
							|| content == '<p>&nbsp;</p>') {					
						Swal.fire({
						  icon: 'info',
						  text: '????????? ??????????????????.'
						});
						return false;
					}

					if (title == null || title == "") {					
						Swal.fire({
							  icon: 'info',
							  text: '????????? ??????????????????.'
							});
						//$("#title").focus();
						return false;
					}
					
					if(title !=null && content!=null){
				        Swal.fire({
				            title: '??? ????????????',
				            text: "??? ????????? ?????????????????????????",
				            icon: 'question',
				            showCancelButton: true,
				            confirmButtonColor: '#3085d6',
				            cancelButtonColor: '#d33',
				            confirmButtonText: '??????',
				            cancelButtonText: '??????'
				        }).then((result) => {
				            if (result.isConfirmed) {
								$("#frm").submit();
				            }
				        })
					}
				});

	});
	
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../include/header1.jsp" />

	<!-- main -->
	<div class="background">
		<div class="container justify-content-center" id="rouded_box">
			<p class="text-start" id="title" style="margin-bottom: 0px;">???
				????????????</p>
			<hr style="color: #e5e8eb;" />
			<div class="form">
				<form class="validation-form" action="./board_modify_ok.do"
					method="post" id="frm" >
				<input type="hidden" name="seq" value=<%=free_seq %>>
					<div class="form-floating">
						<select class="form-select" id="floatingSelect"
							style="color: #000000; margin-bottom: 20px;"
							aria-label="Floating label select example" id="free_category"
							name="free_category">
							<option disabled>????????? : <%=free_category %></option>
							<option value="??????">??????</option>
							<option value="??????">??????</option>
							<option value="??????">??????</option>
						</select> <label for="floatingSelect" style="padding-left: 25px;">???????????? ??????</label>
					</div>
					<div class="form-floating">
						<input type="text" class="form-control" id="free_subject"
							placeholder="????????? ???????????????" name="free_subject" value="<%=free_subject %>"> <label
							for="floatingPassword" 
							style="padding-left: 25px; font-family: AppleSDGothicNeoM;">?????? ??????</label>
					</div>

					<!-- SmartEditor2  -->
					<div id="smarteditor">
						<textarea name="free_content" id="editorTxt" rows="10" cols="10"
							style="width: 100%"><%=free_content %></textarea>
					</div>

					<div class="row" style="margin-top: 39px;">
						<div class="col-auto me-auto">
							<a class="btn btn-outline-secondary" id="backbtn" href="./board_view.do?seq=<%=free_seq%>"
							role="button">????????????</a>
						</div>
						<div class="col-auto">
							<button type="button" id="savebutton" class="btn btn-secondary">????????????</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="../include/footer1.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>