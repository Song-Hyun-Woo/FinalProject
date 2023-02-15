<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>       

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: MONOCLEE - 회원정보 수정 :::</title>
</head>

 <!-- kakao 도로명주소 찾기 api -->
<script src = "https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	
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
        width: 90%;
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
<main style="width: 70%">    
    <div class="headcontainer border-top" style="padding-top: 20px"></div>
    <section class="zzim-form">
        <div>
            <div class="sidebar">
            <br>
                <h4>
                    <strong>마이페이지</strong>
                </h4>
                <ul>
                    <li><a href="${path }/mypage/bookingList.do">예매내역</a></li>
                    <li><a href="${path }/mypage/zzimExhList.do">찜한 전시회</a></li>
                    <li><a href="${path }/mypage/myQna.do">나의 문의</a></li>
                    <li><a href="${path }/mypage/faq">FAQ</a></li>
                    <br>
                    <br>
                    <li><h5><b>내정보</b></h5></li>
                    <li><a href="${path }/mypage/updateMember.do?memberId=${loginMember.memberId}">회원정보 수정</a></li>
                    <li><a href="${path }/mypage/secession.do">회원 탈퇴</a></li>
                </ul>
            </div>
        </div>

	

<div style="margin:auto;">
<h2 class="mt-5">회원정보수정</h2>
	<form action="${path }/mypage/updateMemberEnd.do" class="mt-5">
	<div style="justify-content: center;  width: 400px; margin:0 auto;">
		<p class="text">아이디</p>
	   	<input type="text" name="memberId" id="memberId"  class="form-control" value="${loginMember.memberId }"
	   		readonly>
		
		<br/>
	   	<p class="text">이름</p>
	   	<input type="text" name="memberName" id="memberName" class="form-control" value="${loginMember.memberName }" required><br>
	   	
	   	<p class="text">생년월일</p>
	   	<input type="text" name="birth" id="birth" class="form-control" placeholder="ex) 19920101" value="${loginMember.birth }" maxlength="8" required><br>
	        
	
	   	<p class="text">주소</p>
	    <input type="text" class="text" name="addr1" id="addr1" placeholder="우편번호"readonly="readonly">
        <input type="button" onclick="execPostCode()"   class="btn btn-dark"  value="우편번호 찾기"><br>
	            <input type="text" class="form-control" name="addr2" id="addr2"  placeholder="도로명주소"readonly="readonly">
	            <input type="text" name="address" id="addr3" class="form-control" placeholder="상세주소" required><br>
	            <span id="guide" style="color:#999;display:none"></span>
	            <br/>
	         
	 	<div id="contents"> 
			<p class="text">이메일</p> 
			<input type="text" id="email" name="email" class="form-control" placeholder="Email" value="${loginMember.email }" required/>  
			 &nbsp; 
			<button type="button" id="emailChk" class="btn btn-dark">인증</button><br> 
			<p id="emch" class="check"> </p><br/>
			<p class="text">인증번호</p>  
			<input type="text" id="email2" name="email2" class="form-control" placeholder="인증번호" required>
			 &nbsp;   
			<button type="button" id="enterBtn2" class="btn btn-dark">확인</button> 	
	        </div>
	        <p id="emch2" class="check"> </p>	 
	        <br/>
	        
	        <p class="text">전화번호</p>
	   		<input type="text" name="phone" id="phone" class="form-control" value="${loginMember.phone }" required><br>
	        
	        <br/>
	          <button type="submit" id="btn-Yes" class="btn btn-md btn-dark btn-block">정보 수정</button>
	          <button class="btn btn-md btn-dark btn-block" onclick="location.assign('${path}/mypage/mypageMain.do')">수정 취소</button>
	        <br>
	        <br>
	</div>
	</form>
</div>

<script>

//이메일 체크
 $("#email").focusout((e)=>{
	  if($("#email").val()==""){
		  $('#emch').text('*필수 정보입니다.');
		  $('#emch').css('color','red');
		  return false;
	  }else{
		 
		  $('#emch').hide();
			return true;
	  } 
});

//이메일 인증 확인
$("#emailChk").click((e)=>{
	  const email = $('#email').val();
	  $.ajax({
		  url:'${path}/member/checkMail.do',
		  type: 'POST',
		  data: {
			  "email" : email
		  },
		  success: function(data){
			  const checkNum = data;
			  alert('인증번호가 발송 되었습니다. \n이메일에서 인증번호 확인을 해주십시오.');
			  
			  $('#enterBtn2').click((e)=>{
				  const userNum = $('#email2').val();
				  
				  if(checkNum == userNum){
					  alert('인증번호가 일치합니다.');
				  }else{
					  alert('인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.');
				  }
			  });
		  }
	  });
	   
});




//주소 체크 (카카오 도로명 주소 API)
function execPostCode() {
     new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            let extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            	extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);
            
            
            $("[name=addr1]").val(data.zonecode);
            $("[name=addr2]").val(fullRoadAddr);
            
            document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr2').value = fullRoadAddr;
      
        }
     }).open();
 };   
	
	
</script>

</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>