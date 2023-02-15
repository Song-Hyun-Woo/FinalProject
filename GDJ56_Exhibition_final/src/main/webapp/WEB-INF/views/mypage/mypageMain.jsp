<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param name="title" value=" "/>
</jsp:include>
<link rel="stylesheet" href="${path}/resources/assets/css/style.css" />
<style>



</style>



 <!-- ======= 마이페이지 Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          	<h1 style="margin-top:70px;"> </h1>
          	<br>
          	<br>
			<p style="font-size:17px;">${loginMember.memberName }님, 마이페이지입니다.</p>
        </div>

        <div class="row portfolio-container" style="display: flex; justify-content: center">
        
        <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${path}/resources/images/mypage/좋아요전시회.PNG" class="img-fluid" alt="">
              
              <div class="portfolio-info">
                <div class="portfolio-links">
                <a href="${path}/mypage/updateMember.do?memberId=${loginMember.memberId}">회원정보수정</a>  
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${path}/resources/images/mypage/회원수정.jpg" class="img-fluid" alt="">	
              <div class="portfolio-info">
                <div class="portfolio-links">
                <a href="${path }/mypage/bookingList.do">
                  <h2>나의 예매</h2>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${path}/resources/images/mypage/예매.PNG" class="img-fluid" alt="">
              <div class="portfolio-info">
                <div class="portfolio-links">
                <a href="${path }/mypage/zzim.do">
                  <h2>찜한전시회</h2>
                </a>  
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${path}/resources/images/mypage/문의.PNG" class="img-fluid" alt="">
              <div class="portfolio-info">
                <div class="portfolio-links">
                <a href="${path }/question/questionList.do">
                  <h2>나의 문의</h2>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="${path}/resources/images/mypage/홈2.PNG" class="img-fluid" alt="">
              <div class="portfolio-info">
                <div class="portfolio-links">
                <a href="${path }/mypage/faq.do">
                <h2>FAQ</h2>
                </a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${path}/resources/images/mypage/test1.png" class="img-fluid" alt="">
              <div class="portfolio-info">
                <div class="portfolio-links">
                <a href="${path }/mypage/secession.do">
                  <h2>회원 탈퇴</h2>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End 마이페이지 Section -->