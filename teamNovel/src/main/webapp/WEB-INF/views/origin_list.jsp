<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.model.userInfoTO"  %>
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

	#nav-button{
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
	
	#rqbtn{
	width: 155px;
	height: 45px;
	margin: 18px 0 41px 146px;
	border-radius: 15px;
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.16);
	background-color: #000;
	
	font-family: AppleSDGothicNeoSB;
	font-size: 20px;
	font-weight: 800;
  	text-align: center;
  	color: #fff;
	}
		
	.card-imgs{
	position: relative;
	width: 286px;
  	height: 405px;
  	margin: 5px;
  	border-radius: 15px;
	}
	
	.card-body{
	display: flex;
  	flex-direction: column;
  	justify-content: center;
  	align-items: center;
  	font-family: AppleSDGothicNeoR;
	}
	
	.card-imgs img{
	  position:absolute;
	  width: 100%;
	  height: 100%;
	  border-radius: 15px;
	  display: flex;
	}
	.card-imgs img.img-hover{
	  display:none;
	}
	.card-imgs:hover img.img{
	  display:block;
	  transition: 1s ease-out;
	  opacity: 0;
	}
	.card-imgs:hover img.img-hover{
	  display:block;
	  transition: 1s ease-out;
	  opacity : 0.6;
	}

	.dotebtn1, .dotebtn2{
		width: 14px;
		height: 14px;
		margin: 64px 0px 64px 15px;
	}

</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

<!-- 입력값 검사 --> 
window.addEventListener('load', () => {
	  const forms = document.getElementsByClassName('validation-form');

	  Array.prototype.filter.call(forms, (form) => {
	    form.addEventListener('submit', function (event) {
	      if (form.checkValidity() === false) {
	        event.preventDefault();
	        event.stopPropagation();
	      }

	      form.classList.add('was-validated');
	    }, false);
	  });
	  
	  
	}, false);
	
	
<!-- 네비바 주황색 버튼 --> 
	$(document).ready(function(){
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
	    
	    
<!-- 요청하기 버튼 -->

		$('#rqbtn').click(function handler(event){
			if(${signIn == null}) {
				alert("로그인 후 요청이 가능합니다!");
			} else {
				$("#RequestModal").modal("show");
			}
			
			$('#rqbtn_ok').on('click', function(){
				origin_request_ok_Server();
			});
		});
	});

<!-- 모달 창 정보 입력 --> 
	const origin_request_ok_Server = function(){
        let request_title = $("#request_title").val();
        // 입력값 검사

        if (request_title == null || request_title == "") {
			alert("작품명을 입력해주세요!");
			return false;
		}
        
		$.ajax({
			url:'origin_request_ok.do',
			type: 'get',
			data: {
				request_title: $('#request_title').val(),
				request_category: $('#request_category').val(),
				user_nickname: $('#user_nickname').val(),
				user_email: $('#user_email').val()
			},
			
			dataType: 'json',
			success: function(jsonData) {
				if(jsonData.flag==0){
				alert( "요청 성공! 해당 작품 추가 소식을 메일을 통해 확인하세요.");
				$("#RequestModal").modal("hide");
				}
			},
			error: function(err) {
				alert( "회원 정보를 정확히 입력해주세요." );
			}
		})
	};



</script>
</head>
<body>

<!-- header -->
<jsp:include page="../include/header1.jsp"></jsp:include>

<!-- 본문 -->

<!-- Nav pills -->
<div class="container d-flex justify-content-center" style="margin-top: 20px; margin-bottom: 20px; padding-top: 20px; padding-bottom: 20px;">
	<nav class="nav nav-pills nav-fill justify-content-center" role="tablist" id="tablists">
		<a class="nav-link active" data-bs-toggle="tab" data-bs-target="#webtoon" href="#webtoon" id="nav-button" style="background-color: #ffb26c; color: #fff;">웹툰</a>
		<a class="nav-link" data-bs-toggle="tab" data-bs-target="#drama" href="#drama" id="nav-button">드라마</a>
		<a class="nav-link" data-bs-toggle="tab" data-bs-target="#movie" href="#movie" id="nav-button">영화</a>
	</nav>
</div>

<!-- 제목 -->
<div class="top">
	<div class="container d-flex justify-content-center">
		<span style="font-family: AppleSDGothicNeoSB; font-size: 50px; font-weight: 900;">원작소설</span>
	</div>
	<div class="container d-flex justify-content-center">
		<span style="font-family: AppleSDGothicNeoR; font-size: 20px; font-weight: 500;">원하시는 작품을 자유롭게 요청하세요!</span>
	</div>
</div>

<!-- 요청하기 버튼 -->
<div class="container w-75">
	<div class="row">
		<div align="right">
		  	<a class="btn" id="rqbtn" data-bs-toggle="modal">요청하기</a>
		</div>
	</div>
</div>

<!-- RequestModal -->
<div class="modal fade" id="RequestModal" tabindex="-1" aria-labelledby="RequestModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header d-flex justify-content-center">
        <h5 class="modal-title" id="RequestModalLabel"
        style="font-family: AppleSDGothicNeoB; font-size: 27px; font-weight: bold;">요청하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form class="validation-form" novalidate>
      <div class="modal-body">
          <div class="mb-3">
            <label for="InputEmail" class="form-label">이메일*</label>
            <input type="email" class="form-control" id="user_email" value="${signIn.user_email}" required>
            <div id="emailHelp" class="form-text">요청 작품이 추가될 경우, 해당 주소로 메일이 발송됩니다.</div>
            <div class="invalid-feedback">이메일을 입력해주세요.</div>
          </div>
          <div class="mb-3">
            <label for="InputNickname" class="form-label">닉네임*</label>
            <input type="text" class="form-control" id="user_nickname" value="${signIn.user_nickname}" required>
            <div class="invalid-feedback">닉네임을 입력해주세요.</div>
          </div>
          <div class="mb-3">
          	<label class="form-label">카테고리*</label>
				<select class="form-select form-select-sm" id="request_category" required>
  					<option disabled>카테고리 선택</option>
  					<option value="웹툰">웹툰</option>
  					<option value="드라마">드라마</option>
  					<option value="영화">영화</option>
				</select>
				<div class="invalid-feedback">카테고리를 선택해주세요.</div>
			</div>
			<div class="mb-3">
            <label for="InputTitle" class="form-label">작품명*</label>
            <input type="text" class="form-control" id="request_title" required>
            <div class="invalid-feedback">작품명을 입력해주세요.</div>
          </div>
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="submit" class="btn" style="background-color: #ffb26c; color: #fff;" id="rqbtn_ok">요청</button>
      </div>
      </form>
    </div>
  </div>
</div>


<!-- Tab panes -->
<div class="tab-content">


