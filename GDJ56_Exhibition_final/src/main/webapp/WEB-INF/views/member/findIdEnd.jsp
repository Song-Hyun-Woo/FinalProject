<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
   <head>
        <title>::: - 아이디 찾기 :::</title>
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
			<p style="font-size:35px; margin-top:44px; margin-bottom:31px; font-weight:bold;">아이디 찾기</p><p></p>
			  <div class="form-groupfind">
				<c:if test="${not empty id }">
					<h4 style="text-align: center;">ID 조회 결과 입니다</h4><input style="text-align: center;" type="text" value="${id.memberId }">
					</c:if>
					<c:if test="${empty id }">
					  <h4 style="text-align: center;">조회된 아이디가 없습니다.</h4>
					</c:if>
				   </div>
			  <div class="rememberfind">
				<button id="btn-Yes" class="btn btn-lg btn-dark btn-block" type="submit" onclick="location.href='${path}/member/login.do'">로그인 화면 돌아가기</button> 
				 <br/>
			</form>   
		</div>   
</div>
</body>
</html>