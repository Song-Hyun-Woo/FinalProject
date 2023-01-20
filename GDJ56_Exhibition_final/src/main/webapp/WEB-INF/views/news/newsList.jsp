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
body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 85%;
  text-align:center;
  margin:auto;
}
th,
td {
  padding: 6px 15px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: center;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}
.newsWrite{
	margin-left: 1348px;
}
div.newscontainer{
	width:100%;
	height:180px;
	background-image: url('${path}/resources/images/newstitle.png');
}
</style>
<br><br><br><br>
<div class="newscontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;NEWS</h3>
</div>
<br>
<div class="newsWrite">
<!-- 관리자만 보이게 분기처리 -->
	<button class="btn btn-md btn-dark btn-block" onclick="location.assign('${path}/newsWrite.do')">작성</button>
	
</div>
<table>
  <thead>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>첨부파일</th>
    </tr>
  </thead>
  <tbody>
    <c:choose>
    	<c:when test="${empty newsn }">
        	<tr>
           		<td colspan="4">조회된 게시물이 없습니다.</td>
            </tr>
        </c:when>
        	<c:otherwise>
            	<c:forEach var="n" items="${newsn }">
            		<tr>
            			<td><c:out value="${n.newsNo }"/></td>
            			<td>
            				<a href="${path }/news/newsView.do?newsNo=${n.newsNo}">
            					<c:out value="${n.newsTitle }"/>
            				</a>
            			</td>
            			<td><c:out value="${n.newsWriter.memberId }"/></td>
            			<td><c:out value="${n.newsEnrollDate }"/></td>
            			<td>
            				<c:if test="${empty n.files }">없음</c:if>
            				<c:if test="${not empty n.files }">있음</c:if>
            			</td>
            		</tr>
            	</c:forEach>
            </c:otherwise>
  	</c:choose>
  </tbody>
</table>
<br><br>
	<div>
		${pageBar }
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>