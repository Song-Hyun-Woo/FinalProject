<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>       

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: - 회원정보 수정 :::</title>
</head>

 	<!-- kakao 도로명주소 찾기 api -->
	<script src = "https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<h2 class="mt-5">정보수정</h2>
	<form action="${path }/mypage/updateMember.do" class="mt-5">
		<p class="text">아이디</p>
	   	<input type="text" name="memberId" id="memberId"  class="form-control" value="${loginMember.memberId }"
	   		readonly>
		
		<br/>
	   	<p class="text">이름</p>
	   	<input type="text" name="memberName" id="memberName" class="form-control" value="${loginMember.memberName }" required><br>
	   	
	   	<p class="text">생년월일</p>
	   	<input type="text" name="birthday" id="birthday" class="form-control" placeholder="ex) 19920101" value="${loginMember.birthday }" maxlength="8" required><br>
	        
	
	   	<p class="text">주소</p>
	    <input type="text" class="text" name="addr1" id="addr1" placeholder="우편번호"readonly="readonly">
        <input type="button" onclick="execPostCode()"   class="btn btn-secondary"  value="우편번호 찾기"><br>
	            <input type="text" class="form-control" name="addr2" id="addr2"  placeholder="도로명주소"readonly="readonly">
	            <input type="text" name="address" id="addr3" class="form-control" placeholder="상세주소" required><br>
	            <span id="guide" style="color:#999;display:none"></span>
	            <br/>
	         
	 <div id="contents"> 
			<p class="text">이메일</p> 
			<input type="text" id="email" name="email" class="form-control" placeholder="Email" value="${loginMember.email }" required/>  
			 &nbsp; 
			<button type="button" id="emailChk" class="btn btn-outline-dark">인증</button><br> 
			<p id="emch" class="check"> </p><br/>
			<p class="text">인증번호</p>  
			<input type="text" id="email2" name="email2" class="form-control" placeholder="인증번호" required>
			 &nbsp;   
			<button type="button" id="enterBtn2" class="btn btn-outline-dark">확인</button> 	
	        </div>
	        <p id="emch2" class="check"> </p>	 
	        <br/>
	        
	        <div id="contents"> 
			<p class="text">휴대폰번호</p> 
			<input type="text" id="to" name="phone" class="form-control" placeholder="Phone" value="${loginMember.phone }" required/>  
			 &nbsp; 
			<button type="button" id="send" class="btn btn-outline-dark">인증</button><br> 
			<p id="phonech" class="check"> </p><br/>
			<p class="text">인증번호</p>  
			<input type="text" id="userNum" class="form-control" placeholder="인증번호" required>
			 &nbsp;   
			<button type="button" id="enterBtn" class="btn btn-outline-dark">확인</button> 	
	        </div>	 
	        <p id="phonech2" class="check"> </p><br/>
	        <hr class="mb-4">
	        
	        <br/>
	          <button type="submit" id="btn-Yes" class="btn btn-lg btn-dark btn-block">정보 수정</button>
	          <button type="submit" id="btn-No" class="btn btn-lg btn-dark btn-block">수정 취소</button>
	        <br>
	        <br>
	
	</form>

<script>
	
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>