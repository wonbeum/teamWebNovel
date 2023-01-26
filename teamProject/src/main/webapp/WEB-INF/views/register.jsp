<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.nav-scroller {
	border: 1px solid black;
}
</style>

<script>
	// 입력값 검사
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

   	Array.prototype.filter.call(forms, (form) => {
    	form.addEventListener('submit', function (event) {
       
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          
          // 비밀번호 확인 다를때
          if(document.mainform.password.value.trim() != document.mainform.password2.value.trim() ){
        		alert( '입력한 두 비밀번호가 다릅니다.' );
                event.preventDefault();
                event.stopPropagation();
				return false;
          }
			
          form.classList.add('was-validated');
        }, false);
      });
      
      document.getElementById( 'nicknamebtn' ).onclick = function() {
    	  if(document.getElementById('nickname').value.trim()!='중복'){
   	    	  alert('사용 가능한 닉네임 입니다.');
    	  } else {
   	    	  alert('사용 불가능한 닉네임 입니다.');    		  
    	  }
      }
      
      
    }, false);
	
	
</script>

</head>
<body>

<div class="container" >
  <header class="blog-header lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">
        <a class="link-secondary" href="./main.do">사이트 로고</a>
      </div>
      <div class="col-4 text-center">
        <a class="blog-header-logo text-dark" href="./main.do">사이트 이름</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="./novel_search.do" aria-label="Search">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a>
        <c:if test="${signIn == null}">
        	<a class="btn btn-sm btn-outline-secondary" href="./login.do">Sign up</a>
        </c:if>
        <c:if test="${signIn != null}">
        	<div class="dropdown text-end">
        		<a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
        			<img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
        		</a>
        		<ul class="dropdown-menu text-small">
        			<li><a class="dropdown-item" href="#">New project...</a></li>
        			<li><a class="dropdown-item" href="#">Settings</a></li>
        			<li><a class="dropdown-item" href="#">Profile</a></li>
        			<li><hr class="dropdown-divider"></li>
        			<li><a class="dropdown-item" href="./logout.do">Sign out</a></li>
        		</ul>
        	</div>
        </c:if>
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="./rank_list.do">랭킹</a>
      <a class="p-2 link-secondary" href="./review_list.do">리뷰</a>
      <a class="p-2 link-secondary" href="./novel_list.do">웹소설</a>
      <a class="p-2 link-secondary" href="./board_list.do">커뮤니티</a>
      <a class="p-2 link-secondary" href="./origin_list.do">원작 소설 찾기</a>
    </nav>
  </div>
</div>
	<!-- 본문 -->

	<br />
	<br />
	<br />
	<div class="container-fluid">
		<div class="row justify-content-md-center">
			<div class="col-md-6">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" action="./register_ok.do"
					method="post" name="mainform"novalidate>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email" name="email"
							value="" class="form-control" id="email"
							placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>


					<label for="nickname">닉네임</label>
					<div class="input-group mb-3">
						<input type="text" name="nickname" value="" class="form-control"
							placeholder="" id="nickname" aria-label="nickname"
							aria-describedby="button-addon2" required>
						<button class="btn btn-outline-secondary" type="button"
							id="nicknamebtn">닉네임 중복 확인</button>
					</div>


					<div class="mb-3">
						<label for="password">비밀번호</label> <input type="password"
							name="password" value="" class="form-control" id="password"
							placeholder="" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="password_check">비밀번호 확인</label> <input type="password"
							name="password2" value="" class="form-control"
							id="password_check" placeholder="" required>
						<div class="invalid-feedback">비밀번호를 다시 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="password_check">성별</label> <br />
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="inlineRadio1" value="man"> <label
								class="form-check-label" for="inlineRadio1">남성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="inlineRadio2" value="woman"> <label
								class="form-check-label" for="inlineRadio2">여성</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="inlineRadio2" value="closed" required> <label
								class="form-check-label" for="inlineRadio2">비공개</label>
						</div>
					</div>

					<div class="mb-3">
						<label for="birth">생년월일</label> <input type="text" name="birth"
							value="" class="form-control" id="birth" placeholder="8자리를 입력"
							required>
						<div class="invalid-feedback">생년월일을 입력해주세요</div>
					</div>


					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입완료</button>
				</form>
			</div>
		</div>
	</div>


	<br />
	<br />

<hr class="footer-div">

<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="./rank_list.do" class="nav-link px-2 text-muted">랭킹</a></li>
      <li class="nav-item"><a href="./review_list.do" class="nav-link px-2 text-muted">리뷰</a></li>
      <li class="nav-item"><a href="./novel_list.do" class="nav-link px-2 text-muted">웹소설</a></li>
      <li class="nav-item"><a href="./board_list.do" class="nav-link px-2 text-muted">커뮤니티</a></li>
      <li class="nav-item"><a href="./origin_list.do" class="nav-link px-2 text-muted">원작 소설 찾기</a></li>
    </ul>
    <p class="text-center text-muted">&copy; 2023 개발 못하면 죽는 병, Inc</p>
  </footer>
</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>