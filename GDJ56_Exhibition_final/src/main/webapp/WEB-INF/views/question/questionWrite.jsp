<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=""/>
</jsp:include>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<section id="content"  style="display: justify-content: center;"  >
	<div id="questrion-container"  style="display:flex; justify-content: center;">
		<div style="width: 500px; height: auto;display: justify-content: center ! important;" >
	        <form style="width: 100%;" name="questrionFrm" action="${path }/questionWriteEnd.do" method="post" enctype="multipart/form-data">
	            <input type="text" class="form-control" placeholder="제목" name="questionTitle" id="questionTitle" required>
	            <br>
	            <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="questionWriter" value="${loginMember.memberId}" readonly required>
	            <br>
	            <select id="questionType" name="questionType" required>
	            	<!-- <option value="">카테고리</option> -->
	            	<option value="1대1문의">1대1문의</option>
	            	<option value="전시문의">전시문의</option>
	            </select>
	            <br>
	            <br>
	            <textarea class="form-control" name="questrionContent" placeholder="내용" required></textarea>
	            <br />
	            <input type="submit" class="btn btn-dark" value="저장" >
	        </form>
        </div>
    </div>
<br>
<br>
<br>
<br>
<br>

    <style>
    div#board-container{width:400px; margin:0 auto; text-align:center;}
    div#board-container input{margin-bottom:15px;}
    </style>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>