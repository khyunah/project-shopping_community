<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        
        <form class="join-form" action="/security/join-user" method="post">
        
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="userId">아이디 *</label>
              <input name="userId" type="text" class="form-control" id="userId" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="btn-userId-check">아이디 중복검사 *</label><br/>
              <button class="btn btn-primary" id="btn-userId-check">중복검사</button>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="password">비밀번호 *</label>
              <input name="password" type="password" class="form-control" id="password" placeholder="" value="" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="passwordCheck">비밀번호 확인 *</label>
              <input type="password" class="form-control" id="passwordCheck" placeholder="" value="" required>
              <div class="invalid-feedback">
                비밀번호를 확인해주세요.
              </div>
            </div>
          </div>
          
          <div class="mb-3">
              <label for="username">이름 *</label>
              <input name="username" type="text" class="form-control" id="username" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
          </div>

          <div class="mb-3">
            <label for="email">이메일 *</label>
            <input name="email" type="email" class="form-control" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="address">주소 *</label>
            <input name="address" type="text" class="form-control" id="address" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="row">
            <div class="col-md-8 mb-3">
              <label for="phoneNumber">연락처 *</label>
              <input name="phoneNumber" type="text" class="form-control" id="phoneNumber" placeholder="번호만 입력해주세요." required>
            </div>
          </div>
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>          
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; shopping community</p>
    </footer>
  </div>
<script src="/js/user.js"></script>
</body>
</html>