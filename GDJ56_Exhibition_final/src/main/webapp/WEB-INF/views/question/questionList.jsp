<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<section id="questrion-container" class="container">
        <p>총 ${totalContents }건의 게시물이 있습니다.</p>
        <c:if test="${loginMember != null||loginMan != null||loginAdmin != null }">
        	<button onclick="location.assign('${path}/questionWrite.do')">글쓰기</button>
        </c:if>
        <table id="tbl-board" class="table table-striped table-hover">
	        <thead>
	            <tr>
	                <th>제목</th>
	                <th>번호</th>
	                <th>작성자</th>
	                <th>카테고리</th>
	                <th>내용</th>
	                <th>작성일</th>
	            </tr>
            </thead>
            <c:if test="${not empty boards }">
            	<c:forEach var="q" items="${questions }">
	            	<tbody>
	            		<tr>
	            			<td>
	            				<a href="${path}/questrionView.do?no=${questionNo }">
	            					<c:out value="${questrionTitle }"/> 
	            				</a>
	            			</td>          		
	            			<td><c:out value="${questionNo }"/></td>
	            			<td><c:out value="${questionWriter }"/></td>
	            			<td><c:out value="${questionType }"/></td>
	            			<td><c:out value="${questionContent }"/></td>
	            			<td><c:out value="${questionDate }"/></td>
	            		</tr>
            		</tbody>
            	</c:forEach>
            </c:if>
            <c:if test="${empty questions }">
            	<tr>
            		<td colspan="6">조회결과없음</td>
            	</tr>
            </c:if>
        </table> 
        <div id="pageBar">
        	${pageBar }
        </div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>