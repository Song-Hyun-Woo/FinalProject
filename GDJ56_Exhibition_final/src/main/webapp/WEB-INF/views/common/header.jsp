<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Exhibition</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${path}/resources/assets/img/favicon.png" rel="icon">
  <link href="${path}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${path}/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${path}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${path}/resources/assets/css/style.css" rel="stylesheet">
  
  <script src="${path}/resources/js/jquery-3.6.1.min.js"></script>
 <!-- summernote -->
  <script src="${path}/resources/summernote/summernote-lite.js"></script>
  <script src="${path}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${path}/resources/summernote/summernote-lite.css"> 
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="${path }/">Title</a></h1>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto " href="${path }/newslist.do">NEWS</a></li>
          <li><a class="nav-link scrollto " href="${path }/exhList">EXHIBITION</a></li>
          <li><a class="nav-link scrollto " href="#team">ARTIST</a></li>
          <li><a class="nav-link scrollto " href="">GALLERY</a></li>
          <li><a class="nav-link scrollto " href="${path }/questionWrite.do">QUESTION</a></li>
        </ul>


          <li><a class="getstarted scrollto" href="${path}/member/login.do">Login</a></li>
	
      </nav><!-- .navbar -->
    </div>
    <div> 
	      <c:if test="${loginMember!=null}">
	                <c:if test="${loginMember.memberId = 'admin'}">
	                	<p><a href="${path}/admin/adminMain.do">ADMINPAGE</a></p>
	                </c:if>
	                <c:if test="${loginMember.memberId ne 'admin'}">
	                	<p><a href="${path}/mypage/mypageMain.do">MYPAGE</a></p>
	                </c:if>
                </c:if>
                <c:if test="${loginMember==null}">
                	<%-- <img src="${path}/" onclick="location.assign('${path}/member/login')"> --%>
               </c:if>
      </div>
      </ul>
  </header><!-- End Header -->

  <!-- Vendor JS Files -->
  <script src="${path}/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="${path}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path}/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${path}/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${path}/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${path}/resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${path}/resources/assets/js/main.js"></script>

