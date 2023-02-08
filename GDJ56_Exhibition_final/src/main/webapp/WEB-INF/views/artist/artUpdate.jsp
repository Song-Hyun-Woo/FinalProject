<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<style>
div.artcontainer{
	width:100%;
	height:180px;
	background-image: url('${path}/resources/images/artisttitle.png');
}
</style>

<br><br><br><br>
<div class="artcontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;ARTIST</h3>
</div>
<br>
<!-- 작가 이름, 작가 생애, 작가 경력, 작가 학력, 작가 개인전 단체전 활동 -->






<jsp:include page="/WEB-INF/views/common/footer.jsp"/>