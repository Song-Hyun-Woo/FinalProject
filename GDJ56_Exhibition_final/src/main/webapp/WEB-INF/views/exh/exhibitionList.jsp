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
div.excontainer{
	width:100%;
	height:180px;
	background-image: url('${path}/resources/images/exhibitiontitle.png');
}
div#exhibition-container{
	height:auto !important;
}
div#pageBar{
	text-align:center;
	font-size:25px;
}
</style>

<br><br><br><br>
<div class="excontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;EXHIBITION</h3>
</div>
<br>
<section id="portfolio" class="portfolio">
      <div class="container">

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active" onclick='searchCategory("all")'>전체</li>
              <li data-filter=".filter-app" onclick='searchCategory("회화")'>회화</li>
              <li data-filter=".filter-card" onclick='searchCategory("미디어")'>미디어</li>
              <li data-filter=".filter-web"onclick='searchCategory("디자인")'>디자인</li>
              <li data-filter=".filter-web" onclick='searchCategory("사진")'>사진</li>
              <li data-filter=".filter-web" onclick='searchCategory("조각")'>조각</li>
            </ul>
          </div>
        </div>
        <div id="exhibition-container" class="row portfolio-container">
			<h3>loading......</h3>
        </div>

      </div>
    </section><!-- End Portfolio Section -->
    
<br><br>
	<!--페이징처리  -->
	<!-- <div id="pageBar">
		<a href="javascript:requestExhibition(1)">1</a>
		<a href="javascript:requestExhibition(2)">2</a>
		<a href="javascript:requestExhibition(3)">3</a>
		<a href="javascript:requestExhibition(4)">4</a>
	</div> -->
	<br>
<!--
	row를 배열로 저장해서 for문으로 
	API 파싱해서 데이터 출력
-->
<script>
	let exhibitionData={};
	$(()=>{								//onload함수
		requestExhibition();
	});
    function requestExhibition(page=1,perpage=50){
    	$.ajax({
		      type: "GET",
		      url: "${path}/exhApiList.do",
		      data: {page:page,perPage:perpage},
		      success: function(response){
		        const data=JSON.parse(response).ListExhibitionOfSeoulMOAInfo.row;
		        exhibitionData=data;
		        createDataTag(data);
		    }}
    	);
    }
    
    function searchCategory(type){
    	if(type!='all'){
	    	const searchData=exhibitionData.filter(e=>e['DP_ART_PART'].includes(type));
	    	createDataTag(searchData).css("height",'auto !important');
    	}else{
    		createDataTag(exhibitionData).css("height",'auto !important');
    	}
    }
    
    
    function createDataTag(data){
    	console.log(data);
    	 const dataContainer=$("div#exhibition-container").css("height",'auto');
	     dataContainer.html('');
    	 data.forEach(e=>{
	        	const container=$("<div  class='col-lg-4 col-md-6 portfolio-item filter-web'>");
	        	const maincontainer=$("<div class='portfolio-wrap'>");
	        	const headerImage=$("<img class='img-fluid' alt=''>").attr({
	        		src:e['DP_MAIN_IMG']
	        	});
	        	const content=$("<div class='portfolio-info'>");
	        	const no=$("<p>").text(e['DP_SEQ']);
	        	content.append(no);
	        	const p=$("<h4>").text(e['DP_NAME']);
	        	content.append(p);
	        	const subcontent=$('<div class="portfolio-links">');
	        	const linka=$('<a>').attr({
	        		"href" : "${path}/exhibitionView.do=",
	        		"title":"More Details"
	        	}).html('<i class="bx bx-link"></i>');
	        	subcontent.append(linka);
	        	content.append(subcontent);
	        	
	        	maincontainer.append(headerImage);
	        	maincontainer.append(content);
	        	
	        	container.append(maincontainer);
	        	
	        	dataContainer.append(container);
	    });
	}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>