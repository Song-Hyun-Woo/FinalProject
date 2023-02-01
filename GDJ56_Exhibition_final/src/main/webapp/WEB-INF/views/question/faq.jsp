<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main>
	<%-- <jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/> --%>
		
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
        				<strong>Q3. ?</strong>
      				</button>
    			</h2>
	    		<div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading4">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="true" aria-controls="collapse4">
        				<strong>Q4. ?</strong>
      				</button>
    			</h2>
	    		<div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading5">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="true" aria-controls="collapse5">
        				<strong>Q5. ?</strong>
      				</button>
    			</h2>
	    		<div id="collapse5" class="accordion-collapse collapse" aria-labelledby="heading5" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				
	     			</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="heading6">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="true" aria-controls="collapse6">
        				<strong>Q6. </strong>
      				</button>
    			</h2>
	    		<div id="collapse6" class="accordion-collapse collapse" aria-labelledby="heading6" data-bs-parent="#accordionExample">
	      			<div class="accordion-body">
	       				
	     			</div>
				</div>
			</div>
			
		</div>
		
</main>
  
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>