<!-- 웹툰 -->
<div class="tab-pane show active" id="webtoon" role="tabpanel"><br />		
	<div class="container">
	  <div class="row">
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/afa9f401ba81c69781db26a0f0b6423e304115237b6d8715a915602acdaa580c3ee607f9f4fa0b30bb27043b435367e19bb4d2258783601ab7a62674fd483eb625f6f77aaddd76650696a7ff3d3dfa9ca715a48aaafa92957abefa328d96c526e21a797a672f90a41c512cc4a17d2a6f" class="card-img-top" alt="sss급">
	    			<img class="img-hover" src="https://w.namu.la/s/a94ad7d3bad6435ddf571732be3c47cd711a0313b8d0fb2d29f17b9df57a431d07c28e95acc16c5adb9e2d1292ae806a316b7f8ac1dcb0da3367eff1d37c2a8ed1860517162ce157f5b5decef5f3158f0b86f0a2a24169b29c38429ba18647914ce97f32e3319a416c7033ae9f87a02d" class="card-img-top" alt="sss급">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">SSS급 죽어야 사는 헌터</h5>
				   	<p class="card-text">원작: 신노아</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/52822434" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3962389" target="_blank">네이버시리즈</a>
				   			<a class="platform_series" href="https://ridibooks.com/books/2065017814" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오 웹툰 / 2020. 12. 31. ~</small></p>
				</div>
			</div>
			<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/8683f6aaa602bfa8b38385ba7aa879666b08bbbe907274b3595c0462ba7f9c7b56b57b4bf9183ca1804f1a246ec8e671fa3906f0f4bc15746c930519d5a035107a3d9e97ad019277f38a1b364faa523d6d4b3ba19d2497c99f76b624e3550171" class="card-img-top" alt="곱게짐승">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20201210_165/pocket_1607583455989iBFVL_JPEG/__690x100.jpg?type=m260" class="card-img-top" alt="곱게짐승">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">곱게 키웠더니, 짐승</h5>
				   	<p class="card-text">원작: 이른꽃</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/comic/detail.series?productNo=5718051" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2020. 12. 12. ~ 2022. 12. 03</small></p>
				</div>
			</div>
			<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/806fbf1c975678c2c3957de87a93ab1eccb7b23a1c13cde7e0a399ca8e7b8b8870e4b7aa544e0b8e8aa0966d0016214683c620e44ad60b40640d6bc337b19a1da953650b396c8d52f1cccad36ab9679be20f6bf9dfe84b80ee7bce4d6255a6db1260ceb0e7e85ad147d1c38e5e2f9028" class="card-img-top" alt="공작티">
	    			<img class="img-hover" src="https://w.namu.la/s/9216f2dd6c40d386538d66210cdd37fc98e12ba11169b07d0f424c97509d0efb8b31ca1033d1b8324d167ea24c9a1375dfb0405cac84dd8df3b629971e21af9967cbeeba62ffb60f567e48819571b5622a9487f65affdaf93b013bd469e1a2c6321905cbb6424dcff1965655455e4477" class="card-img-top" alt="공작티">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">공작부인의 50가지 티 레시피</h5>
				   	<p class="card-text">원작: 이지하</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/50092424" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오 웹툰 / 2019. 07. 12. ~ 2021. 06. 19</small></p>
				</div>
			</div>
			<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/b1922b4050bccc573cdbb3120f55cfb493955e966444ee8c6a6872fb6a0fef80e851ce78baa92a0cf0923c340153d823c97cdaf465e0fcb856bdf80b8b944291a79c0b4e9ac6d52223d3150bc33b1dd5fa0da03227ffce72c2dce3fdee1a14dcfb02e3c5cc1af0e538aa8f15fea759ac" class="card-img-top" alt="광마회귀">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20200219_262/pocket_1582097130172qDJDQ_JPEG/image.JPEG?type=m260" class="card-img-top" alt="광마회귀">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">광마회귀</h5>
				   	<p class="card-text">원작: 유진성</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4892207" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2021. 07. 23. ~</small></p>
				</div>
			</div>
			<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/2ddad669d54628f44476d8138ada8ce6aef12c798fc94fa13beab697219b6db95a6e5fac3d41657f94c231480cf19602839d2525f325182d56b2b8e28547449310456a6346de7e795f2af26aa2b7274757fef094f7b8f6313213cdbc228fbd76b368acd05541813b58e3d44b61fe5e41" class="card-img-top" alt="광해의 연인">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20190717_202/pocket_1563345395525iyFKh_JPEG/___.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">광해의 연인</h5>
				   	<p class="card-text">원작: 유오디아</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4344165#" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2020. 07. 17. ~</small></p>
				</div>
			</div>
			<div class="col">
  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/e35ae790c9ca572c793802c56d10440a6fac627f979a4ff35a89940c35e101ccd8ff4cbac0415821ae403f15b78f39d5e8a723181cf54e127c089e42814595330b7131b248c3a592a265e9f12e4998fc284815a769311f8041da5a09190c73b812f2079c3354ab63b800c8a1e2671be0" class="card-img-top" alt="괴물공녀">
	    			<img class="img-hover" src="https://dn-img-page.kakao.com/download/resource?kid=bwd13w/hyqDwSbpR6/ZOIAhWT41FKS4gxAxTTMK0&filename=th3" class="card-img-top" alt="괴물공녀">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">괴물 공작가의 계약 공녀</h5>
				   	<p class="card-text">원작: 리아란</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/51964022" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2019. 04. 30. ~</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/585743652fd1fa66e010fb9f7485526c663faedbfcc6510df5baa68a47fbf52bcbd0b4cb9b6babb674cad33b93a67a71a90f2797b1446138e73caae01d7397479fa3b1be685401ca2364bd0dffc9986ad7ed40c6cee5fde9163e4c25f1c9d482c5304a31b71c6548ebb23a61e99060fc" class="card-img-top" alt="괴물황태자">
	    			<img class="img-hover" src="https://w.namu.la/s/476cbdb6e7879fdf08042908d4f3356a84827d8da504abbdb27278f6f181ef1345c33ef1207a2c6fefeb0335c50b5ef5bdde500e33b301a66eff706ef55edc7565f31d667c26e7f8e523ade78b32bc44931dc20277d4a16775260d163a4d07df" class="card-img-top" alt="괴물황태자">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">괴물 황태자의 아내가 되었습니다</h5>
				   	<p class="card-text">원작: 꿈결나무</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/55216391" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=8515011" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지, 네이버시리즈 / 2021. 03. 26. ~</small></p>
				</div>
			</div>
			<div class="col">
		  	<div class="card-imgs">
		    		<img class="img" src="https://w.namu.la/s/78a8324e80b1cb7e993c862b2202f39f31f9c6a25c0e7fe40f2cb4dac2826d9a80c95798158c5a248dec7ef8f6cb917078478e6b07ad4494e9c405858f4d6d5f3d6bbbddca0f2705ae957c09af1e0bbcfc3108f0ef7276d54bfccaa3c0725132" class="card-img-top" alt="들러리양">
	    			<img class="img-hover" src="https://w.namu.la/s/8bd9f39e4970d1311b24431c65299fe3871e4ca62721c147603ba254843fb6add68760eaa2c353451399835a85fe26ba34ee3228b66cb5e17bcaa2a6e7ef9e71d3f09550ac7a436432036bee407bea1ee2189280e527773e2bbf619b0f02081707993334557ccf95596107ab1344471b" class="card-img-top" alt="들러리양">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">구경하는 들러리양</h5>
				   	<p class="card-text">원작: 엘리아냥</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/48215359" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=2577628" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지, 네이버시리즈, 리디/ 2017. 12. 24. ~</small></p>
				</div>
			</div>
			<div class="col">
		  	<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/12e4fbbba268f18d87c91231999cbbe851f4754d2931149d45261e67c78ebca758b58137b9886507612e0467c90dfe89f8f503ced956e67c6f8639bea2b2beb05ee654b7d105366494fd25e8ce7abdcb92a4b857043005f48abd86992ce3d00a279f478aacb7b3d8d113883c512ac834" class="card-img-top" alt="구사일생 로맨스">
	    			<img class="img-hover" src="https://w.namu.la/s/5450bf643f360684d6cb6aaaad53cf725b43d06479b932c3bb2144e1ee25fac9b3a6fb368f6bffc43b1708419ced3948125942077b60b66f639c440a0ca95b340c50bee190b2624a589cd25347a092a07f94fb8b3c74f7a8348ffdd9f8709416f5fdce40d4c3aa4a4de4e6be93f3f9dd" class="card-img-top" alt="구사일생 로맨스">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">구사일생 로맨스</h5>
				   	<p class="card-text">원작: 수(秀)</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3528538" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2021. 10. 26. ~ 2023. 01. 10.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/b02d762e3d26d09b94eedba5a0eb58648f6638c8e2eef6fc77fd22de0bc29de8bec9ee7ec702a7841086a4dca9e29c7ad1fcb072c083d62aa3d17eaeefda0455d0622cf8cf5c49b6e586e6ae928d8a7b0365032e8aef53feb7ba6a3b0a67bcbea0a0d81dc8b578a8b9f18377b9f9d04d" class="card-img-top" alt="그오빠들을조심해">
	    			<img class="img-hover" src="https://w.namu.la/s/8a5ed3a3f87737796852e57e18774a4734e14b53ad7d7e1c67dfa63e7afb623b5d433beebaf0baa30a8fe51f9404c8d24c50cfaddffd3a0a59af625cd1c6c3d9ba42ff774f336490d14b0a2a4b0e0cb57e95cb636609ad5f8af3286c4617b127e848441f80aa581c6c8ef7ee86dff21a" class="card-img-top" alt="그오빠들을조심해">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">그 오빠들을 조심해!</h5>
				   	<p class="card-text">원작: 플루토스</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/49991011" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3554700" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2020. 02. 01. ~ 2022. 05. 12.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/2915a40699bc4d3ec772e5bf5c977f173e96547e5d8eb760da1dc871d5f44346915fac05191cafa321c283f51a856007695d0c30a3364301145fa6fe41443e2944e6a040bdfa5483392d2e3f9c12f15ffd121df026a66603a1dccb7c43b0b87483ca3d4cc34a3611d56c49cb014cc566" class="card-img-top" alt="그악조심">
	    			<img class="img-hover" src="https://w.namu.la/s/975a7fa9f1780b8067c81fd1a83febdd2f9b1279b9d7bcd41d916b0004e444993ffc575ecace260b790d6b767f485fbc18d0a3950fd67484227f731ceeaffd3c2eacb967e5fad571ae7abdadae0521d421f8a1c7b24863dcddcd08545cbeebba6e7eee67dd856736791f66ddff065d9c" class="card-img-top" alt="그악조심">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">그 악녀를 조심하세요</h5>
				   	<p class="card-text">원작: 뽕다맛 스크류바</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/52505544" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4886402" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2020. 04. 13. ~ 2022. 10. 09.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/66ff1380ed6f3ba28667fc7f25c62476d34b3cade569d51f1e8e1038e8d0fea548fac58d160e57e59f4224be68ec02d33842c2f21ee5c35820ffc7abee940d477b7ac2878296b36a6457b212881dce587e137ed0b3bd39ca66461f4bf207ef8423619e54e0bf183a2f3e19ceb5cd4f4a" class="card-img-top" alt="공작저">
	    			<img class="img-hover" src="https://w.namu.la/s/853f46c5c27e025b875eb60582a0e0514f41fc3ddd7e6215e859bd232b66ed3e13ded1b4071b9b6ad707489f161f8e411f0af6ca609430af834cace29ac6b33d1a1da50f8b2493598701f6dfa83c13051feab56443139ff6e604936281b98031f1dabdb71e19c48ba7cfdda8a68e6cdd" class="card-img-top" alt="공작저">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">그녀가 공작저로 가야 했던 사정</h5>
				   	<p class="card-text">원작: 말차</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/48959825" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=2944889" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2017. 09. 03. ~ 2021. 03. 22.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/a1a64a11cb80462179e81b914c4e1f8640f3ed2249817341c0768b8852e23cad60f38585bf0a0be9323f8f8ae76ca98e1e496316b4fddbcd1349b2f74dbca5f3137dbb12b35c4bdc5cb2b77860f7430207a7ce3b48d3ea100e5b1744fb029e0b88d0fff5645be3644253ca4311a0e4da" class="card-img-top" alt="안티팬">
	    			<img class="img-hover" src="https://w.namu.la/s/4ba616adc01754b8fef2072ab30289a357d602b0f850c60103902eb17da68caef78f616f067999ecc1ec0326116a7949c67409d3b42510d2f7e3b540fa6da8e8f59c04d895ad0a352da208a1e6019490a29a3a8e2b24d5eb1022ae64400c96d98466fd2b667dd577ba8161ed9b060a20" class="card-img-top" alt="안티팬">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">그래서 나는 안티팬과 결혼했다</h5>
				   	<p class="card-text">원작: 김은정</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3821459" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2018. 12. 05. ~ 2020. 07. 22.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/50412026717ba905980fa3977d39970b6d232d6058c3fb062ccbdcd3ceda94d2acdcdcbc25b3a7dd57840226d9111d7190c875af9255948515f0f91db5be36d4f88b51b71b644ca15da22572bddeea101322b609a2891e98de001d0960683360760615e944a93b8a260a397fd395bd9a" class="card-img-top" alt="그림자 신부">
	    			<img class="img-hover" src="https://w.namu.la/s/b3b23596f035cbd7e5898eb7d3ffd44a4c4bc82518a774acb41f23db24ce39f0814e1243f53b62775ce94e05d01b7086c6f3e94a180be567b400df8cda02fbd04aeb809eda978bc97c9bf85acf03812e4927d2530a45bfb0bf58e9eab81f9ad4ef7bb924e71f15562254e000bb45e746" class="card-img-top" alt="그림자 신부">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">그림자 신부</h5>
				   	<p class="card-text">원작: 이새인</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4055148" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2021. 03. 07. ~ 2022. 12. 04.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/23397aad25c24e1ac80336f8095a4440ff70d5ddb849c2a80b8e903c223bedc03d76b9ee54bedd84c1a4ae87c4e7f3dd4822d22fd30e9f4b9a0e55869668b91f03c2190d0447c365daec2003133306b0109628b4f7b42569726414abd8871623" class="card-img-top" alt="김비서">
	    			<img class="img-hover" src="https://w.namu.la/s/9734a911a4304eef15245799db8043143876618b1e2c2f36c039f7710798edaf9a26c1c5fe0e8b083480b50ac86df79d6329e0151835a7639cf81e7a7ce46a981c89d04bafec3555905c50357748477c57d48c714abbe375944dd25265cfcb526bb2b5c4c686b4b91684b6ca835515ff" class="card-img-top" alt="김비서">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">김 비서가 왜 그럴까</h5>
				   	<p class="card-text">원작: 정경윤</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/46418214" target="_blank">카카오페이지</a>
				   			</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2016. 06. 28. ~ 2018. 09. 19.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/4e92ed0b7d1bc18c2e29d7280e0b1987e84cd915811a6b5ea9ce673cb0d0b84b9e0e3d435ab077286ee73c994afc56d07ab80963c75443417d3595d96b3398398f58015c5323e5b989ba118b4921760452a2603d1d374c414073834047b8182394ac94c527267812e94aeffcbe8aeba4" class="card-img-top" alt="나혼렙">
	    			<img class="img-hover" src="https://w.namu.la/s/3f6b5c1bf62c9cbc6fcb8c4bc0b6ee38e6d73018a4bee7ad48bb9b42b9c258340814d94dd32c9a3b5f91b6bc6991f919318da08273eeeec75e02c041ab1d52b44e99451c1033c122960e2e338f7db50cfc2bb4b0e0e262e1c36a61627bf9d155cc5498bb7e504db618fe4863b785bbad" class="card-img-top" alt="나혼렙">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">나 혼자만 레벨업</h5>
				   	<p class="card-text">원작: 추공</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/48787313" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3207276" target="_blank">네이버시리즈</a>
				   			<a class="platform_ridi" href="https://ridibooks.com/books/777034313" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오 웹툰 / 2018. 03. 04. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/e45f45351cdbcfd02a9c564a2205b596663ee5af30e0bfc75598ca5ebfa74045e4b59c78c53335a19a6b7c2f3ac35522850bb7a4943e579ddd54f9a534ac9ee8148686ae0a759fbfc624a838f79ff8ab88fb05ee2b721deb704e4c5d673cf422561146c1e5904d615da1a255bf19913e" class="card-img-top" alt="난집">
	    			<img class="img-hover" src="https://w.namu.la/s/9544b29e88ee42313b002dd6496e5e9f58e1cd6db2944fee3a03e3ae4f55320472e2aa63430e302c1339dcfc571fd3fe515748c57cb131faa9b61e94c871bf4da61382b5e235153583e3b1aa054dce7911b321cf4a0f37340cd88c6a051c57a2b8d85ce11ed5e022652ba67bbd395555" class="card-img-top" alt="난집">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">나는 이 집 아이</h5>
				   	<p class="card-text">원작: 시야</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/50191151" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2018. 07. 01. ~  2022. 07. 10.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/e81b35cb03fa25d9fcd1163ece3a6c25263a46992321271dea7800903c434b8cb32cb2f3587a9dfaf8140d50cb8e2cb72dcad12f79c969cb1ba7445faeaedabf1be9ea4adc6178d5c54aeaf12484d93315f5b577a28fd312936632f53ad12e9bb045f71da2c27dac91d4e767e7dd88e9" class="card-img-top" alt="낙이론">
	    			<img class="img-hover" src="https://w.namu.la/s/5622bb7225cd3e3519bd8c701bce4acaacdd530af9dba2bf725bbbcaeac12686bcfd3c9176d8e5d69a7cf8c2a8cf24e696b6e211822ee31ed56af1cdd743fc936954f48d1e837ed1b38ee1012866531f927be48d4740407971a68f679d39b2624888769028b7a20acd5004137ebf5ad2" class="card-img-top" alt="낙이론">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">낙원의 이론</h5>
				   	<p class="card-text">원작: 정선우</p>
				   		<div class="platform_logos">
				   		<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3762587" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2022. 03. 15. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/b19104f4656224a6b85540c4af05f7ecb2670bc9b8a9cc9d6d2267abfa7621e0931447bb17b60ce2cf85d85a6898f6408745c19faeb6addca432affb08f492911fcd9e7110ce53dade8c9ad8f28672b1b8e9954c456a41104c0fddeb07f820e3e6661b4b9fa9dba6a740a62ccffb7022" class="card-img-top" alt="남미모">
	    			<img class="img-hover" src="https://w.namu.la/s/fa5a7583f1f66320a1c22bc2e05a7232af296414d90f2adc54c20ca3028daabe88e9a9c6a9c5bd045fe029ce6f1b68996341479d782b4f8524f7e43e5dd6f2eec3b0de102149ad9479f0bf5969b9f940a6e9721bf34859662e64c9d8b20b8d60c372fd15632f9560e5da84486827f92f" class="card-img-top" alt="남미모">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">남편이 미모를 숨김</h5>
				   	<p class="card-text">원작: 정연</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53030850" target="_blank">카카오페이지</a>
				   			<a class="platform_ridi" href="https://ridibooks.com/books/3170013652" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2020. 08. 31. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/2035b460a20ceb8a9d739e624769db24dd769aa1006868e86d34be79a1b9afa9a06951ab7d24aac23bd79aab21a6ceeb8199706c12eb764db52cdf833c99d49c0cb854562ddd34f9624f389b9e6215b0ee2722a7ac1f5c9d705dfe8aea6d6be433a8a97699daa0d8a6233a0efac16433" class="card-img-top" alt="내스급">
	    			<img class="img-hover" src="https://w.namu.la/s/e5ef1cd1c06bf8dc788e2f4282a64aa53b193de483ad5ad758faea0ca47b7f26dda370bd1333b9b463173d0699ec8852ecf59609ad11668c7746d94a8f4f71307118be3dc46c341f918b42f6c7cfd56859fd724145bf4a49f8a789549e181135307a2110847758110793db1f1cc12aed" alt="내스급">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">내가 키운 S급들</h5>
				   	<p class="card-text">원작: 근서</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/52468302" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3777351" target="_blank">네이버시리즈</a>
				   			<a class="platform_ridi" href="https://ridibooks.com/books/2065016312" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2021. 11. 16. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/d1c1af8e9f5731774815771a286211e2810051c04155c870e73ebc42b6d83e1085a37f63ee63cf4ac810e301987ba36e2e1727a7fc758c9a96a9d5d1ca68c995e285c4d0ccefab2c9b8ea7c23bd709757d9adf4353ce6b0ad802ede01e583a8d6d2fb5536ee9ef93a0837be947a79463" class="card-img-top" alt="네죽바">
	    			<img class="img-hover" src="https://w.namu.la/s/619f70cc76e08ddc3d8df8a1cfb08527c4681d03075f5d6f917dbec9f598fa864975020a7a23d02187ef13568a4b57ffd74f58684149c6d4341a8c94a941a1044dbd1908fde4b573c29287fb07ef862da061a73abab57ae1266502e9a96198e78f64c443a2a5aded42b59243e06d3750" class="card-img-top" alt="네죽바">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">네가 죽기를 바랄 때가 있었다</h5>
				   	<p class="card-text">원작: 진서</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=5041906" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2021 .07. 28. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/75fd5851385e5dda94338ec431db639e51fb0d28534541f8f597300929ad75cf83bc76783321e33faa7ac8db4d24116fc18e1c9a0508a563cdac98e53ec107b940ad07c9b0facc95a9642c1cf07c720507540fe0e0dfb743d9d4b8ce33e7438f802a31f47d20dbad78ca7d1340c7d828" class="card-img-top" alt="녹음의 관">
	    			<img class="img-hover" src="https://w.namu.la/s/1d1c583f5176e4e8952c9d231f15087354996a7ec6f79c0a97c9de3937a9f78f86444769be557bb06834a02abcda6093b574693af4b963aaf19fa5facfe4f725373540cdfedfd360e7d2b3fc01835cb77244b609624621f70dcd7cbad70d53b46e13c020e2641080d6d2263a23a26120" class="card-img-top" alt="녹음의 관">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">녹음의 관</h5>
				   	<p class="card-text">원작: 시야</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/50666878" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오 웹툰 / 2020. 10. 29. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/670792f748f493859bf8e99550d02f18b223e6cc0841f5dd18d6a80dafb5d91a3dcc1c686e8312985e345ab16381b258a69efe25b056fb611d5ce118f2650fee09fb88b1090058437517046406fd1427bc45ae74690bc1b799c4ea077979554f" class="card-img-top" alt="다정한그대">
	    			<img class="img-hover" src="https://w.namu.la/s/741472292074a607a56b0e06b0842cbb77d453e5af7a67ecfdbb43fbdab4c2f67c75b0fb2308f876e376cb73a12814f9497fb7c9254719ac98022f8fdd732dc09c16c9a00d5d26ac0f8d58e8e13dc972bbff97828043235b2d51ff0a0deac582ce3d9118b3209a10d81dc4c76c842b64" class="card-img-top" alt="다정한그대">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">다정한 그대를 지키는 방법</h5>
				   	<p class="card-text">원작: 마약젤리</p>
				   		<div class="platform_logos">
				   		<a class="platform_kakao" href="https://page.kakao.com/content/53523877" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오 웹툰 / 2021. 03. 20. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/2a20f908adf5d6b3330e5bcf600016c274a0a5a200b0bb8b2c70fa37c9e3909f352ca658c7bcf916ac0fd2f3dfbf84c480d3f9575306391af3a9c1cb723102257491e2dcab02d30341e4398c5eca3e5c97a28b1e289a719ab61d2d558ecf53ccd85697693320ea9918f7fd1ba61e3990" class="card-img-top" alt="닥터최">
	    			<img class="img-hover" src="https://w.namu.la/s/d4f118769366b9dce18e55c120133bb8a25f8814ecf2b6109e5df96012e62d460efeefa57609badc7e2384050f832753afd37c74b45da131996e95e683ccee2421af1e9d8b7c9c4c071a43cfa6f93019cf96a35d47364a2402e04c73a2add3df953e76b603ce06023f0f1346767b0a38" class="card-img-top" alt="닥터최">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">닥터 최태수</h5>
				   	<p class="card-text">원작: 조석호</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/47495746" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=1870800" target="_blank">네이버시리즈</a>
				   			<a class="platform_ridi" href="https://ridibooks.com/books/2299000001" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오 웹툰 / 2017. 05. 02. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/bd1c9214d95f1931fa8757b0aa328019c5492e8d3af4a91f8859f31099649ce3db2acb1bddee49cf44bd2cf8a98b15953ae3455ee97ee1f5ecbe0640d38e81cd3c7c7ee191d8a3af2c34ea0883abfb1f53a879046cd5e43bda5a00ed123379ec0425d34b2ccb751888e4562057d278d5" class="card-img-top" alt="달조">
	    			<img class="img-hover" src="https://w.namu.la/s/337106400c1841f90b1359ecfc2a538aac7aae8264182d8d0aa3a9d068d1a3b9fd3cbd0733d5d573281b35e3116136b99642ef0eaa8b872387123b50483dcf86906bd2f0e0e104b2f4799511e7dd3da7d9107bbf325d41537f5e43863084abd0c77e57ca39f219eaeae500728a72e839" alt="달조">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">달빛조각사</h5>
				   	<p class="card-text">원작: 남희성</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/29226849" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=1315886" target="_blank">네이버시리즈</a>
				   			<a class="platform_ridi" href="https://ridibooks.com/books/1377010394" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2015. 02. 16. ~  </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/e8bd12e2a6b9bfd97cc137a89fd4d79377cf4322cdbd9080dbbc9874006fb678434adbc56000d3a2a74b9ec8d3cb71186b22212afccc6a83c5b8669a03ab8e5d1ae9745447f94c1fb217682d8bc90e5dac559e87fa72c3ae2d76e3d7e8a4e489b358fd996cc783b9fe18b04aef098833" class="card-img-top" alt="당이돕">
	    			<img class="img-hover" src="https://w.namu.la/s/34352e2394f658bbd7c1208a0ddd4928dfcbf31e37e06b822e6868be84e8f622f4dbf7bb9c0437c2718c43f67afabb5699c51644039d6e52d94184a76954aa7aa236a8e0bb6375a80c1f30a0a8c338fc0855d54789f81782444138da8fad7f75ce0ee372ae5d7ec0d117e9e549ca82a5" class="card-img-top" alt="당이돕">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">당신의 이해를 돕기 위하여</h5>
				   	<p class="card-text">원작: 이보라</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53706168" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오 웹툰 / 2021. 03. 02. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/af16fef6ad2c3bed68355db028b9a7e3f96fa06bb92319b616065d07bb9857e93c967a18e0edbdf1796cab08d538b1e6b95087ad0ffa060317b10394097600715ae370993b00a307d2ea67c845df943b49696d945eeb2c64f3ae1b155c385a6575ed7a9e6797d079d253d3e4dec26398" class="card-img-top" alt="대마법딸">
	    			<img class="img-hover" src="https://w.namu.la/s/5298e8394d842dc432197f88293ba9114f9c0b4cff91b20456907af0830d2dd7ba0d154e3b5edaa056eb5b8e8df23c93b2058cd9086a3a54ac748ee4aeab85f9eb85855e15054691fb138a20b357b49b1a081f44ccfd3770886419a79771b0dc52bdeb9aab6c2a8c66309f9c3adc0818" class="card-img-top" alt="대마법딸">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">대마법사의 딸</h5>
				   	<p class="card-text">원작: 문설아</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53614998" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오페이지 / 2019. 10. 12. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/cdbbcf92c335967e347497d09656802da8504f66f20ce8e206257d9043d16290e7072be33752ffe49b05ddd79168c5eb9a45030cb656e05e8aa30a539ce40bbccd58c66d2445cfe970dab7822542f66710ec2835503bf02d12d4dda78033369149fd6ea5e70427bd68f5ce836b77b0f2" class="card-img-top" alt="데못죽">
	    			<img class="img-hover" src="https://w.namu.la/s/aed28a712aa9f45718163ffe7896d3670ca32ff30ecdfb137bf8740b95815b5d6aad6ebb31133dd922a9c7e7627953166379dfa600bc0c10d3cea29c088134631facc3f5230db973a5fc8d21716bf9cabb5701d784203c090d0607ba6130b667ea85262180c666ae89950b6e7c18549d" class="card-img-top" alt="데못죽">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">데뷔 못 하면 죽는 병 걸림</h5>
				   	<p class="card-text">원작: 백덕수</p>
				   		<div class="platform_logos">
				   		<a class="platform_kakao" href="https://page.kakao.com/content/56325530" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오 웹툰 /  2022. 08. 01. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/aba8963a8d8a0fff0fad3431dc18ef9999c1e48f60f3300001b00f2ed59313bfc07bf65d349b4ef72f58d45d9f07a4a5e14380b2b27e0d9d22f40c2d5ac0815842c15f1a47e35bf6466dc6e0332b0846c4cc507b4d7bd62b2c7fb5e0a2f466f535c05487c11addb8bc461714063d22fd" class="card-img-top" alt="두랭">
	    			<img class="img-hover" src="https://w.namu.la/s/f32644542de706adbbe008a4349288aca5299b2dec1c544f647b127f7433e72c996a4e17b487715b2e69e908feca5f73eb4dc920be6891ab05879a4f12600066b9b931448c53e28df94de93ed03edfd00bcdf6a0de10ee5919f0c542ac3bd8f94d99bf1b140636e85c54ae15d72c9ebc" class="card-img-top" alt="두랭">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">두 번 사는 랭커</h5>
				   	<p class="card-text">원작: 사도연</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/50353143" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오웹툰 / 2019. 05. 16. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/8345b9663f47d6f1a5da466e9b457538061ae2b6a974035519760eec75b68c630adc0b7b0c2d5a3129476a5dc53fd72fb11c3d48f1be11886afac8b341d58c266dbafbeb0bfb788c0d686c7640f41f63ce880b3839e3836dd611c2ba7bdea3ec4902042e392d659028d0b7917147f5c6" class="card-img-top" alt="뜻하">
	    			<img class="img-hover" src="https://w.namu.la/s/60652931de61fe5f5391e7a5dcd696726fbc9a5b9ca51c084fd8431bb6e9ea66e58a26af344b9761b5ec27af46e1a7ddd82b4bea7f5c1e6053011dedb11dfe1a06bd17c3cab09f0ea06d25a5eb003e4961588cae96f25659ca30f64ad0407ab6556c4702a5f68f9ea977eea19e433d05" alt="뜻하">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">뜻대로 하세요</h5>
				   	<p class="card-text">원작: 권정아</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/48895658" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오웹툰 / 2018. 03. 06. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/65fba6663f3f87d9991ced9952b979e7734356e1788d1d4eec416d3cfd45f5516e23d2ab0c5fdfbed720e4f37bac22c5ee8ddd5df1808ff054a84659523ec8ccc38701cf05e1284a45944f7f72c757d40dffb0818264e22bd84eb63aad6fbc5b1ff44e1be4f02e2570c11ebe4e0a83a9" class="card-img-top" alt="레베">
	    			<img class="img-hover" src="https://w.namu.la/s/a1c96de666a6d854b967dd89469fbefd4bfc99f174de39dc6b34cc828ba166d83aa06323b3677666d959a7655354fe768a4900d7aa58fd4ee11e061a7b615c9dd9922d571d97232339a3f8e4af0f4a25f4b11a9cb5a06cc5b1bfddd2a6622bdb8a3f93fee8415d5e3bec3ded6a18184c" alt="레베">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">레이디 베이비</h5>
				   	<p class="card-text">원작: 주해온</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/50227496" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=6620107" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오웹툰 / 2018. 09. 07. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/9d440e6e320b1577a0cae9242f9b4b81ab00c8450be39931271a9fe990f9548ccbab8b7a18c29a8ac6a1ad414c5aeb8a0f3a190d2b8afc5efbc844a8592d7cee4667cd2801006cc652cf86284387fa79190c7146673d09cf7cf0970e04248166520b89710e086b546d885450e8e8873a" class="card-img-top" alt="마른가지">
	    			<img class="img-hover" src="https://w.namu.la/s/17ab8d0c6567454b1ef29eeaf7391c7895f54f073f804cde2836a177b52fe8adf36751141066175d088b22e719cf4a031a0a2be995b5ad1ac5464a317db603ba68467f8fa9f2f1435c63c00889a4ed5a3e12eb9a8b2537936100c2579840843220af4f2a9aab8e468efd8558e7869fd6" alt="마른가지">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">마른 가지에 바람처럼</h5>
				   	<p class="card-text">원작: 달새울</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://page.kakao.com/content/48895658" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버 웹툰 / 2020. 09. 16. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/e001fea7a134f3321d2330bb82b3c55743cd527598a71e7a89ac2aba04cb518e59e4dda196612234233d78f4694806352d6983a35b05fc38b78b74d3730f6d739be544eb25ab45b1d54879acd7bdb678462d1a18aa4e9e9b0080371bcf2a5ff6bf9b78287e8490a37d5b33955b326761" class="card-img-top" alt="만렙부터">
	    			<img class="img-hover" src="https://w.namu.la/s/2b17d54ed18b9bb4579687416e620efa03ad3c7c925f6ea5e8a5b77fdf2f687eaff459a2dcbc6cdb824cec3108c46b789ddcb436f076d462f9d9e12c61cdac4ec0c31d46504a389840eb07ebd6b4db75f819a95ef0c49ff5dbd0165caafe3d5416d3be8b48f3469769b16d34f282f1e8" alt="만렙부터">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">만렙부터 레벨업</h5>
				   	<p class="card-text">원작: 해무극</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/50740194" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3131291" target="_blank">네이버시리즈</a>
				   			<a class="platform_ridi" href="https://ridibooks.com/books/2065007219" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오웹툰 / 2021. 11. 30. ~  </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/d820b3bd0b3791b1e5ca4d439c2dd18facca2a86483609a0d118e797ccb561e5b61df8cd1e4a35040fa37d2e8c770d45f574f82167992a60b8b23d7abd9ad8bf640075a1f39e6f7aaaf8dc2324fcee871f49919c6434cd60854c11aa6c136884d6860fb492e7249617ec55b4f87c56e0" class="card-img-top" alt="백망되">
	    			<img class="img-hover" src="https://w.namu.la/s/6f8246a018cef77aa664634ba6781d4caf0ea01b46db2ec1ea16bb9626497fe5fd626135209b426816d4728da531bee439443b7ea4e07fd47a681ba8d30dce684811f7114d191d0a8b5f453866c0a73b28d5d7f4805c23cec31c27a37ab073b7eba02d01c42b03d55f97ab75669010c3" alt="백망되">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">백작가의 망나니가 되었다</h5>
				   	<p class="card-text">원작: 유려한</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/51863028" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3522708" target="_blank">네이버시리즈</a>
				   			<a class="platform_ridi" href="https://ridibooks.com/books/875103701" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오웹툰 / 2020. 09. 01. ~ </small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/fc3898f0f2a6400fcc71ddc79386f5075df1653b136abc447ed079f2c60f47d7135286d8794ecfd94b32ca031da60025ea9c92d005dc8da132b214c2667f29b05080d68d081a82ba5fd16f18ceb462c9d7063517e994ec551de459882fc92a50814ec243a3b68b7bd97bcf053abfbd6f" class="card-img-top" alt="버림받은황비">
	    			<img class="img-hover" src="https://w.namu.la/s/d6f8443ed2bfe2e05d390862645203e9d34b07a1e07d292ee6f9a029f009001aaacc73717e2350e28eeab85a6ad894a5eff5bd1035f4b4d1608a63c4863c188017eaae05f9330b329d2eeda000709a44ade1df11e0d858fcd9a57951ada4329fd707a0e139ba293bc2960334e7088ca9" alt="버림받은황비">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">버림 받은 황비</h5>
				   	<p class="card-text">원작: 정유나</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/46790791" target="_blank">카카오페이지</a>
					   		<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=2144645" target="_blank">네이버시리즈</a>				   		
				   		</div>
				   	<p class="card-text"><small class="text-muted">디앤씨웹툰비즈 / 2017. 06. 11. ~ 2021. 03. 09.</small></p>
				</div>
			</div>
			<div class="col">
	  		<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/0c56c884f0385d60e69a1cf4722ea5af15dedd4a93b6089fbe51b1db24ec5faf9d13d3e6ff4ff2100d3422ff4ba79112797c72c42124bfe453845a890d4fc7fbd58989538b8ab9e4037f1b689048cc443492c0ed936169f21dabd239a9a84ad2c0eca0159481221e68d3c46ea7118c43" class="card-img-top" alt="빙특혜">
	    			<img class="img-hover" src="https://w.namu.la/s/5dc7bfc294b8d258b60b276f63b6e2bb7ef978e44286f1dcd8d9ec2f4a0039ddbb68aa55105d55bd0a783505fa0b8fd6ae353eef2b8fef3fb6992b40fd88f52828180894134e8ecb0100be53784ed4b75d2eb72e0253b1bdc2e9bdb5812e38513b23fd9b3f8ffea3a8adbec41b0f1104" alt="빙특혜">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">빙의자를 위한 특혜</h5>
				   	<p class="card-text">원작: 이린비</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/56908119" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오웹툰 / 2022. 03. 31. ~ </small></p>
				</div>
			</div>

