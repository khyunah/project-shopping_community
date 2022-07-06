<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/style2.css" rel="stylesheet" type="text/css"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="/security/join-user" method="post">
  <label>
    <p class="label-txt">ENTER YOUR ID</p>
    <input type="text" class="input" name="userId">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <div>
  	<button id="btn-checkId">check id</button>
  	<input type="hidden" value="">
  </div>
  <br/>
  <label>
    <p class="label-txt">ENTER YOUR PASSWORD</p>
    <input id="password" type="text" class="input" name="password">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">PASSWORD CHECK</p>
    <input id="passwordCheck" type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/>
  <span id="checkPasswordResult"></span>
  <br/><br/><br/>
  <label>
    <p class="label-txt">ENTER YOUR NAME</p>
    <input type="text" class="input" name="username">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR EMAIL</p>
    <input type="text" class="input" name="email">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/>
  <label>
    <p class="label-txt">ENTER YOUR ADDRESS</p>
    <input type="text" class="input" name="address">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR PHONE</p>
    <input type="text" class="input" name="phoneNumber">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <br/><br/><br/>
  <button type="submit">sign up</button>
</form>
<script>
$(document).ready(function(){
	$( ".input" ).focus( function(){
	  $( this ).parent().find( ".label-txt" ).addClass( "label-active" );
	});
	
	$( ".input" ).focusout(function(){
	  if ( $( this ).val() == '' ) {
	    $( this ).parent().find( ".label-txt" ).removeClass( "label-active" );
	  };
	});
	
	$( "#password, #passwordCheck" ).keyup( function() {
	      let password = $( "#password" ).val();
	      let passwordCheck = $( "#passwordCheck" ).val();
	      if( password == passwordCheck ) {
	    	  $( "#checkPasswordResult" ).text( "일치" );
	      } else {
	    	  $( "#checkPasswordResult" ).text( "불일치" );
	      }
	});
});
</script>
</body>
</html>