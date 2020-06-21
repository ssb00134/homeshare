<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>File Upload</title>
</head>
<body>
	<h1>파일 업로드 폼</h1>
		<h2>다중 파일 업로드</h2>
		<form action="upload" id="uploadForm" method="post"
			enctype="multipart/form-data">
			<input type="file" name="files" multiple>
			<input type="submit" id="uploadBtn" value="업로드">
		</form>
	<form action="upload2">
	</form>
	<script type="text/javascript">
  	$(document).ready(function() {
  		var uploadForm = $('#uploadForm');
  		
  	});
  </script>
</body>
</html>









