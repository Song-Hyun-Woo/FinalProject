<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
        <title>::: - 비밀번호찾기 :::</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style type="text/css">

.rememberfind {
	width:400px; 
    margin:0 auto;
    margin-top:0px; 
    text-align:center; 
}

 .links{
        text-align: center;
        margin-bottom: 10px;
        
    }
.findpw{
    width:658px; 
    margin:0px auto; 
    text-align:center; 
    margin-top:185px; 
    margin-bottom:56px; 
    border:1px solid #dcdcdc; height:450px; 
    border-radius:10px;
}
.form-groupfind{
    width:500px; 
    margin:0 auto;
}    
   
</style>

	<body>
	    <div class="findpw">
	            <div class="account-login">
	                <form action="${path }/member/findPwEnd.do" class="login-form" method="post">
                    <p style="font-size:35px; margin-top:44px; margin-bottom:31px; font-weight:bold;">비밀번호 찾기</p><p></p>
                    <span style="margin-top:31px;">회원가입 시 기입한 항목을 입력해주세요.</span></p>
	                  <div class="form-groupfind">
	                      <input type="text" name="memberId" id="memberId" class="form-control" placeholder="아이디" autofocus required>
	                  </div>
	                  <p id="idch" class="check"> </p><br/>
	                  <div class="form-groupfind">
	                     <input type="text" name="email" id="email" class="form-control" placeholder="이메일"  required>
	                  </div>
	                  <p id="emch" class="check"> </p><br/>
	                  <div class="rememberfind">
	                     <button id="btn-Yes"  type="submit" class="btn btn-lg btn-dark btn-block">비밀번호찾기</button>
	                   <div class="links"> 
	            			<a href="${path }/member/login.do" class="text-dark">로그인</a> | <a href="${path }/member/findId.do" class="text-dark">아이디 찾기</a> | <a href="${path }/member/enrollMember.do" class="text-dark">회원가입</a>
	                   </div>
                    </form>   
	            </div>   
	    </div>
	</body>

<script>
//아이디 정규식
const idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 이메일 검사 정규식
const mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//아이디 체크
$("#memberId").focusout((e)=>{
     if($('#memberId').val() == ""){
   		$('#idch').text('*필수 정보입니다.');
   	  	$('#idch').css('color', 'red');
   		return false;
	  }else if(!idJ.test($('#memberId').val())){
  		$('#idch').text('4~19자의 영문 소문자, 숫자만 사용가능합니다')
		$('#idch').css('color', 'red')
		   return false;
	  }else{ 
		  
       $("#idch").hide();
       return true;
     }
});

//이메일
$("#email").focusout((e)=>{
	  if($("#email").val()==""){
		  $('#emch').text('*필수 정보입니다.');
		  $('#emch').css('color','red');
		  return false;
	  }else{
		 
		  $('#emch').hide();
			return true;
	  } 
});
</script>
</html>


