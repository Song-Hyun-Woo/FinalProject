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
	IMP.init("imp27163624"); // 예: imp00000000
	
	if('${book.bookingPrice}' == 0){	// 결제 금액이 0원일 때 
		location.href="<%=request.getContextPath()%>/booking/bookig0Result.do?bookingNo=${book.bookingNo}";
	}else{
		window.onload = function() { requestPay(); } 
	}	
	
	
	// 결제 요청하기
	 
	    function requestPay() {
	      // IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: '${book.bo_re_num}',
	          name: '${exhibition.exTitle}',	
	          amount: '${book.bookingPrice}',
	          buyer_email: "${member.email}",	
	          buyer_name: "${member.name}",
	          buyer_tel: "${member.phone}",
	      }, function (rsp) { 
	      
				if (rsp.success) { // 결제 성공 시
					var msg = '결제가 완료되었습니다.';
					var result = {
						"bookingNo"     : '${booking_No}',		// 예매 번호
						"exNo"      : '${ex_No}',		// 전시 번호
						"bookingPrice"    : '${Price}',		// 결제 금액
						"bookingDate"    : new Date(), 			// 결제 일
						"bookingCheck"      : '${Check}',    	// 예매 확인번호
						"memberId"   	  : '${member.memberId}'		// 회원 아이디
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
				        	/* alert(res); */
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