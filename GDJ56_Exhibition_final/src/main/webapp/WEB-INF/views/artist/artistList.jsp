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
	border-bottom:1px solid #e6e6e6;
}
</style>

<br><br><br><br>
<div class="artcontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;ARTIST</h3>
</div>
<br>
<!-- 작가 이름, 작가 생애, 작가 경력, 작가 학력, 작가 개인전 단체전 활동 -->
<c:if test="${loginMember.memberId eq 'admin' }">
	<div id="artWrite" style="text-align:center;">
		<button class="btn btn-sm btn-dark btn-block" onclick="location.replace('${path}/artInsertWrite.do')">작가 등록</button>
	</div>
</c:if>
<br>
<div style="width:100%; margin:auto;text-align:center;">
<!--flex wrap  -->
	<div style="border-top:1px solid #e6e6e6;display:flex;flex-wrap:wrap;margin-left:90px;">
		<c:if test="${not empty arts }">
			<c:forEach var="a" items="${arts }">
					<div style="text-align:center;">
						<div style="width:180px;height:230px;margin-left:30px;margin-top:5px;">
							<img src="${path }/resources/upload/artist/${a.artImg}" style="width:100%;height:100%;margin:auto;border-radius:20px;">
						</div>
						<div><a href="${path }/artistView.do?artNo=${a.artNo}">${a.artName }</a></div>
					</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<br>
<div>
	${pageBar }
</div>
<br>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>