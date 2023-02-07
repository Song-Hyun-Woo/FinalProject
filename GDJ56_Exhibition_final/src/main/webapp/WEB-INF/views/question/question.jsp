<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="path" value="${pageContext.request.contextPath }"/>       

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<div id="light3" style="display: block; position: fixed; top: 10%; left: 32.5%; width: 35%; min-width: 720px; height: 692px; background-color: white; z-index: 9999999; overflow: auto hidden; border-radius: 18px; box-shadow: rgba(0, 0, 0, 0.05) 5px 5px 5px 5px, rgba(0, 0, 0, 0.1) 2px 2px 5px;" class="la_pop">
	<div onclick="document.getElementById('light3').style.display='none';document.getElementById('fade3').style.display='none'" style="height:20px; padding-top:21px; padding-right:20px; cursor:pointer; text-align:right;">
<img src="/img/index_popX@3x.png" style="width:16px; height:16px;">
</div>
<div style="width:700px; margin:auto;">
<div class="pop_title" style="width:100%; font-size:35px; font-weight:600; line-height:2px; letter-spacing:-0.6px; padding:15px 0px; text-align:center; margin-top:20px; margin-bottom:20px; border:none; margin-top:13px; font-size:26px;">파이널프로젝트에 문의하기</div>

<input type="hidden" id="inq_type" value="">
<div style="padding: 0px 39px 15px 39px; text-align:center;" class="lpop">
	<div class="checkbox">
		<label>
		<input type="radio" name="mode" value="qna" checked> 1대1 문의
				&nbsp;&nbsp;
		<input type="radio" name="mode" value="ex_qna"> 전시 문의
		</label>
	  </div>	
<div class="pinput_left">${loginMember.name }님<font color="red">*</font></div>
<div class="pinput_right"><input type="text" name="name" id="name" placeholder="성함"></div>
<div style="clear:both;"></div>
<div class="pinput_left">문의내용<font color="red	">*</font></div>
<div class="pinput_right"><input type="text" name="question_title" id="question_title" placeholder="문의제목"></div>
<div style="clear:both;"></div>

<div class="pinput_left">문의 내용<font color="red">*</font></div>
<div class="pinput_right">
<textarea rows="6" name="content" id="m_content" style="margin-top:10px; border:none; border-bottom:1px solid #b4b4b4; width:500px; outline:0; margin-top:10px; padding:5px;" placeholder="문의하실 내용을 입력해 주세요"></textarea>
</div>
<div style="clear:both; height:12px;"></div>
						<div style="height:195px; border-bottom:1px solid #b4b4b4">
							<div style="font-size:18px; font-weight:600; text-align:left;">
개인정보 수집 및 이용안내								</div>
<div class="gain">
	파이널프로젝트는 문의사항 답변을 희망하는 회원을 대상으로 아래와 같이 개인정보를 수집하고 있습니다.<br>
	1. 개인정보의 수집 및 이용목적:문의 신청에 따른 본인확인 및 원활한 의사소통 경로 확보<br>
	2. 동의 거부권리 안내 추가 : 위와 같은 개인정보 수입동의를 거부할 수있습니다.<br>
	다만 동의를 거부하는 경우 문의 신청이 제한 됩니다.<br>
	3. 파이널프로젝트는 문의사항 처리 종료 시점으로부터 1년간 보관 후 파기합니다.<br>								
</div>
<div style="clear:both;"></div>
<div class="gain_chk" style="padding-top:10px;">
	<input type="checkbox" name="" value="stay_log" id="cb1"><label for="cb1"></label>&nbsp;<span style="display:inline-block; cursor:pointer;"><b onclick="request_chk(1)">개인정보 수집 및 이용에 대해서 동의합니다. *</b></span>
</div>
</div>
</div>
<div style="text-align:center; margin-top:35px;">
<input type="button" value="확인" style="background-color: black; border: none; color: #fff; padding: 12px 0px; text-align: center; width:166px; border-radius:10px; font-size:18px; cursor:pointer;" onclick="contacus();">
</div>
</div>

</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>