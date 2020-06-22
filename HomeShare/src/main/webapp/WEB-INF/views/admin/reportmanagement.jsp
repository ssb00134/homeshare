<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>신고내역 관리하기</h1>
	1. 숙소별 신고내역 조회하기 
	
	
	<form  id="multySearchForm"
		target="iframe1" action="/homeshare/admin/reportmanagement_result" >
		
		
		<div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <label for="hostId">호스트아이디</label>
							<input type="text" id="reportHostId" name="reportHostId">
                        </div>
                        
                         
                       
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <button type="submit" id="btnAdminBooksearch" class="btn btn-danger wrn-btn">Search</button>
                        </div>
                    </div>
                </div>
            </div>
	</form>
	
	
	<div class="embed-responsive embed-responsive-16by9">
		<iframe class="embed-responsive-item" name="iframe1" id="iframe1"
			src="/homeshare/admin/reportmanagement_result"></iframe>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#readReportAll').click(function(){
				//로딩시 iframe을 숨긴다.
				$("#iframe1").hide(); // display 속성을 none 으로 바꾼다.
				
				
				/* $('#iframe1').load(function() {
					console.log('iframe 로드 ');
					$('#iframe1').show();
				}); */
			});//end click
		});//end document
	</script>
</body>
</html>
