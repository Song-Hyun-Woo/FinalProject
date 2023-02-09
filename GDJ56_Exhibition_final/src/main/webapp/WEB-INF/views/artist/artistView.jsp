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
   table#tbl-art{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
   table#tbl-art th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
   table#tbl-art td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>

<br><br><br><br>
<div class="artcontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;ARTIST - VIEW</h3>
</div>
<br>
<br>

<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${arts.artName }</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출생&nbsp;&nbsp;&nbsp;&nbsp; ${arts.artBirth }</p>
<div style="display:flex;">
	<div style="border-top:1px solid #e6e6e6;display:flex;margin-left:90px;">
		<c:if test="${not empty arts }">
			<div style="width:180px;height:230px;margin-left:30px;margin-top:5px;">
				<img src="${path }/resources/upload/artist/${arts.artImg}" style="width:100%;height:100%;margin:auto;border-radius:20px;">
			</div>
			<br>
		</c:if>
	</div>
		<div style="width:85%;display:inline-block;margin-left:50px;">
			<ul>
				<li style="list-style-type:square;"><h5>작가 학력&nbsp; | </h5><p style="margin-left: 100px;">&nbsp;${arts.artEdu }</p><br></li>
				<li style="list-style-type:square;"><h5>작가 경력&nbsp; | </h5><p style="margin-left: 100px;">&nbsp;${arts.artCareer }</p><br></li>
				<li style="list-style-type:square;"><h5>작가 활동&nbsp; | </h5><p style="margin-left: 100px;">&nbsp;${arts.artRecord }</p></li>
			</ul>
		</div>
</div>
<br>
	<c:if test="${loginMember.memberId eq 'admin' }">
		<div id="artWrite" style="text-align:center">
			<button class="btn btn-sm btn-dark btn-block" onclick="location.replace('${path}/artDelete.do?artNo=${param.artNo }')">작가 삭제</button>&nbsp;&nbsp;
			<button class="btn btn-sm btn-dark btn-block" onclick="location.replace('${path}/artUpdateWrite.do?artNo=${param.artNo }')">작가 수정</button>
			<br><br>
			<button onclick="location.replace('${path }/artistList.do')" class="btn btn-sm btn-dark btn-block">취소</button>
		</div>
	</c:if>
<br>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>