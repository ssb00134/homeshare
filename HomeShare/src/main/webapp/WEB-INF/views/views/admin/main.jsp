<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>


<link href="/homeshare/resources/css/bootstrap.css" rel="stylesheet">


<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<title>Sssoon Page</title>

<link href="/homeshare/resources/css/bootstrap.css" rel="stylesheet">
<link href="/homeshare/resources/css/coming-sssoon.css" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>





<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.12.4.min.js"></script>









<!-- datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- end datepicker -->







<script src="/homeshare/resources/js/jquery-1.10.2.js"
	type="text/javascript"></script>

<script src="/homeshare/resources/js/bootstrap.min.js"
	type="text/javascript"></script>






<!-- dashboardcss -->
<link href="/homeshare/resources/css/dashboard.css" rel="stylesheet">
<link href="/homeshare/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>


<%@ include file="../navbar.jspf"%>

	<div class="main" id="1" style="background-color: rgba(0, 0, 0, .6)">


	
		<!--    Change the image source '//homeshare/resources/images/default.jpg' with your favourite image.     -->



		<!--   You can change the black color for the filter with those colors: blue, green, red, orange       -->
		
		<%@ include file="sidebar.jspf"%>

		<div class="container ">
			<h1 class="logo">관리자 페이지</h1>
			<!--  H1 can have 2 designs: "logo" and "logo cursive"           -->

			<div class="content admincontent">
				<h4 class="motto">Find the best Bootstrap 3 freebies and themes
					on the web.</h4>
				<div class="subscribe">
					<h5 class="info-text">어디로 여행가세요?</h5>
					
					
					
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="container"></div>
		</div>
	</div>
	<!-- end main -->







	<script type="text/javascript">
		$(document).ready(function() {
			$('#crmsidebar').click(function() {
				console.log('crmsidebar click');
				$(".admincontent").load("/homeshare/admin/crm");
			}); //end crmsidebar clikc

			$('#houseManagement').click(function() {
				$(".admincontent").load("/homeshare/admin/housemanagement");
			}); //end crmsidebar clikc
			$('#bookManageMent').click(function() {
				$(".admincontent").load("/homeshare/admin/bookmanagement");
			}); //end crmsidebar clikc
			$('#reportManageMent').click(function() {
				$(".admincontent").load("/homeshare/admin/reportmanagement");
			}); //end crmsidebar clikc

		});//end script
	</script>
</body>
</html>