<!-- 버튼 클릭시 상단 이동 처리-->
	<div class="down">
	  	<ul class="pagination justify-content-center">
	      	<li class="Dotebtn">
		      	<a class="downbtn" href="#down">
		      	<img class="dotebtn1" src="../images/dote_button1.png">
		      	</a>
	      	</li>
	      	<li class="Dotebtn">
		      	<a class="topbtn" href="#top">
		      	<img class="dotebtn2" src="../images/dote_button2.png">
		      	</a>
	      	</li>
	     </ul>
     </div>
</div>
</div>
</div>


<!-- 드라마 -->
<div class="tab-pane fade" id="drama" role="tabpanel"><br />	
	<div class="container">
	  <div class="row">
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/c746f5e2b8773ba4d3720209935b6faf58ae0e6de0a64a24888a8738716fbb6d0d97dd14efe5f9214f5b5ce4c7eedb00a0457a42c76c6124a007d4cfdc017a7920ca6d957787695fcc07db188c7db1e23a78702829997f185a989fadca082f1c105d48abd9a9b58c6ba46f2df94e318d" class="card-img-top" alt="구르미 그린 달빛">
	    			<img class="img-hover" src="https://w.namu.la/s/5581381c7d782a3acabef4283d6d24aa893b592abcbe948db4de1536458192b3054b0079c6114e6c3c239beda5efed330516408d8c820833aaf74a322e13a7390e1b2ea435043c602403b29225e39eb7a1d640870624950722a45c92511bbdaa4e2360c0211b8f0c93fd84b68852c66f" class="card-img-top" alt="구르미 그린 달빛">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">구르미 그린 달빛</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=1200383" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">KBS2 / 2016년 8월 22일 ~ 2016년 10월 18일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/6abb472d287b34cb6a893df1c9f664b8c57e57145d5f395469cde6898afb95c63f6d521102f2537ebc81536ad5fa9315c5f86725d8712313fd3b6ab1683c10cc8bac037a8739240138e1927464307da684eeac3f335c86170cd4095c35a847e92cf60ef7cc8c02e006490b99eb699049" class="card-img-top" alt="그녀의 사생활">
	    			<img class="img-hover" src="https://dn-img-page.kakao.com/download/resource?kid=ZzPyP/hyqDoGyCpQ/kpvdGRjySRNWqff4YhWwSK&filename=th3" class="card-img-top" alt="그녀의 사생활">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">그녀의 사생활(원작: 누나팬닷컴)</h5>
				   	<p class="card-text">원작: 김성연</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/52346452" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">tvN, Netflix / 2019년 4월 10일 ~ 2019년 5월 30일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/36cea50ee5f250fd23b66ba7a513182d23102303b30e723ea580a0aed3ebf7f949e2d2b3cf9f7b97dacffe2c31b538d6fc038e13eaee3b32a06e6725fc0ebb3de10345a8079f04910f5ddd7c879b9908081c130faca51bd2f623226e8be45d73dbc8d5d3b4cd0299d21038db2cceabe2" class="card-img-top" alt="그래서 나는 안티팬과 결혼했다">
	    			<img class="img-hover" src="https://w.namu.la/s/4ba616adc01754b8fef2072ab30289a357d602b0f850c60103902eb17da68caef78f616f067999ecc1ec0326116a7949c67409d3b42510d2f7e3b540fa6da8e8f59c04d895ad0a352da208a1e6019490a29a3a8e2b24d5eb1022ae64400c96d98466fd2b667dd577ba8161ed9b060a20" class="card-img-top" alt="그래서 나는 안티팬과 결혼했다">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">그래서 나는 안티팬과 결혼했다</h5>
				   	<p class="card-text">원작: 김은정</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3821459" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">네이버TV / 2021년 4월 30일 ~ 2021년 6월 19일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/0f4bec8b7b47e3b200a16d896ae291d480198462bf2b6e1e3ed2ce54c85bde2ee8221f36a549c620eaca806395118f5abf79c725f893ca190299f63c1ce7571762fb58d1be5ed9c8cfa801be5b152cbf356b0b5de53f9be04ff55d26abc1fe9a6705dfdfeccbae6813d18f606b29bad6" class="card-img-top" alt="미남당">
	    			<img class="img-hover" src="https://dn-img-page.kakao.com/download/resource?kid=kYC0L/hzCthIW02z/hOmULRM3wLoTCkkCKbyLE0&filename=th3" class="card-img-top" alt="미남당">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">미남당(원작: 미남당 사건 수첩)</h5>
				   	<p class="card-text">원작: 김은정</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/50963278">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">KBS 2TV / 2022년 6월 27일 ~ 2022년 8월 23일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/7cd3a49b273af08c96914c448cc000327760da768138185c2bee830d320f354acdaa096e28302d38654f3750cf2f93820e318e7bedcf35df9c6fe54d50968451da36a3826ce28f92eb7e375684612f258eee6846bce1e146af836bd99d7768c3e24ed060f9159ee5b6cd7fb89016497e" class="card-img-top" alt="미스터 백">
	    			<img class="img-hover" src="https://dn-img-page.kakao.com/download/resource?kid=NJAUKBxTWnebMJY2&filename=th3" class="card-img-top" alt="미스터 백">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">미스터 백(원작: 올드맨)</h5>
				   	<p class="card-text">원작: 이조영</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/46609541" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">MBC /2014년 11월 5일 ~ 2014년 12월 25일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/cf7087fc48efde017d1fc930070f77eaee53b0bff21635865344c9b0420a0a205b3f20ba64c3ec2d61dfbcc6fabc75e658b69c506637477eec815a04fb925b63539c487576490ad59f7ca5f2d42ce662d2aeecf3099159b08063c8f60902382536277f8b622fca61e337712cdb1ebafd" class="card-img-top" alt="법대로 사랑하라">
	    			<img class="img-hover" src="https://w.namu.la/s/3a0e832312e4d574ccb14b1e0cf7dad3275ac5a909a79a707f1385593da625c4823535c23eb5f9d07658328a9c68c3a670ca3e4e01f9ebd6a31626e2c7c6b01dd142d5080f968919fb551244a5a464dc7bd89bb3407e3ccfba3898c6e843240a7550a133cc6bf62f167a5a9744009cc1" class="card-img-top" alt="법대로 사랑하라">
	    		</div>
		   	    	<div class="card-body">
	      			<h5 class="card-title">법대로 사랑하라</h5>
				   	<p class="card-text">원작: 노승아</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/comic/detail.series?productNo=4492878" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">KBS 2TV / 2022년 9월 5일 ~ 2022년 10월 25일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/ee6cd754f4ef97019c725d78807d59b1465838196d7f7fd4e0493fe1c69447f66d2db334707ee16f4b47242b15219208825e490f74ccca711958ab0a009e2d747cf177a5b0daad21a0d37261905ef93e1df425be1f433b2f7e593cbcfe514249c08e427d8d1507ce3c697a1357a48b11" class="card-img-top" alt="사내맞선">
	    			<img class="img-hover" src="https://dn-img-page.kakao.com/download/resource?kid=b7A8j8/hyfOCvvyPK/yOKdCSZKbs3ilWhcyVpwQ1&filename=th3" class="card-img-top" alt="사내맞선">
	    			</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">사내맞선</h5>
				   	<p class="card-text">원작: 해화</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/50127648" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">SBS / 2022년 2월 28일 ~ 2022년 4월 5일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/63587e98ec34a70f83afcbc61ded17c641da09db0a0c31777d6b05d489fa691ea30f7997dadc5938012c9b4369d78f7f561fc430b613824af5b4e7512dd0d0bf2319f44f8a8c5061c3c9ded9fac97c3a128b0aaff8e0ffbce98143c78aac6ff2c74755716282c85ea99f441427721327" class="card-img-top" alt="설렘주의보">
	    			<img class="img-hover" src="https://dn-img-page.kakao.com/download/resource?kid=ckHx2M/hynF1ODxNU/U05cAsBQt1JA1B6aOyHIFk&filename=th3" class="card-img-top" alt="설렘주의보">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">설렘주의보</h5>
				   	<p class="card-text">원작: 서한결</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/51988062" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">MBN / 2018년 10월 31일 ~ 2018년 12월 20일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/c041f8b42b62403930217c3e4275135f984ec8732912b9a468ee1ff305f1323a3f66848ec1b028a86a7a7097c82ca4ee44a2e45345a96caed0f45f64794b58a3604694e9e59f52aac121a89157a1d84ea1916c7f847c3c59b362b86bf8aa71d4369009a014edb865b7b2b91da95e76ed" class="card-img-top" alt="선배그립스틱">
	    			<img class="img-hover" src="https://w.namu.la/s/c7eb187065d9b50fdcd2bc48f7c0d1c3d82ccdcd23e6baccb4679abb19902c6e1a7574d16c216ecf7f325b6199c120978a37e316bf01e77b437819f503d3917f389d8daec6f887bfd34bd739885323c4c70ef4f81924289b42438eb86045c757afadac2a95029482952db8703ad3c1ad" class="card-img-top" alt="선배그립스틱">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">선배, 그 립스틱 바르지 마요</h5>
				   	<p class="card-text">원작: 엘리즈</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3074110" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2021년 1월 18일 ~ 2021년 3월 9일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/d24893e05dcd643085eb1dfc5c0b33209cfabeaf6752b9848b82d4750b6a304295ece8e31e37830bac09e882d930fc9c33922562b966e3e8fc7f2573c1b18c96976f6d6ff92225dd0756c4d5bd5ed9ca466e2fae55d0e4d8e170a1a5dc0796a7a7613aa980768b21e643dcf05983da6c" class="card-img-top" alt="성스러운아이돌">
	    			<img class="img-hover" src="https://w.namu.la/s/0c053dab50fbd59704abbed8f8310442fcc18f10e7bc7cbb26a38a61d70c12c3a2b470275efd03f1c78c4b30fa95aadcc9694ddc483daaf031aee8b1be807da7f05a43d43050cd4eb9a1b1cb5062e96992abdd992a8e1734d5dae86bc32afcf7338a6f8771b57776d13dff3ebfe00446" class="card-img-top" alt="성스러운아이돌">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">성스러운 아이돌</h5>
				   	<p class="card-text">원작: 신화진</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4433040" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">tvN /  2023년 2월 15일 ~ 2023년 3월 23일 방영(예정)</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/29cbb98d8cacb3a1e41630dfcd668245b6b9fcf18d59574251b6fc9047f77e3914df4d1fe1aa401c226ebe089fca1d77a64ad4773b82b65f66e3a0e9d3eeeebbb8cab4b3cd6bc97ce8f893b409fcfc23466dc2096f3ec46e8dd08115e5a06ac645afe3675b3493b658d53c683282de65" class="card-img-top" alt="어게인">
	    			<img class="img-hover" src="https://w.namu.la/s/7549be7c21605f98a74035c9056838ea3cee4cb8967ab2884aaae5afae7969ce98289697fb8c38631b1d3315c01dbd919ed4462adcab3f65c82ba89303b935881b6034b16bad2952bee187913ef18f661807a35551f4e4b25dc701785b64a62ca8d7f9472d85048390d726b28b8b9cbd" class="card-img-top" alt="어게인">
	    			</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">어게인 마이 라이프</h5>
				   	<p class="card-text">원작: 이해날</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=2279318" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">SBS / 2022년 4월 8일 ~ 2022년 5월 28일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/1fa4049d03106949602b9a29415c72c8dc3dba5204402682cee2662a220e0aef73d9fbb50494f83c04636aba001f4f0a9aee70b426ca422694ea9f622f211b554047bf22e03b376a5c861bc3ce20a118f3f304af6ba0e8e7f89c794891dca4f1" class="card-img-top" alt="애타는 로맨스">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20170202_94/pocket_1486012288513RlnYl_JPEG/aeroce_cover.jpg?type=m260" class="card-img-top" alt="애타는 로맨스">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">애타는 로맨스</h5>
				   	<p class="card-text">원작: Lunar 이지연</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=2628149" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">OCN / 2017년 4월 17일 ~ 2017년 5월 30일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/214279baac902046ac5f144988c34dd60b72a401e66f49dd9966d44cd955ae786038b68f88d65bb39d9a1a11395d71e16e76979c1d4fd13bdaa98743594b44287ac1642adece8d4a7ddac3a8d4c55e53d2def1add056a89b05069a8fd077682040c3b132fe0860476b516a98c57a7172" class="card-img-top" alt="전원일기">
	    			<img class="img-hover" src="https://w.namu.la/s/58ef9a8a4c6a3cc2798518a14ec8f6f8c22b398769fbcaa92889284a3ef101b265b190b3e12331aae888b57d067bc4ae13e6635ad2bca62c302ffbc53b056e54e7683b76e1dff32e2cc49f6dd546d49235dfa76294a18e4cfbd56cd1980e647a29c0681612c797211e254699666914c0" class="card-img-top" alt="전원일기">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">어쩌다 전원일기</h5>
				   	<p class="card-text">원작: 박하민</p>
				   		<div class="platform_logos">
				   			<a class="platform_ridi" href="https://ridibooks.com/books/3866000067" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">카카오TV, Netflix / 2022년 9월 5일 ~ 2022년 9월 28일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/0eafbda9d5238d110d0da7bf69d21ab7fbbe1b6d53975c1d80b5ec62e3188dda68a8460b0ec076bdfb937431d1fa30cb3183f5ec6693c91a330de49ad15af9ce0bfeb59cfc21c27a459f23fdbff40f270bbbfdff36b24eb6bbc3a23fca67364d2dfa9ea1630626de5746efb6cfe30527" class="card-img-top" alt="옷소매">
	    			<img class="img-hover" src="https://w.namu.la/s/c89b4c05d66ca636233e406b26f22fe8d07d75b4dc2b36af56a02114cb7a56c4b04b3764b8e9125a21da7e92e5c9af8dc946cdab5865aa44d4f4b1d171418b6598639e58435ab4f3b3805e819f2556b424c7d00fcdcb2ff5eafd9060d76e68876d95ee01d2c38d914ad722774bcb9ec5" class="card-img-top" alt="옷소매">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">옷소매 붉은 끝동</h5>
				   	<p class="card-text">원작: 강미강</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=2980987" target="_blank">네이버시리즈</a>
				   			<a class="platform_ridi" href="https://ridibooks.com/books/875034849" target="_blank">리디북스</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">MBC / 2021년 11월 12일 ~ 2022년 1월 1일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/9954236e591d5312003e218eee74fabb8e350bfdf07e9785fa9495c43226f5104fb3a4db6cbbf6c5bb74f4e0394391ced7dcb565b35f27c1af5a0d86d6ce9ed6764e609c10b6cdb0a4c85768cf78acf6e8fa511e99a3a1e47ce7f44bd030256924948859d12243c37eff5bb7512b93c3" class="card-img-top" alt="저스티스">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20190930_233/pocket_1569848335380B1JJF_JPEG/__.jpg?type=m260" class="card-img-top" alt="저스티스">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">저스티스</h5>
				   	<p class="card-text">원작: 장호</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=2669298" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">KBS 2TV / 2019년 7월 17일 ~ 2019년 9월 5일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/35964636d6ddaef1f2e5dad086e352a52b69cb8cd0de619a5123a2471446b67e2cbfede04f63fdac74a9d6fa831a6435f00f65c6f2a3d9964483ae9075429a250f48b58ed3e3b9ffea785457fb0164986b72517c17b8c583c2005f0425344dd1d058bfaeafe61a290b74c00ba247a685" class="card-img-top" alt="진닿">
	    			<img class="img-hover" src="https://w.namu.la/s/1027cbad259adea12330e7b6eaa8b96f41cf11f79a707c1a628214d57b57f26af82a123e9a14f259330cac10e456f28d2ea6bf50346e9fea546f3bd41f271439da8905dac1e2d2d5fbb413594a8dae5783e0a4d5f3e83c5cd852591edd5c26e0e6f18fd5707fec909f47fa46dc0731c9" class="card-img-top" alt="진닿">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">진심이 닿다</h5>
				   	<p class="card-text">원작: 예거</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" https://page.kakao.com/content/49293547" target="_blank">카카오페이지</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">tvN / 2019년 2월 6일 ~ 2019년 3월 28일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/adb6e88ef6dafc5c0470e9371d24f4b89072d6f66d8089f4f6a3a896c80c7488762637567665a2ce3246de4f23a746b6a2c2563153be38ca2657c75402484f073e733bf8748c4efaee1f582a40ce34255f4262e9e8b9db3ca7d453faf3d51237d5a25131f3c3bf8a7f655dbf9ae45e53" class="card-img-top" alt="재벌집 막내아들">
	    			<img class="img-hover" src="https://comicthumb-phinf.pstatic.net/20221109_73/pocket_1667985002959I8coF_JPEG/%C0%E7%B9%FA%C1%FD_%B8%B7%B3%BB%BE%C6%B5%E9.jpg?type=m260" class="card-img-top" alt="재벌집 막내아들">
	    		</div>
	    		<div class="card-body">
	      			<h5 class="card-title">재벌집 막내아들</h5>
				   	<p class="card-text">원작: 산경(山景)</p>
				   		<div class="platform_logos">
				   			<a class="platform_kakao" href="https://page.kakao.com/content/53230180" target="_blank">카카오페이지</a>
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4340987" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">JTBC / 2022년 11월 18일 ~ 2022년 12월 25일 방영</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="https://w.namu.la/s/9830c56c22f0f9ba9779b7f8a13e57792adac2d6b8f3e116001f65dd23ac99e807534beb6cb2f655ca2c6c23ab9c40717786d4129e7f2ef3aba2f308fd56192a3b5b17faef5c88dbd61d7720c70a6977802ae163e6d0660cd6db6aeddab65ae6be2eca7a686f9eb53b9e66f540518d17" class="card-img-top" alt="탑매">
	    			<img class="img-hover" src="https://w.namu.la/s/21fe8f6702faf8febbdd9364048baabfa88fd7c3a6fe0c793e05d598666aea795fb5d2ffc4067fe0378a68bb562ded274ccae719ae7504c939ae5763572f75fc995589d6deade0268665cd0a1825c3aac89156b42d228aacb2571e1b1693bacb30ff04b5080f0c844f9a387b604fd06d" class="card-img-top" alt="탑매">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">탑 매니지먼트</h5>
				   	<p class="card-text">원작: 장우산</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=2467854" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">유튜브 프리미엄 / 2018년 10월 31일 공개</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="../images/noimage.png" class="card-img-top" alt="예정">
	    			<img class="img-hover" src="https://w.namu.la/s/99499fc1f52fab7eb340c579577106f1f5b93fb8d58a45dd7fde856123e63b70b0d2ff8776730f15aef1be9017a52e1176938aeb099f8267957a547470dc2a8f5d9ea0485e54330073c7ced7428776352f9fa67827f426f1319395e2f57c693c967fbc9b898767b968112de5d5c3eeba" class="card-img-top" alt="해시의 신루">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">해시의 신루</h5>
				   	<p class="card-text">원작: 윤이수</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=1776477" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">NEXT ENTERTAINMENT WORLD / 방송 예정</small></p>
				</div>
			</div>
	  		<div class="col">
	  			<div class="card-imgs">
	  				<img class="img" src="../images/noimage.png" class="card-img-top" alt="예정">
	    			<img class="img-hover" src="https://w.namu.la/s/04f8694484cc56e485ebdb27a2e360191db7d3d1fc30ada8283df828ef6f8afe9882cf7dcde77a418014a12408e730d3f3a6033e8721e6738b6f106becaf2a2028cc7eabe90a740fecaf063087cf844e0a562e5b586688eb25bdad319872d4b61878915f7350471f7624b916e02288b4" class="card-img-top" alt="열녀박씨">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">열녀박씨 계약결혼뎐</h5>
				   	<p class="card-text">원작: 김너울</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=4744863" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">MBC / 방송 예정</small></p>
				</div>
			</div>

