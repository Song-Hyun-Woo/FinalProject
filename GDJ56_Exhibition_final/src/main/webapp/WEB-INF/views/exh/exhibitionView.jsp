<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!-- 카카오맵 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e610ab514914e179634c73ca831a83ac&libraries=services"></script>

<!-- 카카오 공유하기 -->        
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script>
  Kakao.init('e610ab514914e179634c73ca831a83ac'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<!-- 결제  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<c:set var="path" value="${pageContext.request.contextPath }"/>       

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<style>
div.excontainer{
	width:100%;
	height:180px;
	background-image: url('${path}/resources/images/exhibitiontitle.png');
}
div.swiper-slide>img{
	width: 800px;
    height: 1000px;
    margin-left:80px;
}
div.portfolio-info{
	width:500px;
	margin-right:31px;
}
div.col-lg-8{
	width:auto;
}
div.col-lg-4{
	margin-left:40px;
	border-top: 1px solid #e6e6e6;
}
section.portfolio-details{
	border-top: 1px solid #e6e6e6;
}
	table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-reply{display:none;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-reply{display:inline;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}

</style>
<br><br><br><br>
<div class="excontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;EXHIBITION - VIEW</h3>
</div>
<body style="overflow-x: clip;">
<br>

<main id="main">
    <section id="portfolio-details" class="portfolio-details" >
      <div class="viewcontainer">
       
      </div>
    </section><!-- End Portfolio Details Section -->
</main>
    <!-- 댓글 컨테이너 -->
    
	<!-- 로그인시에만 보이게 분기처리 -->
	<c:if test="${not empty loginMember }">
		<div class="comment-count">댓글 <span id="count">0</span></div>
		
	    <div class="rcontainer" style="margin-left: 230px;">
	    <form id="commentForm" name="commentForm" method="post" action="${path }/insertReview.do">
	    <br><br>
	        <div>
	            <div>
	                <span><strong>Review</strong></span>
	            </div>
	            <div>
	                <table>                    
	                    <tr>
	                        <td>
	                        <!--댓글에는 작성자, 댓글을 달 게시물, 댓글 내용,  -->
	                            <textarea style="width: 1100px" rows="3" cols="30" id="reviewContent" name="reviewContent" placeholder="리뷰를 입력하세요"></textarea>
	                            <input type="hidden" name="exNo" id="exNo" value="${param.no }"><!-- 댓글을 달 게시글 번호 ['DP_SEQ'] -->
	                            <input type="hidden" name="writer" id="writer" value="${not empty loginMember? loginMember.memberId:'' }"><!--댓글 작성자 -->
	                            <br><br>
	                            <div>
	                                <input type="submit" class="btn pull-right btn-success" id="clickc" style="margin-left: 1045px;" value="등록">
	                            </div>
	                        </td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	    </form>
	</div>
	
	<c:if test="${not empty review }">
		<div class="comment_Box" style="border:1px solid gray;"></div>
		<%-- <c:forEach var="r" items="${review }">
			<div class="rcontainer">
			    <form id="commentListForm" name="commentListForm" method="post">
			        <div id="commentList">
			        	<sub><c:out value="${r.writer }"/></sub>
			        	<sub><c:out value="${r.review_date }"/></sub>
			        	<br>
			        	<c:out value="${r.review_content }"/>
			        </div><br>
			        <div>
			        	<c:if test="${loginMember.memberId eq 'admin'||loginMember.memberId eq (r.writer)}">
			        		<button class="btn-delete">삭제</button>
			        	</c:if>
			        </div>
			    </form>
			</div>
		</c:forEach> --%>
	</c:if>
</c:if>
<br>
		<h5 style="text-align:center;">EXHIBITION LOCATION</h5> 
	<div id="map" style="width:80%;height:400px;margin:auto;border:3px solid;border-color:rgba(18, 63, 63, 63);">
	</div>
<br>

		<div class="card-body" style="text-align:center;">
            <a href='${path }/exhList' class="btn btn-sm btn-dark btn-block" role="button">목록</a>
        </div>
        <br>

</body>
<script>
//관람평 구현

$('#clickc').click(function(){
	const pno=${param.no};
	const writer=$('#writer').val();
	const content=$('#reviewContent').val();
	
	console.log(pno);
	console.log(writer);
	console.log(content);
	
	$.ajax({
		type:'post',
		url:'${path}/insertReview.do',
		data:JSON.stringify(
			{
				"pno":pno,
				"writer":writer,
				"content":content
			}	
		),
		contentType:'application/json',
		success:function(data){
			if(data==='Success'){
				consol.log('댓글 등록 완료');
				$('#writer').val(writer);
				$('#content').val('');
				getList();
			}
		}
	});
});

getList();

function getList(){
	const pno=${param.no};
	const writer=$('#writer').val();
	const content=$('#reviewContent').val();
	
	$.getJSON(
		'${path}/insertReview.do'+pno,
		function(data){
			if(data.total>0){
				var list =data.list;
				var comment="<div>";
				$('#count').html(data.total);
				for(i=0;i<list.length;i++){
					var content=list[i].content;
					var writer=list[i].writer;
					comment+="<div><span id='writer'><storng>"+writer+"</strong></span><br>";
					comment+="<span id='content'>"+content+"</span><br>";
					
				}
				$(".comment_Box").html(comment);
			}
		}
	)
}






	
////////////////////////////////////////////////////////////////////////		
/* 	      url: "${path}/exhibitionView.do?no="+['DP_SEQ'], */
		
   let exhibitionViews={};
    //let exhibitionViews;
   //let place="";
    
	$(()=>{								//onload함수 적용
		requestExhibition();
	});
	
	function requestExhibition(no){
		//console.log("${no}");
		$.ajax({
	      type: "GET",
	      url: "${path}/exhibitionView.do?no="+"${no}",
	      data: {no:no},
	      success: function(response){
	    	  //console.log(no);
	        const data=JSON.parse(response).ListExhibitionOfSeoulMOAInfo.row;
	        //console.log(data);
	        exhibitionViews=data;
	        createViewTag(data[0]);
	        makeMap(data[0]['DP_PLACE']);
	    }}
	);
}
	
	function createViewTag(data){
		//console.log(data);
		//console.log(data['DP_NAME']);
		//place=data['DP_PALECE'];
		const dataContainer=$("div.viewcontainer").css("height","auto");
		dataContainer.html('');
		const container=$("<div class='row gy-4'>");
		const maincontainer=$("<div class='col-lg-8'>");
		const imgcontainer=$("<div class='swiper-slide'>");
		const mainimg=$("<img alt=''>").attr({
			src:data['DP_MAIN_IMG']
		});
		const content=$("<div class='col-lg-4'>");
		const contentinfo=$("<div class='portfolio-info'>");
		const title=$("<h3>").text(data['DP_NAME']);
		contentinfo.append(title);
		
		const ul=$("<ul>");
		const strong1=$("<strong>").text(" 작가\u00a0\u00a0\u00a0:\u00a0\u00a0\u00a0");
		/* const li1=$("<li>").append(strong1); */
		const li1=$("<li>").text(data['DP_ARTIST']);
		li1.prepend(strong1).css("list-style-type","square");
		contentinfo.append(li1);
		
		const strong2=$("<strong>").text(" 장소\u00a0\u00a0\u00a0:\u00a0\u00a0\u00a0");
		const li2=$("<li>").text(data['DP_PLACE']);
		li2.prepend(strong2).css("list-style-type","square");
		contentinfo.append(li2);
		
		const strong3=$("<strong>").text("전시 시작일\u00a0\u00a0\u00a0:\u00a0\u00a0\u00a0");
		const li3=$("<li>").text(data['DP_START']);
		li3.prepend(strong3).css("list-style-type","square");
		contentinfo.append(li3);
		
		const strong4=$("<strong>").text("전시 종료일\u00a0\u00a0\u00a0:\u00a0\u00a0\u00a0");
		const li4=$("<li>").text(data['DP_END']);
		li4.prepend(strong4).css("list-style-type","square");
		contentinfo.append(li4);
		
		
		
		const strong6=$("<strong>").text("가격\u00a0\u00a0\u00a0:\u00a0\u00a0\u00a0");
		const li6=$("<li>").text(data['DP_VIEWCHARGE'].replace(/(<[a-z ="/]*>)|&lt;|&gt;|&nbsp;|<[^>]*>?/g,""));
		if(data['DP_VIEWCHARGE']==''){
			li6.text('무료');
		}
		//전시 비용이 무료이면 값이 출력 안돼는데.... 디폴트 무료.....
		//'DP_ViEWCHARGE' 에 값이 없으면 '무료' 출력 함
		
		li6.prepend(strong6).css("list-style-type","square");
		contentinfo.append(li6);
		
		
		
		const strong5=$("<strong>").text("홈페이지 URL\u00a0\u00a0\n");
		const at=$("<a>").attr({
			"href" : data['DP_LNK']
		});
		at.text(data['DP_LNK']);											//링크를 누르면 URL 값에 data['DP_LNK'] 가 들어감..
		strong5.append(at);
		//const li5=$("<li>").text(data['DP_LNK']);
		const li5=$("<li>");
		li5.prepend(strong5).css("list-style-type","square");
		contentinfo.append(li5);
		
		
		const li7=$("<li>").text("\u00a0");
		li7.css("list-style","none");
		contentinfo.append(li7);
		
		const button=$("<button class='btn btn-success' onclick='requestPay();')'>").text("예매");
		button.css("margin-left","180px");
		contentinfo.append(button);
		
		
		//카카오 공유하기 추가
		
		
		
		/* 태그 변수 생성해서 append 해서 추가 해서 사용하기  */
		////////////////////////////////////////////////////////////////////////////////////
		contentinfo.append(ul);
		
		//태그는 리플레이스로 잘라내서 사용
		//패턴으로 정규표현식 써서 잘라낸다
		// 전체 태그 삭제 .replace(/(<[a-z ="/]*>)/g,"");
		// nbsp; 삭제 .replace(/&nbsp;/gi,' ');
		//innerText로 보내줌
		
		//객체에 .replace해서 못찾았다 받아오는 데이터에 .replace해야 잘 찾는다
		
		const detail=$("<div class='portfolio-description'>");
		let h5=$("<h5>");
		h5.text("전시 정보");
		detail.append(h5);
		let content1=data['DP_INFO'].replace(/(<[a-z ="/]*>)|&lt;|&gt;|&nbsp;|<[^>]*>?/g,"");
		let pp=$("<p>").text(content1);
		//pp.replace(/&nbsp;/gi,' ');		//&nbsp;는 공백으로 교체
		//pp.replace(/\&lt;/g,"<");			//&lt는 < 교체
		//pp.replace(/\&gt;/g,">");			//&gt는 > 교체
		/////////////////////////////////////////////////////////////전부 삭제로 교체
		
		//console.log(pp);
		detail.append(pp).css("border-top","2px solid #e6e6e6");
		
		
		//div.col-lg-4 > div.portfolio-info > div.portfolio-description
		content.append(contentinfo);
		content.append(detail);
		
		//div.swiper-slide > mainimg
		imgcontainer.append(mainimg);
		
		//div.col-lg-8 > div.swiper-slide
		maincontainer.append(imgcontainer);
		
		//div.row gy-4 > div.col-lg-4
		container.append(maincontainer);
		//div.row gy-4 > div.col-lg-8
		container.append(content).css("border-bottom","1px solid #e6e6e6");
		
		//div.container > div.row gy-4
		dataContainer.append(container);
		
		
	}
    ///////////////////////////////////////////////////
//카카오맵 api 적용 키워드(['DP_PLACE'])를 이용해서 맵핑찍기
  function makeMap(place){ 
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	console.log(place);
	
	// 키워드로 장소를 검색합니다
	ps.keywordSearch(place, placesSearchCB); 
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
  }
 
</script>

<script>

// 결제

	var IMP = window.IMP; // 생략 가능

	// 결제 금액이 0원일 때 
<%-- 	if('${bookingPrice}' == 0){	
	location.href="<%=request.getContextPath()%>/booking/bookig0Result.do?bookingNo=${book.bookingNo}";
	}else{
		window.onload = function() { requestPay(); } 
	} --%>

	// 결제 요청하기 (테스트)
	function requestPay() {
	// IMP.request_pay(param, callback) 결제창 호출

		IMP.init('imp04088045'); // 자신의 "가맹점 식별코드"
		IMP.request_pay({
		    pg: 'html5_inicis', // pg사 선택, version 1.1.0부터 지원.
		    pay_method: 'card', // 지불방법
		    merchant_uid : 'merchant_'+new Date().getTime(), //주문번호
		    name : '전시예매', // 결제창에 노출될 상품명
		    amount : 10, // 결제 금액
//		    customer_uid: "id" + new Date().getTime(), //빌링키 발급을 위한 id
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '${memberName}',
		    buyer_tel : '${phone}'
	  	}, function (rsp) { // callback
			  console.log(rsp);
			    if (rsp.success) {
			      var msg = '결제가 완료되었습니다.';
			      alert(msg);
			      location.href = "" // 결제 완료 후 이동할 페이지 url ${path}/memberId=${loginMember.memberId}
			    } else {
			      var msg = '결제에 실패하였습니다.';
			      msg += '에러내용 : ' + rsp.error_msg;
			      alert(msg);
			    }
		  });
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>