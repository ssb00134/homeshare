<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../cdn.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String inputYn = request.getParameter("inputYn");
String roadFullAddr = request.getParameter("roadFullAddr");
String sggNm  = request.getParameter("sggNm");
String entX = request.getParameter("entX");
String entY = request.getParameter("entY");
%>
</head>
<script language="javascript">
$(document).ready(function() {
		var url = location.href;
		var confmKey = "devU01TX0FVVEgyMDIwMDYwMTEwMDY1OTEwOTgxNDc=";
		var resultType = "4"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
		var inputYn= "<%=inputYn%>";
		if(inputYn != "Y"){
			document.form.confmKey.value = confmKey;
			document.form.returnUrl.value = url;
			document.form.resultType.value = resultType;
			document.form.action="http://www.juso.go.kr/addrlink/addrCoordUrl.do"; //인터넷망
			document.form.submit();
		}else{
			var roadFullAddr = "<%=roadFullAddr%>";
			var entX = "<%=entX%>";
			var entY = "<%=entY%>";
			var sggNm  = "<%=sggNm%>";
			console.log('roadFullAddr :  ' + roadFullAddr);
			$("#roadFullAddr",opener.document).val(roadFullAddr); 
			$("#entX",opener.document).val(entX); 
			$("#entY",opener.document).val(entY); 
			$("#local",opener.document).val(sggNm);
			console.log('sggNm :  ' + sggNm);
			window.close();
			}
	});//end document

</script>


<body >
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="" />
		<input type="hidden" id="returnUrl" name="returnUrl" value="" />
		<input type="hidden" id="resultType" name="resultType" value="" />

	</form>
</body>
</html>