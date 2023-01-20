<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>       
<script>

function save(){
	oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
    		//스마트 에디터 값을 텍스트컨텐츠로 전달
	var content = document.getElementById("smartEditor").value;
	alert(document.getElementById("txtContent").value); 
    		// 값을 불러올 땐 document.get으로 받아오기
	return; 
}

</script>

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
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;NEWS - WRITE</h3>
</div>
<br>
	<table>
	<tr>
		<th></th>
	</tr>
		<textarea id="txtContent" rows="10" cols="100" style="width: 100%;"></textarea>
	
		<div id="se2_sample" style="margin:10px 0;">
			<input type="button" onclick="save();" value="제출">
		</div>
	</table>
<!-- textarea 밑에 script 작성하기 -->
<script id="smartEditor" type="text/javascript"> 
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "txtContent",  //textarea ID 입력
	    sSkinURI: "${path}/resources/libs/smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
	    fCreator: "createSEditor2",
	    htParams : { 
	    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
	        bUseToolbar : true, 
		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseVerticalResizer : true, 
		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
		bUseModeChanger : true 
	    }
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>