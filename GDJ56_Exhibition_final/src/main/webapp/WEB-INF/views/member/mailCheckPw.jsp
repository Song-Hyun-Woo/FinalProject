<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: - 비밀번호 찾기 이메일 폼 :::</title>
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
.findpwmail{
    width:458px; 
    margin:0px auto; 
    text-align:center; 
    margin-top:185px; 
    margin-bottom:56px; 
    border:1px solid #dcdcdc; height:350px; 
    border-radius:10px;
}
.form-groupfind{
    width:500px; 
    margin:0 auto;
}    
 
</style>
<body>

<div class="findpwmail">
            <div class="account-login">
               <form action="${path }/member/confirmPw.do" class="login-form" method="post">
               <p style="font-size:35px; margin-top:44px; margin-bottom:31px; font-weight:bold;">비밀번호 찾기</p><p></p>
                    <span style="margin-top:31px;">이메일로 전달 받은 인증번호를 입력해주세요.</span></p>
               <div class="login-form">
                  <div class="form-group">
                   <input type="text" name="emailConfirm" id="emailConfirm" class="form-control" placeholder="인증번호를 입력하세요." autofocus required>
                     <p id="emch" class="check"> </p><br/> 
                  <input type="hidden" name="checkNum" value="${checkNum }"> 
                   <input type="hidden" name="email" value="${email }">  
                   <input type="hidden" name="memberId" value="${memberId }"> 
                  </div>
                  <div class="rememberfind">
                   <button id="btn-Yes" type="submit" class="btn btn-lg btn-dark btn-block">확인</button> 
                     </div>
                      </form>
                  </div>
                 
            </div>
        </div>
</body>

<script>
$("#emailConfirm").focusout((e)=>{
	  if($("#emailConfirm").val()==""){
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