<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
   <head>
        <title>::: - 비밀번호 변경 :::</title>
        <meta charset="utf-8">
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
	                <form action="${path }/member/searchPwEnd.do" class="login-form" method="post">
                    <p style="font-size:35px; margin-top:44px; margin-bottom:31px; font-weight:bold;">비밀번호 변경</p><p></p>
                    <span style="margin-top:31px;">새 비밀번호를 입력해주세요.</span></p>
                    <%--  <input type="hidden" name="memberId" value=<%= finduid %>>
     				 <p class="check" id="check">내 아이디 : < <%= finduid %> ></p><br/> --%>
	                  <div class="form-groupfind">
	                      	<input type="password" name="password" id="password" class="form-control" placeholder="Password"  required>
                 			<p id="pw2ch" class="check"> </p><br/>
                 		</div>
	                 	<div class="form-groupfind">
	                  <div class="form-groupfind">
	                    <input type="password" id="password2" class="form-control"  placeholder="New Password"  required>
                  		<p id="pwch" class="check"> </p><br/>   
                     	<input type="hidden" name="email" id="email" value="${email }"> 
                      	<input type="hidden" name="memberId" id="memberId" value="${memberId }">
                      </div>	
	                  <div class="rememberfind">
	                     <button type="submit" class="btn btn-lg btn-dark btn-block" a href="${path }/member/findIdEnd.do">비밀번호 변경</button>
	                     <br/>
	                   <div class="links"> 
	            			<a href="${path }/member/login.do" class="text-dark">로그인</a> | <a href="${path }/member/searchId.do" class="text-primary">아이디 찾기</a>
	                   </div>
                    </form>   
	            </div>   
	    </div>
 
   
</body>

<script>
		//비밀번호 정규식
		 const pwJ = /^[A-Za-z0-9]{6,20}$/;
		//비밀번호 체크1
		    $("#password").focusout((e)=>{
		    	if($('#password').val()==""){
		    	   $('#pw2ch').text('*필수 정보입니다.');
			   	   $('#pw2ch').css('color', 'red');
			   	   return false;
		      }else if(!pwJ.test($("#password").val())){
		    	   $('#pw2ch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
				   $('#pw2ch').css('color', 'red') 
					return false;
		      }else{
		    	 
		    	   $("#pw2ch").hide();
		    	   return true;
		      }
		    });
		
		  //비밀번호 체크2
		    $("#password2").focusout((e)=>{
		    	if($('#password2').val()==""){
		    	   $('#pwch').text('*필수 정보입니다.');
		 	   	   $('#pwch').css('color', 'red');
		 	   	    return false;
		       }else if(!pwJ.test($("#password").val())){
		    	   $('#pwch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
				   $('#pwch').css('color', 'red') 
					return false;
		       }else{
		    	  
		    	   $("#pwch").hide();
		    	   return true;
		       }
		    });
		  
		  //비밀번호 중복확인 절차
		     $("#password2").keyup((e)=>{
		    	 if($("#password2").val()!=$("#password").val()){
		    		 $("#pwch").html("비밀번호가 다릅니다");
				     $("#pwch").css("color",'red');
				    
		    	 }else{
		    		 $("#pwch").html("비밀번호가 일치합니다");
				     $("#pwch").css("color",'blue');
				 
		    	 }
		     });
		     $("#password").keyup((e)=>{
		    	 if($("#password").val()!=$("#password2").val()){
		    		 $("#pwch").html("비밀번호가 다릅니다");
				     $("#pwch").css("color",'red');
				  
				     
		    	 }else{
		    		 $("#pwch").html("비밀번호가 일치합니다");
				     $("#pwch").css("color",'blue');
				    
				     
		    	 }
		     });     	 
 </script>
 
</html>