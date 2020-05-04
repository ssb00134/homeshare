<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<h1>하우스 등록하기</h1>
		<hr>
		<p>1단계 기본 사항 입력</p>

		<select name="type">
			<option value="">직업선택</option>
			<option value="아파트">아파트</option>
			<option value="주택">주택</option>
			<option value="별채">별채</option>
			<option value="독특한숙소">독특한숙소</option>
		</select>
		<hr>
		<br> <br>
		<p>최대 숙박 가능인원</p><br>
		<input type="text" name="MaxCapacity"><br>
		<p>사용할 수 있는 침실은 몇개인가요?</p><br>
		<input type="text" name="badRoom"><br>
		<p>사용할 수 있는 욕실은 몇개인가요?</p><br>
		<input type="text" name="bathroom"><br>
		<hr>
		<p>숙소의 위치를 알려주세요</p>
		<input type="text" name="location"><br>
		//TODO : 네이버 api를 이용하여 지도 적용시키기
		<hr>
		
	</form>
</body>
</html>