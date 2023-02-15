<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: MONOCLEE - 회원 탈퇴(마이페이지) :::</title>
</head>

<style>
    .proName {
        font-size: 20px;
        text-decoration: none;
        color: black;
    }
    
    .close {
        display: inline-block;
        font-weight: bold;
        text-decoration: none;
        color: black;
        float: right;
         margin-bottom: 10px;
    }
    
    .close:after {
        content: "\00d7";
        font-size: 15pt;
    }
    
    .zzim-form {
        margin-left: 100px;
        margin-right: 100px;
        margin-top: 50px;
        display: flex;
        width: 100%;
    }
    
    .sidebar {
        width: 100%;
        height: 600px;
        width: 200px;
        position: sticky;
        top: 50px;
    }
    
    .sidebar ul {
        padding: 0;
        margin-top: 40px;
    }
    
    .sidebar ul li {
        list-style: none;
        margin-top: 20px;
    }
    
    .sidebar ul li a {
        text-decoration: none;
        color: #999;
    }
    
    .sidebar ul li a:hover {
        color: black;
    }
    
  /*   .zzim-container {
        width: 100%;
        position: relative;
        margin-left: 50px;
    } */
    
    .btn-delete {
        width: 100px;
        height: 35px;
        font-size: 16px;
        background-color: white;
        border: 1px solid #999;
        border-radius: 10px;
    }
    
    .btn-delete:hover {
        background-color: black;
        color: #fff;
    }
    
    .check-input {
        border-radius: 0.25em;
        width: 16;
        height: 16;
    }
    
    /* 드롭다운 css */
    #browsers {
        background-color: white;
        border: 1px solid gray;
        border-radius: 6px;
        padding: 0.2em 0.2em 0.2em 0.2em;
    }
    
    .close {
        display: inline-block;
        font-weight: bold;
    }
    
    .close:after {
        content: "\00d7";
        font-size: 15pt;
    }
    /* 선택금액표시 div */
    .allprice-container {
        border: 4px solid black;
        text-align: center;
        margin-top: 50;
    }
    
    .allprice-content {
        display: inline-block;
        margin: 0 auto;
        vertical-align: top;
    }
    
    .allprice-form {
        padding: 20px 15px 18px;
        line-height: 17px;
        color: #555;
        text-align: center;
    }
    
    .all-plus {
        margin: 0 11px 0 10px;
        /* vertical-align: -4px; */
    }
    
    .allprice-form i {
        padding: 0 4px 0 5px;
        font: 700 17px/17px tahoma;
        color: #111;
    }
    
    .allprice-form
    .final-price {
        color: red;
        font-size: 20px;
    }
    
 /*    .zzimandprice button {
        width: 400;
        height: 50;
        margin: 30;
        margin-top: 70;
        border-radius: 6px;
        font-size: 19;
    } */
    
/*     .btn-zzim {
        background-color: #999;
        color: white;
        border: 1px solid #999;
    }
    
    .btn-zzim:hover {
        background: black;
    } */
    
    .btn-buy {
        color: #fff;
        background-color: #dc3545;
        border: 1px solid #dc3545;
    }
    
    .btn-buy:hover {
        background-color: #bb2d3b;
    }
    </style>

   
    <div class="headcontainer border-top" style="padding-top: 20px"></div>
    <section  class="zzim-form">
        <div>
            <div class="sidebar">
            <br>
                <h4>
                    <strong>마이페이지</strong>
                </h4>
                <ul>
                    <li><a href="${path }/mypage/bookingList">예매내역</a></li>
                    <li><a href="${path }/mypage/zzim.do">찜한 전시회</a></li>
                    <li><a href="${path }/mypage/myQna.do">나의 문의</a></li>
                    <li><a href="${path }/mypage/faq.do">FAQ</a></li>
                    <br>
                    <br>
                    <li><h5><b>내정보</b></h5></li>
                    <li><a href="${path }/mypage/updateMember.do?memberId=${loginMember.memberId}">회원정보 수정</a></li>
                    <li><a href="${path }/mypage/secession.do">회원 탈퇴</a></li>
                </ul>
            </div>
        </div>

<main style="width: 70%"> 	
	<h3 class="text-center mt-5 mb-5">회원 탈퇴</h3>
		<form action="${path}/mypage/secessionEnd.do" id="form1">
			<div style="display: flex; justify-content: center;" class="form-check d-flex justify-content-center">
			<label id="secessionCheckLabel">
				  <input class="form-check-input" type="checkbox" value="" id="secessionCheck">
				    회원탈퇴하기
				  </label>
			</div>
			<div id="secessionReasonDiv" class="visually-hidden">
			
				<div class="mb-3 row">
					<input type="text" value="${loginMember.memberId}" name="memberId" hidden>
				    <label for="inputPassword" class="col-sm-2 col-form-label">탈퇴 사유</label>
				    
				    <div style="width: 700px;" class="d-flex">
						<select name="secession_reason" class="form-select">
							<option value="원하는 전시회 또는 작가가 없음">마음에 드는 전시회 또는 작가가 없다</option>
							<option value="이용 빈도 부족">이용 빈도 부족</option>
							<option value="이벤트 및 혜택 부족">이벤트 및 혜택 부족</option>
							<option value="개인정보 및  보안 우려">개인정보 및  보안 우려</option>
							<option value="타 웹사이트로의 이동">타 웹사이트로의 이주</option>
							<option value="관리 부족으로 인한 실망">관리 부족으로 인한 실망</option>
						</select>
  				</div>
  				
				<div class="d-grid gap-2 col-6 mx-auto">
		  			<input type="submit" class="btn btn-dark ms-2" id="secessionBye" value="탈퇴">
				</div>
			</div>
		</form>
	</div>


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
		var result=confirm("정말로 탈퇴하시겠습니까?");
		if (result){
			   $("#form1").submit();
			}else{   
			   return false;
			} 
		
		
	});
});   
</script>
</main>

