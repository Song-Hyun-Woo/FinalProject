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
section#artist-container{width:600px; margin:0 auto; }
table#tbl-art{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse;  clear:both; }
table#tbl-art th, table#tbl-art td {border:1px solid; padding: 5px 0; } 
</style>

<br><br><br><br>
<div class="artcontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;ARTIST - WRITE</h3>
</div>

<br>
<section id="artist-container">
	<h2 style="text-align:center;">작가를 등록해보세요!</h2>
	<div style="border-radius: 30px;border-color:rgba(18, 63, 63, 63);border-style:solid;border-width:5px;">
	<form action="${path }/artInsert.do" onsubmit="event_click();" method="post" enctype="multipart/form-data">
		<table id="tbl-art">
			<img src="${path }/resources/images/test.png" width="450" height="450" onclick="fn_upfile();" style="margin-left: 75px;" >
			<br>
			<input type="file" name="upfile" style="display:none">
			<div id="images"></div>
				<script>
					const fn_upfile=()=>{
						$("input[name=upfile]").click();
					}
					$("input[name=upfile]").change(e=>{
						console.log(e.target);
						const reader=new FileReader();
						reader.onload=e=>{
							const img=$("<img>").attr({
								src:e.target.result,
								width:"200px",
								height:"200px"
							});
						$("img").attr("src",e.target.result);
						}
						reader.readAsDataURL(e.target.files[0]);
					});
				</script>
				<!-- <div class="inputArea"> -->
				
<!-- 작가 이름, 작가 생애, 작가 경력, 작가 학력, 작가 개인전 단체전 활동 -->
<br>
				<tr><strong>&nbsp;&nbsp;&nbsp;작가 이름&nbsp;&nbsp;&nbsp;</strong>
					<input type="text" name="artName" required placeholder="작가 이름을 입력해주세요">
					<p id="idch" class="check"> </p>
				</tr>
				<tr><strong>&nbsp;&nbsp;&nbsp;작가 출생&nbsp;&nbsp;&nbsp;</strong>
					<input type="date" name="artBirth" required >&nbsp;&nbsp;~
				</tr><br><br>
				<tr><strong style="position: relative;bottom: 110px;">&nbsp;&nbsp;&nbsp;작가 경력&nbsp;&nbsp;&nbsp;</strong>
					<!-- <input type="text" name="artCareer" style="width:460px;" required placeholder="작가의 경력을 입력해주세요"> -->
					<textarea name="record" required placeholder="작가의 경력을 입력해주세요" rows="5" cols="52"></textarea>
				</tr><br><br>
				<tr><strong style="position: relative;bottom: 110px;" >&nbsp;&nbsp;&nbsp;작가 학력&nbsp;&nbsp;&nbsp;</strong>
					<!-- <input type="text" name="artEdu" style="width:460px;" required placeholder="작가의 학력을 입력해주세요"> -->
					<textarea name="record" required placeholder="작가의 학력을 입력해주세요" rows="5" cols="52"></textarea>
				</tr><br><br>
				<tr><strong style="position: relative;bottom: 110px;">&nbsp;&nbsp;&nbsp;작가 활동&nbsp;&nbsp;&nbsp;</strong>
					<!-- <input type="text" name="artRecord" style="width:460px;" required  placeholder="작가의 활동을 입력해주세요"/> -->
					<textarea name="record" required placeholder="작가의 활동을 입력해주세요" rows="5" cols="52"></textarea>

				</tr>
		</table><br>
		<button type="submit" style="margin-left: 225px;" class="btn btn-md btn-dark btn-block">등록</button>&nbsp;&nbsp;&nbsp;
		<button onclick="location.replace('${path }/artistList.do')"  class="btn btn-md btn-dark btn-block">취소</button>
		<br><br>
	</form>
	</div>
</section>
<br>
<script>
	function event_click() {
		$("#name").focusout((e)=>{
		     if($('name').val() == ""){
		   		$('#idch').text('*필수 정보입니다.');
		   	  	$('#idch').css('color', 'red');
		   		return false;
}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>