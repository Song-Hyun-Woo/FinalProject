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
div.newscontainer{
	width:100%;
	height:180px;
	background-image: url('${path}/resources/images/newstitle.png');
}
</style>
<br><br><br><br>
<div class="newscontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;NEWS - VIEW</h3>
</div>
<br>
<div class="container col-md-6">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-3">${news.newsTitle }</h4>
            <h6 class="card-subtitle text-muted mb-4">
                <i class="far fa-user"></i> ${news.newsWriter.memberId  }
                
                <i class="far fa-clock"></i> ${news.newsEnrollDate }
            </h6>
            <p class="card-text">${news.newsContent }</p>
        </div>
        <div class="card-body">
            <a href="" class="btn btn-outline-secondary btn-sm" role="button">수정</a>
            <a href="${path }/newsDelete.do" class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
        </div>
        <div class="card-body">
            <a href='${path }/newslist.do' class="btn btn-info" role="button">목록으로</a>
        </div>
    </div>
</div>
<br>
   





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>