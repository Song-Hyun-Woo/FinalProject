<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: - Booking :::</title>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>


</head>
<body>

<script>

//IMP 객체 초기화

	var IMP = window.IMP; // 생략 가능
	IMP.init("imp04088045"); // 예: imp00000000
	
	if('${bookingPrice}' == 0){	// 결제 금액이 0원일 때 
		location.href="<%=request.getContextPath()%>/booking/bookig0Result.do?bookingNo=${book.bookingNo}";
	}else{
		window.onload = function() { requestPay(); } 
	}	
	
	
	// 결제 요청하기
	 
	    function requestPay() {
	      // IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ // param
	          pg: "html5_inicis", //pg사 선택
	          name : "전시예매",
	          pay_method: "card",
	          merchant_uid: '${bookingNo}', //전시번호	
	          amount: '100', 
	          buyer_email: "${email}",	// 이메일
	          buyer_name: "${memberName}", //예약자 이름
	          buyer_tel: "${phone}", // 핸드폰
	      }, function (rsp) { 
	      
				if (rsp.success) { // 결제 성공 시
					var msg = '결제가 완료되었습니다.';
					var result = {
						"booking_no"     : '${bookingNo}',		// 예매 번호
						"ex_no"      : '${exNo}',		// 전시 번호
						"booking_price"    : '${bookingPrice}',		// 결제 금액
						"booking_date"    : new Date(), 			// 결제 일
						"booking_check"      : '${bookingCheck}',    	// 예매 확인번호
						"member_id"   	  : '${memberId}'		// 회원 아이디
	          	  	} 				
					/* console.log('res1:' + res1); */
					/* console.log("결제 성공 " + msg); */
					$.ajax({
						url : "<%=request.getContextPath()%>/booking/bookingResult.do",
						type : "post", 
						data : JSON.stringify(result),
						contentType:'application/json;charset=utf-8',
						dataType: 'json', // 서버에서 보내줄 데이터 타입
				        success: function(res){
				       		if(res == 1){
								location.href="<%=request.getContextPath()%>/bookig/bookingSuccess.do";
				        	}else{
								console.log("결제에 실패하였습니다. 다시 시도해주세요.");
								location.href="<%=request.getContextPath()%>/booking/bookingCancel.do?bookingNo=${book.bookingNo}";
							}
						},
						error:function(){
							console.log("insert ajax 통신 실패");
						}	
					}) // ajax
					
	          } else { // 결제 실패 시
	        	  var msg = '결제에 실패하였습니다. 다시 시도해주세요.';
	              msg += '에러 : ' + rsp.error_msg;
	              location.href="<%=request.getContextPath()%>/booking/bookingCancel.do?bookingNo=${book.bookingNo}";
	          }
				console.log(msg);
	      }); // pay
	    }
	
	  
	
	  </script>
	  
	  <div id="paydetail"></div>


</body>
</html>