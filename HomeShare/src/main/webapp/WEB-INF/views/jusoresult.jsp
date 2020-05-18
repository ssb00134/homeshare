<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="http://127.0.0.1:8983/app/juso_support_center/js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
	/**
	 * 주소 검색 API호출
	 */
	function fn_getAddress(page, count, type) {

		// 조회조건
		var keyword = $("#keyword").val();
		var currentPage = (page ? page : "1");
		var countPerPage = (count ? count : "10");
		var resultType = "xml";

		// 주소검색
		$.ajax({
			url : "http://127.0.0.1:8983/app/search/addrSearchApi.do",
			type : "post",
			data : {
				"keyword" : keyword,
				"currentPage" : currentPage,
				"countPerPage" : countPerPage,
				"resultType" : resultType
			},
			dataType : "xml",
			crossDomain : true,
			success : function(xmlStr) {

				$("#list").html("");

				if (xmlStr != null) {

					var xmlData;
					if (navigator.appName.indexOf("Microsoft") > -1) {
						xmlData = new ActiveXObject("Microsoft.XMLDOM");
						xmlData.loadXML($(xmlStr).find("results"));
					} else {
						xmlData = $(xmlStr).find("results");
					}

					var errCode = $(xmlData).find("errorCode").text();
					var errDesc = $(xmlData).find("errorMessage").text();
					if (errCode != "0") {
						alert(errCode + ":" + errDesc);
					} else {
						fn_makeListXml(xmlData);
					}
				}
			},
			error : function(xhr, status, error) {
				alert("정상적으로 조회되지 않았습니다.");
			}
		});
	}

	/**
	 * 검색어 엔터키 처리
	 */
	function fn_enterSearch() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {
			event.keyCode = 0;
			fn_getAddress();
		}
	}
	/** 
	 * 결과 처리
	 */
	function fn_makeListXml(xmlStr) {

		var htmlStr = "";
		if ($(xmlStr).find("totalCount").text() == "0") {
			htmlStr += "<table><tr><td>검색 결과가 없습니다</td></tr></table>"
			$("#list").html(htmlStr);
			return;
		}

		htmlStr += "<table>";
		htmlStr += "<tr>";
		htmlStr += "<td style='border-bottom: 1px solid #000; width:80px; text-align:center;'>순번</td>";
		htmlStr += "<td style='border-bottom: 1px solid #000; text-align:center;' colspan='2'>주소</td>";
		htmlStr += "</tr>";
		$(xmlStr)
				.find("juso")
				.each(
						function(index) {
							htmlStr += "<tr>";
							htmlStr += "<td style='border-bottom: 1px solid #000; width:80px; text-align:center;'>"
									+ (index + 1) + "</td>";
							htmlStr += "<td style='border-bottom: 1px solid #000;'>도로명<br>영문<br>지번<br>우편번호</td>";
							htmlStr += "<td style='border-bottom: 1px solid #000;'>";
							htmlStr += $(this).find('roadAddr').text() + "<br>";
							htmlStr += $(this).find('engAddr').text() + "<br>";
							htmlStr += $(this).find('jibunAddr').text()
									+ "<br>";
							htmlStr += $(this).find('zipNo').text() + "<br>";
							htmlStr += "</td>";
							htmlStr += "</tr>";
						});

		htmlStr += "</table>";

		$("#list").html(htmlStr);
	}
</script>

</head>
<body>
	roadFullAddr${roadFullAddr }
	<input type="text" id="keyword" name="keyword" value=""
		onkeydown="fn_enterSearch();" />
	<input type="button" value="주소조회" onClick="javascript:fn_getAddress()">
	<p>
	<div id="list"></div>
	<!-- 검색 결과 리스트 출력 영역 -->

</body>
</html>
