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

  <title>MONOCLEE</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${path}/resources/assets/img/test.png" rel="icon">
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

      <h1 class="logo"><a href="${path }/">MONOCLEE</a></h1>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto " href="${path }/newslist.do">NEWS</a></li>
          <li><a class="nav-link scrollto " href="${path }/exhList">EXHIBITION</a></li>
          <li><a class="nav-link scrollto " href="${path }/artistList.do">ARTIST</a></li>
          <li><a class="nav-link scrollto " href="">GALLERY</a></li>
          <li><a class="nav-link scrollto " href="${path }/questionWrite.do">QUESTION</a></li>
          
          <%-- <li><a class="getstarted scrollto" href="${path}/member/login.do">Login</a></li> --%>
        
        	<c:if test="${loginMember==null }">
                 <li> <a class="getstarted scrollto" href="${path}/member/login.do">Login</a></li>
              </c:if>
              <!-- 일반회원 로그인 -->
              <c:if test="${ (loginMember!=null) && (loginMember.memberId ne 'admin') }">
                 <li class="dropdown"><a class="btn btn-Secondary dropdown-toggle" href="${path }/mypage/mypageMain.do" data-toggle="dropdown">MYPAGE</a> 
                 <ul class="dropdown-menu dropdown-menu-dark" role="menu">
                 <li class="dropdown"><a href="${path }/mypage/updateMember.do?memberId=${loginMember.memberId}" >MODIFY</a></li>
                 <li class="dropdown"><a href="${path }/mypage/bookingList.do" >RESERVATION</a></li>
                 <li class="dropdown"><a href="${path }/mypage/zzim2.do" >ZZIM</a></li>
                 <li class="dropdown"><a href="${path }/member/logout.do" >LOGOUT</a></li>              
                   </ul>
                 </li> 
              </c:if>
              <!-- 관리자 로그인-->
              <c:if test="${(loginMember!=null) && (loginMember.memberId eq 'admin') }" >
         		<li class="dropdown"><a class="btn btn-Secondary dropdown-toggle" href="${path }/common/adminHeader.do" data-toggle="dropdown">ADMINPAGE</a>
         		 <ul class="dropdown-menu dropdown-menu-dark" role="menu">
         		 	<li class="dropdown"><a href="${path }/admin/memberList.do" >MANAGEMENT</a></li>
         		 	<li class="dropdown"><a href="${path }/question/questionList.do" >QNA</a></li>
                 	<li class="dropdown"><a href="${path }/member/logout.do" >LOGOUT</a></li>              
                   </ul>
                   </li>
   	  		</c:if>	
   	  		
  </header><!-- End Header -->