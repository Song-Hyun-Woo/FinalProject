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

div.newsWrite{
	height:400px;
	width:80%; 
	margin-left:200px;
}

</style>

<br><br><br><br>
<div class="newscontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;NEWS - UPDATE</h3>
</div>
<br><br>

<div class="newsWrite">
<form name="writeform" method="post" action="${path }/newsUpdate.do" enctype="multipart/form-data">
<table>
  <tr>
   <td>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="newsTitle" size="130" maxlength="100" value="${news.newsTitle }"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">작성자</td>
      <%-- <td><input name="newsWriter" size="130" maxlength="50" value="${news.newsWriter.memberId }" readonly required ></td> --%>
      <td><input name="writer" size="130" maxlength="50" value=5 readonly required ></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea id="summernote" name="newsContent" cols="50" rows="50">${news.newsContent }</textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">파일첨부</td>
      <td><input type="file" name="upfile" id="upfile1" size="130" maxlength="50">
      	<input	type="hidden" name="oriFile" value="${news.files.get(0).renamedFilename }"/>
      </td>
      <td>&nbsp;</td>
     </tr>
     <%-- <tr>
      <td>&nbsp;</td>
      <td align="center">파일첨부2</td>
      <td><input type="file" name="upfile" id="upfile2" size="130" maxlength="50" value="${file }"></td>
      <td>&nbsp;</td>
     </tr> --%>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="submit" value="등록"> 
			<input type=button value="취소" onclick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  <input type="hidden" name="newsNo" value="${news.newsNo }"/>
  </form>
 </table>
</div>         
        <br><br><br><br><br>

<script >
$(()=>{
	$("[name=upFile]").change(e=>{
		console.dir(e.target);				
		const fileName=e.target.files[0].name;
		$(e.target).next(".custom-file-label").text(fileName);
	});
});

/* const newsCheck = () => {
	if($("[name=newsTitle]").val() == ""){
		alert("제목을 입력해 주세요!!");
		return false;
	}
	 if($("[name=newsContent]").val() == ""){
		alert("내용을 입력해 주세요!!");
		return false;
	}
}
 */


$('#summernote').summernote({
    // 에디터 높이
    height: 250,
    // 에디터 한글 설정
    lang: "ko-KR",
    // 에디터에 커서 이동 (input창의 autofocus라고 생각)
    focus : true,
    toolbar: [
        // 글꼴 설정
        ['fontname', ['fontname']],
        // 글자 크기 설정
        ['fontsize', ['fontsize']],
        // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
        ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
        // 글자색
        ['color', ['forecolor','color']],
        // 표만들기
        ['table', ['table']],
        // 글머리 기호, 번호매기기, 문단정렬
        ['para', ['ul', 'ol', 'paragraph']],
        
        ['insert',['picture','link','video']],
        // 줄간격
        ['height', ['height']],
        // 코드보기, 확대해서보기, 도움말
        ['view', ['codeview','fullscreen', 'help']]
    ],
    // 추가한 글꼴
    fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
    // 추가한 폰트사이즈
    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

});
 
</script>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>