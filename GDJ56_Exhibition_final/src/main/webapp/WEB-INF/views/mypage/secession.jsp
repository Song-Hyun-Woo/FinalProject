<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: - 회원 탈퇴(마이페이지) :::</title>
</head>


<main>
	
	<h3 class="text-center mt-5 mb-5">회원 탈퇴</h3>
		<form action="${path }/mypage/secessionEnd.do">
			<div class="form-check d-flex justify-content-center">
			<label id="secessionCheckLabel">
				  <input class="form-check-input" type="checkbox" value="" id="secessionCheck">
				    회원탈퇴하기
				  </label>
			</div>
			<div id="secessionReasonDiv" class="visually-hidden">
				<div class="mb-3 row">
					<input type="text" value="${loginMember.memberId}" name="memberId" hidden>
				    <label for="inputPassword" class="col-sm-2 col-form-label">탈퇴 사유</label>
				    <div class="d-flex">
						<select name="mem_exit_reason" class="form-select">
							<option value="원하는 전시회 또는 작가가 없음">마음에 드는 전시회 또는 작가가 없다</option>
							<option value="이용 빈도 부족">이용 빈도 부족</option>
							<option value="이벤트 및 혜택 부족">이벤트 및 혜택 부족</option>
							<option value="개인정보 및  보안 우려">개인정보 및  보안 우려</option>
							<option value="타 웹사이트로의 이동">타 웹사이트로의 이주</option>
							<option value="관리 부족으로 인한 실망">관리 부족으로 인한 실망</option>
						</select>
  				</div>
				<div class="d-grid gap-2 col-6 mx-auto">
		  			<input type="button" class="btn btn-dark ms-2" id="secessionBye" value="탈퇴">
				</div>
			</div>
		</form>
	</div>
</main>

<script>
	$("#secessionCheckLabel").click(e=>{
    	if($("#secessionCheck").is(":checked")){
    		$("#secessionReasonDiv").removeClass("visually-hidden");
    	}else{
    		$("#secessionReasonDiv").addClass("visually-hidden");
    	}
    })
    

$(document).ready(function(){
	$("#secessionBye").click(function(){
		if (confirm("정말로 탈퇴하시겠습니까?") == true){
			   $("#form").submit();
			}else{   
			   return false;
			}
	});
});   
</script>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>