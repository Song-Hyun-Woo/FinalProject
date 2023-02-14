<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 카카오맵 API 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e610ab514914e179634c73ca831a83ac&libraries=services"></script>

<c:set var="path" value="${pageContext.request.contextPath }"/>       

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<br><br><br>
    <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" data-bs-interval="3000" class="carousel slide carousel-fade" data-bs-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background-image: url(${path}/resources/assets/img/slide/mainslide.png);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">제제 《 BAD BOY 》</h2>
                <p class="animate__animated animate__fadeInUp">장디자인아트는 12월 27일(화) 부터 2월 4일(토) 까지 | 순수한 어린아이의 형상에 과감하게 표현된 컬러풀한 색상으로 이루어져 귀엽고 사랑스러운 모습이지만 자유로운 드로잉과 함게 쓰인 단어들은 반항기 가득한 이중적인 표현을 시각화한 제제의 작품을 소개합니다. </p>
                <div>
                  <a href="https://www.jeandesignart.com/jeje-4" target='_blank' class="btn-get-started animate__animated animate__fadeInUp scrollto">사이트 바로가기</a>
                </div>
              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background-image: url(${path}/resources/assets/img/slide/mainslide2.png);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">마우리치오 카텔란 《 WE 》</h2>
                <p class="animate__animated animate__fadeInUp">리움미술관은 2023년 1월 31일(화) 부터 7월 16일(일) 까지 | 이 시대의 가장 논쟁적인 작가로 알려진 마우리치오 카텔란의 작품을 소개합니다.</p>
                <div>
                  <a href="https://www.leeum.org/exhibition/exhibition01_detail.asp?seq=56" target='_blank' class="btn-get-started animate__animated animate__fadeInUp scrollto">사이트 바로가기</a>
                </div>
              </div>
            </div>
          </div>

          <!-- Slide 3 -->
          <div class="carousel-item" style="background-image: url(${path}/resources/assets/img/slide/mainslide3.png);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">유재연 《 장미산책 》</h2>
                <p class="animate__animated animate__fadeInUp">아트스페이스에서는 2023년 1월 5일(목) 부터 2월 2일(목) 까지 | 밤의 사유들로부터 출발한 일상과 환상이 병존하는 풍경, 인물들이 겪는 크고 작은 사건을 표현한 작가 유재연의 작품을 소개합니다.</p>
                <div>
                  <a href="https://www.shinsegae.com/culture/gallery/exhibition/view.do?glrySeq=1049&" target='_blank' class="btn-get-started animate__animated animate__fadeInUp scrollto">사이트 바로가기</a>
                </div>
              </div>
            </div>
          </div>

        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>

      </div>
    </div>
    
  </section><!-- End Hero -->


    <section id="clients" class="clients section-bg">
      <div class="container">

        <div class="row">

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="${path}/resources/assets/img/clients/client-1.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="${path}/resources/assets/img/clients/client-2.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="${path}/resources/assets/img/clients/client-3.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="${path}/resources/assets/img/clients/client-4.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="${path}/resources/assets/img/clients/client-5.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="${path}/resources/assets/img/clients/client-6.png" class="img-fluid" alt="">
          </div>

        </div>

      </div>
    </section><!-- End Clients Section -->

  


    



    <!-- ======= Team Section ======= -->
    <!-- 작가.. -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>MONOCLEE ARTIST</h2>
          <p>MONOCLEE은 미술시장의 폐쇄성을 타파하고, 미술을 확산시키기 위해 각 분야의 전문가들이 모여 창립했습니다.<br>큐레이터, 도슨트, 기획자, 디자이너 각 분야에서 우수한 능력을 발휘하고 있는 이들이 함께합니다.<br>작품 및 전시회 선호도, 미술 취향에 대한 메타데이터를 구축해 작가ㆍ전시관ㆍ관람객 3주체가 모두 만족하는 서비스를 제공합니다.</p>
        </div>

        <div class="row">

          <div class="col-xl-3 col-lg-4 col-md-6">
            <div class="member">
              <img src="${path}/resources/assets/img/team/team-1.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김영수 Kim yeongsu</h4>
                  <span>Picture Artist</span>
                  <div class="social">
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=5899&flag=cv"><i class="bi bi-twitter"></i></a>
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=5899&flag=cv"><i class="bi bi-facebook"></i></a>
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=5899&flag=cv"><i class="bi bi-instagram"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.1s">
            <div class="member">
              <img src="${path}/resources/assets/img/team/team-2.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>나탈리 레테 Nathalie Lété</h4>
                  <span>Painting Artist</span>
                  <div class="social">
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=6497"><i class="bi bi-twitter"></i></a>
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=6497"><i class="bi bi-facebook"></i></a>
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=6497"><i class="bi bi-instagram"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.2s">
            <div class="member">
              <img src="${path}/resources/assets/img/team/team-3.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>차계남 Cha keanam</h4>
                  <span>Molding Artist</span>
                  <div class="social">
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=1751"><i class="bi bi-twitter"></i></a>
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=1751"><i class="bi bi-facebook"></i></a>
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=1751"><i class="bi bi-instagram"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
            <div class="member">
              <img src="${path}/resources/assets/img/team/team-4.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>파블로 피카소 Pablo Ruiz Picasso</h4>
                  <span>Cubism Artist</span>
                  <div class="social">
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=311"><i class="bi bi-twitter"></i></a>
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=311"><i class="bi bi-facebook"></i></a>
                    <a href="http://www.mu-um.com/?mid=01&act=dtl&idx=311"><i class="bi bi-instagram"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Team Section -->
    
    
    
    
    <!-- ======= Frequently Asked Questions Section ======= -->
    <!--FaQ 소개 Section  -->
    <section id="faq" class="faq section-bg">
      <div class="container">

        <div class="section-title">
          <h2 >MONOCLEE Introduce</h2>
        </div>
        <div class="faq-list">
          <ul>
            <li data-aos="fade-up">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" class="collapse" data-bs-target="#faq-list-1">MONOCLEE 이란?? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-1" class="collapse show" data-bs-parent=".faq-list">
                <p>
                  MONOCLEE은 사용자의 미술적 '취향', '호감도'를 파악하여 취향의 자유만큼이나, 나와 다른 취향에 대한 공감, 예술작가의 작품에 대한 존중이<br> 중요하다는 취지로 보다 많은 작품과 좋은 전시회를 사용자 맞춤으로 추천 드립니다.<br>MONOCLEE은 전국의 미술관, 갤러리 장소 정보 데이터를 구축해서 사용자의 위치, 거주지 체크인 정보를 분석하여 실시간 개최중인 미술 전시 관람의<br> 접근이 용이하도록 노력하겠습니다.
                </p>
              </div>
            </li>

            <li data-aos="fade-up" data-aos-delay="100">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-2" class="collapsed">MONOCLEE 회원에게는 어떤 혜택이 있나요?? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-2" class="collapse" data-bs-parent=".faq-list">
                <p>
                  MONOCLEE 회원이 되시면, 회원님의 개인 취향과 더불어 거주지에서 가까운 전시회를 알려드리며, 취향분석을 기반으로 <br>전시회를 추천해드립니다.
                </p>
              </div>
            </li>

            <li data-aos="fade-up" data-aos-delay="200">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-3" class="collapsed">MONOCLEE에 나의 작품을 등록하고 홍보하고 싶습니다. <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-3" class="collapse" data-bs-parent=".faq-list">
                <p>
                  창작 활동을 하는 작가 회원님들은 회원가입을 작가로 하신후 MONOCLEE에서 전시회를 등록할 수 있습니다. 작품등록에 대한 오류나 해상도가 큰파일에 대한 등록 요청은 MONOCLEE 지원센터 exhibition0101@gmail.com 로 메일을 보내주시면 최선을 다해 도와드리겠습니다.
                </p>
              </div>
            </li>

            <li data-aos="fade-up" data-aos-delay="300">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-4" class="collapsed">작품 정보 or 전시회 or 갤러리의 정보가 올바르지 않아요! <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-4" class="collapse" data-bs-parent=".faq-list">
                <p>
                	MONOCLEE의 작가, 작품정보는 서울시립미술관, 한국문화예술위원회_미술작가목록을 기반으로 구축되었습니다. 이에, 실시간 정확하지 않은 정보가<br> 있을 수 있는 점을 양해 부탁드리며, 전시회, 작품 이미지, 작가 프로필이 사실과 다를 경우, exhibition0101@gmail.com로 메일을 보내 주시면<br> 최대한 빨리 수정 내용을 반영해드리겠습니다. 
                </p>
              </div>
            </li>

            <li data-aos="fade-up" data-aos-delay="400">
              <i class="bx bx-help-circle icon-help"></i> <a data-bs-toggle="collapse" data-bs-target="#faq-list-5" class="collapsed">MONOCLEE이 나아갈 방향! <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
              <div id="faq-list-5" class="collapse" data-bs-parent=".faq-list">
                <p>
                	저희 홈페이지는 회원, 작가 여러분의 관심을 받아 더욱 성장하는 MONOCLEE이 되도록 항상 노력하고 있습니다.<br>홈페이지를 이용하시면서 불편한 점이나 요구사항이 있는 경우엔 Question을 이용해 주시면 확인 후 최대한 반영이 되도록 수정, 업데이트 하도록 노력하겠습니다<br>
                </p>
              </div>
            </li>

          </ul>
        </div>
      </div><br>
    </section><!-- End Frequently Asked Questions Section -->
    
    <div class="section-title">
          <h2 >MONOCLEE Location</h2>
        </div>
    <div id="map" style="width:80%;height:400px;margin-left:150px;"></div>
	<script>
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

	// 키워드로 장소를 검색합니다
	ps.keywordSearch('구디아카데미', placesSearchCB); 

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
		
	</script>
    
    <br>
    
    <br>
    
    

</body>
</html>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>