<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: - 마이페이지 :::</title>
</head>
<body>
<!-- 회원 비밀번호 확인 -->
      <div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="loginModalLabel"><b>회원정보 수정</b></h3>
						<h5 class="modal-title" id="loginModalLabel">회원 정보 수정을 위해 비밀번호를 다시 입력해주세요.</h5>
					</div>
					<form action="" method="post">
						<div class="modal-body">
							<input type="password" name="password" class="form-control"
								placeholder="비밀번호 입력" required>
						</div>
						<div class="modal-footer">
							<button id="btn-Yes" type="submit" class="btn btn-lg btn-dark btn-block"><i class="fa fa-cog fa-spin"></i>확인</button>
							<button id="btn-No" type="button" class="btn btn-lg btn-dark btn-block" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>

</body>
</html>