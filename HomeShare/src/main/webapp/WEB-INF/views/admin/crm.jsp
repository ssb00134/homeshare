<%@ page language="java" contentType="text/html; charset=UTF-8"


	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

	<form id="adminCrmForm" target="iframe1"
		action="/homeshare/admin/crm_result">


		<h4>회원 검색하기</h4>

		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="form-group col-md-1 border">
						<label for="searchbyId">아이디</label>
					</div>
					<div class="form-group col-md-2">
						<input type="text" class="form-control" id="searchbyId" name="memId" value="">
					</div>

					<div class="form-group col-md-1 border">
						<label for="searchbyMemNo">회원번호</label>
					</div>
					<div class="form-group col-md-2">
						<input type="text" class="form-control" id="searchbyMemNo" name="memNo" value="">
					</div>
					
					<div class="col-lg-3 col-md-3 col-sm-12 p-0">
						<button type="submit" id="btnCrmSearch"
							class="btn btn-danger wrn-btn">Search</button>
					</div>
				</div>
			</div>
		</div>
	</form>


	<div class="embed-responsive embed-responsive-16by9">
		<iframe class="embed-responsive-item" name="iframe1" id="iframe1"
			src="/homeshare/admin/crm_result"></iframe>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			//로딩시 iframe을 숨긴다.
			$("#iframe1").hide(); // display 속성을 none 으로 바꾼다.
			
			
			$('#searchbyMemNo').on('click blur keyup', function(){
				$('#searchbyId').val('');
			});//end searchbyMemNo;
			
			$('#searchbyId').on('click blur keyup', function(){
				$('#searchbyMemNo').val('');
			});//end searchbyMemNo;
			
			
			
			
			
			$('#btnCrmSearch').click(function() {
				$('#iframe1').load(function() {
					console.log('iframe 로드 ');
					$('#iframe1').show();
				});//end load

			});//end click */
		});//end script
	</script>
</body>
</html>