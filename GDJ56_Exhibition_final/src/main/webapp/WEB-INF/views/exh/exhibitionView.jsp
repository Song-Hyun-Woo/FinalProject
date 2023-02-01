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

</style>
<br><br><br><br>
<div class="excontainer">
	<h3>&nbsp;&nbsp;&nbsp;&nbsp;EXHIBITION - VIEW</h3>
</div>
<br>
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
        <%-- <div class="row gy-4">
          <div class="col-lg-8">
              <div class="swiper-wrapper align-items-center">
                <div class="swiper-slide">
                  <img src="${path }/assets/img/portfolio/portfolio-1.jpg" alt="">
                </div>
              </div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>Project information</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>		<!--작가 이름  -->
                <li><strong>Client</strong>: ASU Company</li>		<!-- 전시장소 -->
                <li><strong>Project date</strong>: 01 March, 2020</li>	<!-- 전시 시작 기간 -->
                <li><strong>Project date</strong>: 01 March, 2020</li>	<!-- 전시 종료 기간 -->
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>		<!-- 전시 URL -->
                <li><strong>Project URL</strong>: <button onclick="location.replace('')">예매</button></li>		<!-- 전시 URL -->
              </ul>
            </div>
            <div class="portfolio-description">
              <h2>This is an example of portfolio detail</h2>	<!--전시 내용  -->
              <p>
                Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.
              </p>
            </div>
          </div>
        </div>
      </div> --%>
    </section><!-- End Portfolio Details Section -->

<script>
    let exhibitionView={};
    
	$(()=>{								//onload함수
		requestExhibition();
	});
	
	function requestExhibition(no){
		$.ajax({
	      type: "GET",
	      url: "${path}/exhApiList.do",
	      data: {no:no},
	      success: function(response){
	        const data=JSON.parse(response).ListExhibitionOfSeoulMOAInfo.row;
	        exhibitionView=data;
	        createViewTag(data);
	    }}
	);
}
	function createViewTag(data){
		const dataContainer=$("div.container").css("height","auto");
		dataContainer.html('');
		const container=$("<div class='row gy-4'>");
		const maincontainer=$("<div class='col-lg-8'>");
		const imgcontainer=$("<div class='swiper-slide'>");
		const mainimg=$("<img alt=''>").attr({
			src:['DP_MAIN_IMG']
		});
		const content=$("<div class='col-lg-4'>");
		const contentinfo=$("<div class='portfolio-info'>");
		
		const title=$("<h3>").text(['DP_NAME']);
		const ul=$("<ul>");
		const strong1=$("<strong>").text("작가 이름 : ");
		const li1=$("<li>").append(strong1).text(['DP_ARTIST']);
		
		const strong2=$("<strong>").text("전시 장소 : ");
		const li2=$("<li>").append(storng2).text(['DP_PLACE']);
		
		const strong3=$("<strong>").text("전시 시작일 : ");
		const li3=$("<li>").append(strong3).text(['DP_START']);
		const strong4=$("<strong>").text("전시 종료일 : ");
		const li4=$("<li>").append(strong4).text(['DP_END']);
		
		const strong5=$("<strong>").text("홈페이지 URL : ");
		const a=$("<a>").attr({
			"href" : "[DP_LNK]"
		});
		strong5.append(a);
		const li5=$("<li>").append(strong5);
		
		const button=$("<button class='btn btn-md btn-dark btn-block' onclick='location.replace('${path}')'>결제");
		const li6=$("<li>").append(button);
		
		//////////////////////////////////////////////////////
		contentinfo.append(li6);
		contentinfo.append(li5);
		contentinfo.append(li4);
		contentinfo.append(li3);
		contentinfo.append(li2);
		contentinfo.append(li1);
		contentinfo.append(ul);
		contentinfo.append(title);
		
		const detail=$("<div class='portfolio-description'>");
		const h4=$("<h4>").text('[DP_INFO]');
		detail.append(h4);
		
		//div.col-lg-4 > div.portfolio-info > div.portfolio-description
		content.append(contentinfo);
		content.append(detail);
		
		//div.swiper-slide > mainimg
		imgcontainer.append(mainimg);
		
		//div.col-lg-8 > div.swiper-slide
		maincontainer.append(imgcontainer);
		
		//div.row gy-4 > div.col-lg-8
		container.append(maincontainer);
		
		//div.container > div.row gy-4
		dataContainer.append(container);
		
		
		
		
		
		/* 태그 변수 생성해서 append 해서 추가 해서 사용하기  */
		
	}
    
    
    
    
    
    
</script>












<jsp:include page="/WEB-INF/views/common/footer.jsp"/>