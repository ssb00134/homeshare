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
	
	<%@ include file="header.jspf"%>

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
		<div>
			<a href="/homeshare/jusoPopup"><input type="text">주소테스트</a>
		</div>
		<br>
	</div>
	<%@ include file="footer.jspf"%>
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