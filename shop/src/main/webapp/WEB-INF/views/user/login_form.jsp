<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
﻿<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>﻿
<title>Insert title here</title>
</head>
<body>
<form>

  <label>
    <p class="label-txt">ENTER YOUR ID</p>
    <input type="text" class="input" name="userId" id="userId" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/>

  <br/>
  <label>
    <p class="label-txt">ENTER YOUR PASSWORD</p>
    <input id="password" type="password" class="input" name="password" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>

  <br/><br/><br/>
  <div>
  	<button type="button" id="btn-login">login</button>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=0d6bcf296d67c35ad944b2a3d38df9be&redirect_uri=http://localhost:9090/auth/kakao/callback&response_type=code">
  	  <img src="/images/kakao_login.png" width="86" height="49"/>
    </a>
  </div>
  
</form>
<script src="/js/user.js"></script>

</body>
</html>