<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	.nav-scroller{
		border: 1px solid black ;
	}
</style>
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
review


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