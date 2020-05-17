<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
header {
	width: 100%;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 80px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
</head>
<body>

	<br>
	<c:if test="${not empty mem_id }">
	${memId }님, 환영합니다. <br>
		<button id="btn_logout" type="button" method="post"></button>
	</c:if>
	<!-- 헤더바 -->
	<header>

		<div id="main-button">
			<a href="/homeshare/">go main</a>
		</div>
		<div id="sign-host">
			<a href="/homeshare/member/became-a-host">호스트 되기</a>
		</div>

		<div id="sign-up">
			<a href="/homeshare/member/sign-up/">sign-up</a>
		</div>



		<c:if test="${empty memId }">
		<!-- 모달버튼 -->
			<div id="login">			
				<input type="button" id="login_button" value="로그인 모달" />
			</div>
		<!-- end 모달버튼 -->
			<!-- 모달영역 -->
			<div id="login_dialog">
				<form id ="loginForm" action="/homeshare/member/login-post" method="post">
					<input type="text" name="memId" id="memId" placeholder="USER ID"
						required="required">
					<br>
					<input type="password" id="password" name="password"
						placeholder="PASSWORD" required="required">
					<br>
					<input type="hidden" name="targetUrl" value="${targetUrl }">
					<c:if test="${login_fail eq 'login_fail'}">
						<p>아이디 또는 비밀번호가 일치하지 않습니다.</p>
						<br>
						<p>아이디가 생각이 안나세요?</p>
						<a href="find-id">
							<input type="button" value="아이디 찾기">
						</a>
					</c:if>
				</form>
			</div>
			<!-- end modal영역 -->
			
		</c:if>
		<c:if test="${not empty memId }">
			<div id="myPageToggle">${memId }</div>
			<div id="mypage">
				<a href="/homeshare/member/account">
					<input type="button" value="계정">
				</a>
				<a href="/homeshare/member/alerm">
					<input type="button" value="알람설정">
				</a>
				<a href="/homeshare/member/logout">
					<input type="button" value="로그아웃">
				</a>
				<c:if test="${not empty memberVO.houseNo }">
					<a href="/homeshare/host/hosting-list">
						<input type="button" value="숙소관리하기">
					</a>
				</c:if>
			</div>

		</c:if>
	</header>

	<%@ include file="section.jspf"%>
	<div style="border: 5px solid grey;">
		테스트영역
		<hr>
		<div>
			<a href="house/house-list">숙소 테스트</a>
		</div>
		<br>
		<div>
			<a href="/homeshare/file-upload-test">파일 업로드 테스트</a>
		</div>
		<br>
		<div>
			<a href="/homeshare/house/house-insert">등록테스트</a>
		</div>
		<br>
		<div>
			<a href="/homeshare/test/scroll-test">스크롤테스트</a>
		</div>
		<br>
		<div>
			<a href="/homeshare/mail">메일테스트</a>
		</div>
		<br>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login_button").click(function() {
			$("#login_dialog").dialog("open");
		});

		//모달영역

		$("#login_dialog").dialog({
			//이벤트 발생했을때 보여주려면 autoOpen : false로 지정해줘야 한다.
			autoOpen : false,
			//레이어팝업 넓이 
			width : 400,
			//뒷배경을 disable 시키고싶다면 true 
			modal : true,
			//버튼종류 
			 buttons : [ { //버튼텍스트 
				text : "로그인", //클릭이벤트발생시 동작 
				click : function() {
					memId = $('#memId').val();
					password = $('#password').val();
					 var frm = $('#loginForm');
				  	    frm.attr('action', '/homeshare/member/login-post');
				  	    frm.attr('method', 'post');
				  	    frm.find('[name="memId"]').val(memId);
				  	    frm.find('[name="password"]').val(password);
				  	    frm.submit(); 
					$(this).dialog("close");
				}
			}, { //버튼텍스트 
				text : "닫기", //클릭이벤트발생시 동작 
				click : function() {
					$(this).dialog("close");
				}
			} ] 
		}); //end modal

	});//end document
</script>
</html>