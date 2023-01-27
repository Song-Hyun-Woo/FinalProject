<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>





<script>
    $.ajax({
      type: "GET",
      url: "${path}/apitest",
      data: {page:"1",perPage:"20"},
      success: function(response){
        console.log(response)
        console.log(JSON.parse(response));
        const data=JSON.parse(response).data;
        data.forEach(e=>{
        	console.log(e);
        })
      }
    })
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>