<!-- 버튼 클릭시 상단 이동 처리-->
	<div class="down">
	  	<ul class="pagination justify-content-center">
	      	<li class="Dotebtn">
		      	<a class="downbtn" href="#down">
		      	<img class="dotebtn1" src="../images/dote_button1.png">
		      	</a>
	      	</li>
	      	<li class="Dotebtn">
		      	<a class="topbtn" href="#top">
		      	<img class="dotebtn2" src="../images/dote_button2.png">
		      	</a>
	      	</li>
	     </ul>
     </div>
</div>
</div>
</div>




<!--  영화 -->
<div class="tab-pane fade" id="movie" role="tabpanel"><br />
	<div class="container">
	  <div class="row">
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="../images/noimage.png" class="card-img-top" alt="예정">
	    			<img class="img-hover" src="https://w.namu.la/s/36b192b3cc6cbe898437ed45a25fead31c38181c46e3d72899d50e4cfe87d3b9a124349762040674e2109d555b369968472ae4bb9477fab8dea72ff6d2a535e7cfbf6675754584d2690e21b7f1d0eedda69f3205c88e3acf699eaae8e14fc80053037a524725b28225ad206a486bee0d" class="card-img-top" alt="전독시">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title">전지적 독자 시점</h5>
				   	<p class="card-text">원작: 싱숑</p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="https://series.naver.com/novel/detail.series?productNo=3400123" target="_blank">네이버시리즈</a>
				   		</div>
				   	<p class="card-text"><small class="text-muted">리얼라이즈 픽처스 / 총 5편 제작 예정</small></p>
				</div>
			</div>

	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="../images/noimage.png" class="card-img-top" alt="예정">
	    			<img class="img-hover" src="../images/noimage.png" class="card-img-top" alt="예정">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title"></h5>
				   	<p class="card-text"></p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="" target="_blank"></a>
				   		</div>
				   	<p class="card-text"><small class="text-muted"></small></p>
				</div>
			</div>

	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="../images/noimage.png" class="card-img-top" alt="예정">
	    			<img class="img-hover" src="../images/noimage.png" class="card-img-top" alt="예정">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title"></h5>
				   	<p class="card-text"></p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="" target="_blank"></a>
				   		</div>
				   	<p class="card-text"><small class="text-muted"></small></p>
				</div>
			</div>
	
	  		<div class="col">
	  			<div class="card-imgs">
	    			<img class="img" src="../images/noimage.png" class="card-img-top" alt="예정">
	    			<img class="img-hover" src="../images/noimage.png" class="card-img-top" alt="예정">
	    		</div>
		   	    		<div class="card-body">
	      			<h5 class="card-title"></h5>
				   	<p class="card-text"></p>
				   		<div class="platform_logos">
				   			<a class="platform_series" href="" target="_blank"></a>
				   		</div>
				   	<p class="card-text"><small class="text-muted"></small></p>
				</div>
			</div>
	  		
	  		
	  		


<!-- 버튼 클릭시 상단 이동 처리-->
	<div class="down">
	  	<ul class="pagination justify-content-center">
	      	<li class="Dotebtn">
		      	<a class="downbtn" href="#down">
		      	<img class="dotebtn1" src="../images/dote_button1.png">
		      	</a>
	      	</li>
	      	<li class="Dotebtn">
		      	<a class="topbtn" href="#top">
		      	<img class="dotebtn2" src="../images/dote_button2.png">
		      	</a>
	      	</li>
	     </ul>
     </div>
</div>
</div>
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