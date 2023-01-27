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
<title>::: - 비밀번호 찾기(이메일) :::</title>
</head>
<body>

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