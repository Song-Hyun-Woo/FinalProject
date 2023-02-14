<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>
     <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>MONOCLEE</h3>
              <p>
                서울특별시 금천구 가산디지털1로 <br>
                151 이노플렉스 1차 306호, KOR<br><br>
                <strong>Phone:</strong> +82 02-2108-5900<br>
                <strong>Email:</strong> exhibition0101@gmail.com <br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Service list</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="${path }/newslist.do">NEWS</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${path }/exhApiList.do">EXHIBITION</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${path }/">ARTIST</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${path }/">GALLERY</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${path }/questionWrite.do">QUESTION</a></li>
            </ul>
          </div>

        </div>
      </div>
    </div>
  </footer><!-- End Footer -->
  
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${path }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="${path }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${path }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${path }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${path }/resources/assets/vendor/php-email-form/validate.js"></script>


  <!-- Template Main JS File -->

  <script src="${path}/resources/assets/js/main.js"></script>

</body>

</html>