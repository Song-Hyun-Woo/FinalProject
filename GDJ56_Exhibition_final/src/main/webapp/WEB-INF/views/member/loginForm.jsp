<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${path}/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href=${path}/resources/"css/style.css">

<title>::: - 로그인 :::</title>

</head>
<body>

<div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>로그인</h3>
            </div>
            <form action="#" method="post">
              <div class="form-group first">
                <label for="username">아이디</label>
                <input type="text" class="form-control" id="username">

              </div>
              <div class="form-group last mb-3">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password">
                
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">아이디 저장하기</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="#" class="forgot-pass">아이디 찾기</a></span>
                <span class="ml-auto"><a href="#" class="forgot-pass">비밀번호 찾기</a></span>  
              </div>

              <input type="submit" value="로그인" class="btn btn-outline-dark">

              <span class="d-block text-center my-4 text-muted">&mdash; or &mdash;</span>
              
              <div class="social-login">
                <!-- 카카오  -->
                
                <!-- 네이버  -->
                
                
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    
  </div>
    
    

    <script src="${path}/resources/js/jquery-3.6.1.min.js"></script>
    <script src="${path}/resources/js/js/popper.min.js"></script>
    <script src="${path}/resources/js/js/bootstrap.min.js"></script>
    <script src="${path}/resources/js/js/main.js"></script>
  </body>
</html>


</body>
</html>