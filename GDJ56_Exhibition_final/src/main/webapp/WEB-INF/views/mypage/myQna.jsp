<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
    .proName {
        font-size: 20px;
        text-decoration: none;
        color: black;
    }
    
    .close {
        display: inline-block;
        font-weight: bold;
        text-decoration: none;
        color: black;
        float: right;
         margin-bottom: 10px;
    }
    
    .close:after {
        content: "\00d7";
        font-size: 15pt;
    }
    
    .zzim-form {
        margin-left: 100px;
        margin-right: 100px;
        margin-top: 50px;
        display: flex;
    }
    
    .sidebar {
        width: 100%;
        height: 600px;
        width: 200px;
        position: sticky;
        top: 50px;
    }
    
    .sidebar ul {
        padding: 0;
        margin-top: 40px;
    }
    
    .sidebar ul li {
        list-style: none;
        margin-top: 20px;
    }
    
    .sidebar ul li a {
        text-decoration: none;
        color: #999;
    }
    
    .sidebar ul li a:hover {
        color: black;
    }
    
  /*   .zzim-container {
        width: 100%;
        position: relative;
        margin-left: 50px;
    } */
    
    .btn-delete {
        width: 100px;
        height: 35px;
        font-size: 16px;
        background-color: white;
        border: 1px solid #999;
        border-radius: 10px;
    }
    
    .btn-delete:hover {
        background-color: black;
        color: #fff;
    }
    
    .check-input {
        border-radius: 0.25em;
        width: 16;
        height: 16;
    }
    
    /* 드롭다운 css */
    #browsers {
        background-color: white;
        border: 1px solid gray;
        border-radius: 6px;
        padding: 0.2em 0.2em 0.2em 0.2em;
    }
    
    .close {
        display: inline-block;
        font-weight: bold;
    }
    
    .close:after {
        content: "\00d7";
        font-size: 15pt;
    }
    /* 선택금액표시 div */
    .allprice-container {
        border: 4px solid black;
        text-align: center;
        margin-top: 50;
    }
    
    .allprice-content {
        display: inline-block;
        margin: 0 auto;
        vertical-align: top;
    }
    
    .allprice-form {
        padding: 20px 15px 18px;
        line-height: 17px;
        color: #555;
        text-align: center;
    }
    
    .all-plus {
        margin: 0 11px 0 10px;
        /* vertical-align: -4px; */
    }
    
    .allprice-form i {
        padding: 0 4px 0 5px;
        font: 700 17px/17px tahoma;
        color: #111;
    }
    
    .allprice-form
    .final-price {
        color: red;
        font-size: 20px;
    }
    
 /*    .zzimandprice button {
        width: 400;
        height: 50;
        margin: 30;
        margin-top: 70;
        border-radius: 6px;
        font-size: 19;
    } */
    
/*     .btn-zzim {
        background-color: #999;
        color: white;
        border: 1px solid #999;
    }
    
    .btn-zzim:hover {
        background: black;
    } */
    
    .btn-buy {
        color: #fff;
        background-color: #dc3545;
        border: 1px solid #dc3545;
    }
    
    .btn-buy:hover {
        background-color: #bb2d3b;
    }
    </style>
    
    <div class="headcontainer border-top" style="padding-top: 20px"></div>
    <section class="zzim-form">
        <div>
            <div class="sidebar">
                <h4>
                    <strong>마이페이지</strong>
                </h4>
                <ul>
                    <li><a href="${path }/mypage/bookingList">예매내역</a></li>
                    <li><a href="${path }/mypage/zzim">찜한 전시회</a></li>
                    <li><a href="${path }/mypage/myQna">나의 문의</a></li>
                    <li><a href="${path }/mypage/faq">자주묻는질문</a></li>
                    <br>
                    <br>
                    <li><h5><b>내정보</b></h5></li>
                    <li><a href="${path }/mypage/updateMember">회원정보수정</a></li>
                    <li><a href="${path }/mypage/changePw">비밀번호변경</a></li>
                    <li><a href="${path }/mypage/secession">회원 탈퇴</a></li>
                </ul>
            </div>
        </div>


	<div class="overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">분류</th> <!-- 0-1대1 / 1-전시  -->
                      <th class="px-4 py-3">제목</th>
                      <th class="px-4 py-3">답변여부</th>
                      <th class="px-4 py-3">작성날짜</th>
                    </tr>
                  </thead>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  >
                   <c:if test="${empty qa}">
                   		<tr class="text-gray-700 dark:text-gray-400">
	                      <td class="px-4 py-3" colspan="4">
	                       	1:1 문의내역이 없습니다.
	                     </td>
	                    </tr>
                   </c:if>
                   
                   <c:if test="${not empty qa}">
                   		<c:forEach var="q" items="${qa }">
                   			<tr class="text-gray-700 dark:text-gray-400">
		                      <td class="px-4 py-3 text-sm">
		                        <!--${}  -->
		                      </td>
		                      <td class="px-4 py-3 text-sm">
			                      <a href="${path}//=${question_no}">
			                      	${q. }
			                      </a>
		                      </td>
		                      <td class="px-4 py-3 text-sm">
		                      ${question_state == "Y" ? "답변완료" : "답변대기" }
		                      </td>
		                      <td class="px-4 py-3 text-sm">
		                        <fmt:formatDate value="${question_date}" pattern="yyyy-MM-dd"/>
		                      </td>
		                    </tr>
                   		</c:forEach>
                   </c:if>
                  </tbody>
                </table>
              </div>
              <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                <span class="col-span-1"></span>
                <!-- Pagination -->
                <span class="flex col-span-3 mt-2 sm:mt-auto sm:justify-end">
                  
                  <nav aria-label="Table navigation">
                    ${pageBar }
                  </nav>
                  
                </span>
              </div>
            </div>
          </div>
          <br><br>



</body>
</html>