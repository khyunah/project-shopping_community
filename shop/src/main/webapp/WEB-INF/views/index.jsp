<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
      html,
      body {
        margin: 0;
      }

      section .box {
        height: 500px;
        background: tomato;
        color: white;
        box-sizing: border-box;
        padding: 30px 10px;
      }

      section .box:nth-child(2n) {
        background: teal;
      }
    </style>
  </head>
  <body>
    <section>
      <div class="box">1번째 div</div>
      <div class="box">2번째 div</div>
      <div class="box">3번째 div</div>
    </section>

    <script src="/js/index.js"></script>
</body>
</html>