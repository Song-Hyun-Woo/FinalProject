<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<body>
	<div>
		<section id="member-container" class="container">
			<p style="text-align:end;">총 ${totalContents }명의 회원이 있습니다.</p>
			<h2 style="text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MONOCLEE 회원관리</h2>
		</section>
	</div>
<div>
	<main>
	 <div class="headcontainer border-top" style="padding-top: 20px"></div>
    <section class="zzim-form">
        <div>
            <div class="sidebar">
                <h4>
                    <strong>관리자페이지</strong>
                </h4>
                <ul>
                    <li><a href="${path }/admin/memberList">회원관리</a></li>
                    <li><a href="${path }/question/questionList">질의응답</a></li>
                </ul>
            </div>
        </div>
</main>	
	<div style="float:left;" id="tbl_memberDiv">	
		<table id="tbl_member" class="table table-striped table-hover">	
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일</th>
				
			</tr>
			<c:if test="${not empty members }">
            	<c:forEach var="m" items="${members }">
            		<tr>           			
            			<td><c:out value="${m.memberId }"/></td>
            			<td><c:out value="${m.memberName }"/></td>
						<td><c:out value="${m.gender }"/></td> 
            			<td><c:out value="${m.birth }"/></td> 
            			<td><c:out value="${m.email }"/></td> 
            			<td><c:out value="${m.phone }"/></td> 
            			<td><c:out value="${m.address }"/></td> 
            			<td><c:out value="${m.enrollDate }"/></td>            			        			
            		</tr>
            	</c:forEach>
            </c:if>
			<c:if test="${empty members }">
            	<tr>
            		<td colspan="6">조회결과없음</td>
            	</tr>
            </c:if>
        </table> 
        <div id="pageBar">
        	${pageBar }
        </div>
	</div>
</div>        
<div id="search">
	<div>
		<form name="search-form" autocomplete="off" style="margin-left:800px;margin-top:380px;position: relative;">
			<select name="type" id="type_">
				<option selected value="">검색 내용 선택</option>
				<option value="member_id">아이디</option>
				<option value="member_name">이름</option>
			</select>
			<input type="text" name="keyword" id="keyword_" ></input>
			<input type="button" onclick="getSearchList()" class="btn btn-outline-primary mr-2" value="검색"/>
		</form>
</div>
	</div>     

<script>
function getSearchList(){
	/* $.ajax({
		type: 'GET',
		url : "/getSearchList",
		data : $("form[name=search-form]").serialize(),
		success : function(result){
			console.log(result);
			//테이블 초기화
			$('#tbl_member > tbody').empty();
			$('#pageBar').empty();
			$('#tbl_memberDiv').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str += "<td>"+item.memberId+"</td>";
					str+="<td>"+item.memberName+"</td>";
					str+="<td>"+item.birthday+"</td>"
					str+="<td>"+item.email+"</td>"
					str+="<td>"+item.phone+"</td>"
					str+="<td>"+item.address+"</td>"
					str+="<td>"+item.totalMileage+"</td>"
					//str+="<td><a href = '/admin/memberList?memberId=" + item.memberId + "'>" + item.memberName + "</a></td>";
					str+="<td>"+item.enrollDate+"</td>";
					str+="<td>"+item.secessionReason+"</td>";
					str+="</tr>"
					$('#tbl_member').append(str);   
					})
					
        		$('#pageBar').append("${result.pageBar2}");
					$('#tbl_memberDiv').append(result);
			}
		}
	}) */	
	location.assign("${path}/getSearchList?type="+$("#type_").val()+"&keyword="+$("#keyword_").val());
}

</script>	

</body>
<style>
	  	body {
		  min-height: 100vh;
		  min-height: -webkit-fill-available;
		}
		
		html {
		  height: -webkit-fill-available;
		}
		
		main {
		float:left;
		margin-left:50px;
		margin-right:10%;
		  display: flex;
		  flex-wrap: nowrap;
		  height: 100vh;
		  height: -webkit-fill-available;
		  max-height: 100vh;
		  overflow-x: auto;
		  overflow-y: hidden;
		}
		
		.b-example-divider {
		  flex-shrink: 0;
		  width: 1.5rem;
		  height: 100vh;
		  background-color: rgba(0, 0, 0, .1);
		  border: solid rgba(0, 0, 0, .15);
		  border-width: 1px 0;
		  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
		}
		
		.bi {
		  vertical-align: -.125em;
		  pointer-events: none;
		  fill: currentColor;
		}
		
		.dropdown-toggle { outline: 0; }
		
		.nav-flush .nav-link {
		  border-radius: 0;
		}
		
		.btn-toggle {
		  display: inline-flex;
		  align-items: center;
		  padding: .25rem .5rem;
		  font-weight: 600;
		  color: rgba(0, 0, 0, .65);
		  background-color: transparent;
		  border: 0;
		}
		.btn-toggle:hover,
		.btn-toggle:focus {
		  color: rgba(0, 0, 0, .85);
		  background-color: #d2f4ea;
		}
		
		.btn-toggle::before {
		  width: 1.25em;
		  line-height: 0;
		  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
		  transition: transform .35s ease;
		  transform-origin: .5em 50%;
		}
		
		.btn-toggle[aria-expanded="true"] {
		  color: rgba(0, 0, 0, .85);
		}
		.btn-toggle[aria-expanded="true"]::before {
		  transform: rotate(90deg);
		}
		
		.btn-toggle-nav a {
		  display: inline-flex;
		  padding: .1875rem .5rem;
		  margin-top: .125rem;
		  margin-left: 1.25rem;
		  text-decoration: none;
		}
		.btn-toggle-nav a:hover,
		.btn-toggle-nav a:focus {
		  background-color: #d2f4ea;
		}
		
		.scrollarea {
		  overflow-y: auto;
		}
		
		.fw-semibold { font-weight: 600; }
		.lh-tight { line-height: 1.25; }
		
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>