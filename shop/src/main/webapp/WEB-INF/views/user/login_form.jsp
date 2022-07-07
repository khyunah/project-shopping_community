<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <input id="password" type="text" class="input" name="password" required>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>

  <br/><br/><br/>
  <button type="button" id="btn-login">login</button>
</form>
<script src="/js/user.js"></script>

</body>
</html>