<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>

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
    
    <div class="headcontainer border-top" style="padding-top: 20px"></div>
    <section class="zzim-form">
        <div>
            <div class="sidebar">
            <br>
                <h4>
                    <strong>마이페이지</strong>
                </h4>
                <ul>
                    <li><a href="${path }/mypage/bookingList">예매내역</a></li>
                    <li><a href="${path }/mypage/zzim">찜한 전시회</a></li>
                    <li><a href="${path }/mypage/myQna">나의 문의</a></li>
                    <li><a href="${path }/mypage/faq">FAQ</a></li>
                    <br>
                    <br>
                    <li><h5><b>내정보</b></h5></li>
                    <li><a href="${path }/mypage/updateMember">회원정보 수정</a></li>
                    <li><a href="${path }/mypage/changePw">비밀번호 변경</a></li>
                    <li><a href="${path }/mypage/secession">회원 탈퇴</a></li>
                </ul>
            </div>
        </div>

<main style="width: 70%">
		
		<div class="accordion mt-5" id="accordionExample" style="width: 60%; margin-left: 20%";margin-right: 20%">
		<h2>자주 묻는 질문</h2>
  			<div class="accordion-item mt-5">
    			<h2 class="accordion-header" id="headingOne">
      				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        				<strong>Q1. 예매하려면 회원가입이 필요한가요?</strong>
      				</button>
    			</h2>
	    		<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				네, 사이트의 모든 기능은 회원가입 후 이용할 수 있습니다.
	     			</div>
	    		</div>
  			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
        				<strong>Q2. 한 아이디로 여러 전시전을 예매를 예약할 수 있나요? </strong>
      				</button>
    			</h2>
	    		<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				네, 여러 전시전 예매 가능합니다.
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading3">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="true" aria-controls="collapse3">
        				<strong>Q3. 1:1 문의는 답변은 어디서 확인할 수 있나요?</strong>
      				</button>
    			</h2>
	    		<div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				마이페이지 > 나의문의에서 확인하실 수 있습니다.
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading4">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="true" aria-controls="collapse4">
        				<strong>Q4.예약변경은 가능한지 궁금해요?</strong>
      				</button>
    			</h2>
	    		<div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				예약 변경 등을 희망하실 경우, 예약을 취소하신 후 다시 예약해주셔야 합니다.
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading5">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="true" aria-controls="collapse5">
        				<strong>Q5. 전시 작가 또는 전시관으로 등록하고 싶은데 어떻게 하나요?</strong>
      				</button>
    			</h2>
	    		<div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				exhibition0101@gmail.com로 첨부 서류를 보내주시면 저희가 검토 이후에 회원의 등급을 조정해드리겠습니다. 
	     			</div>
				</div>
			</div>
			
		</div>
</main>

<script>
/* 클릭이벤트  */


</script>


  