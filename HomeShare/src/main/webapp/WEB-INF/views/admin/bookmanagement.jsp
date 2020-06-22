<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>예약 검색하기</h4>

	<form  id="multySearchForm"
		target="iframe1" action="/homeshare/admin/bookmanagement_result" >
		
		
		<div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <label for="hostId">호스트아이디</label>
							<input type="text" id="hostId" name="hostId">
                        </div>
                         <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <label for="hostId">게스트아이디</label>
							<input type="text" id="guestId" name="guestId">
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
			src="/homeshare/admin/bookmanagement_result"></iframe>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#iframe1").hide();
			
			$('#hostId').on('click blur keyup', function(){
				$('#guestId').val('');
			});
			$('#guestId').on('click blur keyup', function(){
				$('#hostId').val('');
			});
			

			$('#btnAdminBooksearch').click(function() {
				$('#iframe1').load(function() {
					console.log('iframe 로드 ');
					$('#iframe1').show();
				});//end load
			}); //end click

		}); //end document;
	</script>
</body>
</html>