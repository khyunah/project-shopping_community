<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix = "c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Fashionism</title>
    <!-- Latest compiled and minified CSS -->
    <link href="${path}/css/styles.css" rel="stylesheet"/> 
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js -->
    <link
      href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
  </head>
  <body>
  <c:set var="roleUser" value="USER" />
    <nav class="navbar navbar-expand-md bg-white navbar-dark">
      <!-- Brand -->
      <a class="navbar-brand" href="/">
        <img src="/image/logo.png" alt="Logo" style="width:40px;">
      </a>
      <a class="navbar-brand text-dark" href="/">Fashionism</a>

      <!-- Toggler/collapsibe Button -->
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#collapsibleNavbar"
      >
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Navbar links -->
      <div
        class="collapse navbar-collapse justify-content-end"
        id="collapsibleNavbar"
      >
        <ul class="navbar-nav mr-5">
          <c:choose>
            <c:when test="${empty principal}">

              <li class="nav-item">
                <a class="nav-link text-dark" href="/auth/join_form">Sosial</a>
              </li>
        <li class="nav-item">
  			<div class="dropdown">
			    <button class="nav-link dropbtn bg-white text-dark">Store 
			      <i class="fa fa-caret-down"></i>
			    </button>
    			<div class="dropdown-content bg-white">
				      <a href="/">Man's</a>
				      <a href="#">Woman's</a>
				      <a href="#">Accessories</a>
			    </div>
			  </div> 
			</li>
              <li class="nav-item">
                <a class="nav-link text-dark" href="/auth/login_form">Login</a>
              </li>
              <li class="nav-item">
                <a class="nav-link text-dark" href="/auth/join_form">Join</a>
              </li>
            </c:when>
            
            <c:when test="${principal.user.role eq roleUser}">
              <!-- 로그인 성공하면(회원이면) 글 작성 가능 -->
              <li class="nav-item">
                <li class="nav-item">
                  <a class="nav-link text-dark" href="/auth/join_form">Sosial</a>
                </li>
               <li class="nav-item">
  			<div class="dropdown">
			    <button class="nav-link dropbtn bg-white text-dark">Store 
			      <i class="fa fa-caret-down"></i>
			    </button>
    			<div class="dropdown-content bg-white">
				      <a href="#">Man's</a>
				      <a href="#">Woman's</a>
				      <a href="#">Accessories</a>
			    </div>
			  </div> 
			</li>
                <a
                  class="nav-link text-dark"
                  href="/board/cart_form/${principal.user.id}"
                  >ShopCart</a
                >
              <li class="nav-item">
                <a class="nav-link text-dark" href="/user/update_form"
                  >MyPage</a
                >
              </li>
              <li class="nav-item">
                <!-- 시큐리티를 적용하면 자동 로그아웃 처리 된다. -->
                <a class="nav-link text-dark" href="/logout">Logout</a>
              </li>
            </c:when>
          </c:choose>
        </ul>
      </div>
    </nav>
    <br />
    <!-- 자바 스크립트 추가할 때는 그 페이지의 밑에 작성 -->
