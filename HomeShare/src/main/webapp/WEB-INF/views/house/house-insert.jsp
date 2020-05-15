<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.file-drop {
	width: 100%;
	height: 100px;
	border: 1px solid grey;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<form action="/homeshare/house/house-insert-post" method="post">
		<h1>하우스 등록하기</h1>
		<hr>
		<p>1단계 기본 사항 입력</p>
		<input type="hidden" name="houseNo" value="0">
		<input type="hidden" name="replies" value="0">
		<input type="hidden" name="score" value="0">
		<input type="hidden" name="memNo" value="${memberVO.memNo }">
		<p>등록하시려는 숙소의 범위를 입력해 주세요</p>
		<select name="scope" required="required">
			<option value="">집전체</option>
			<option value="개인실">개인실</option>
			<option value="다인실">다인실</option>
		</select>
		<p>등록하려는 숙소의 유형을 입력해 주세요</p>
		<select name="type" required="required">
			<option value="">유형선택</option>
			<option value="아파트">아파트</option>
			<option value="주택">주택</option>
			<option value="별채">별채</option>
			<option value="독특한숙소">독특한숙소</option>
		</select> <br> <br>
		<p>최대 숙박 가능인원</p>
		<br>
		<input type="text" name="maxCapacity"required="required">
		<br>
		<p>사용할 수 있는 침실은 몇개인가요?</p>
		<br>
		<input type="text" name="badRoom" required="required">
		<br>
		<p>사용할 수 있는 침대는 몇개인가요?</p>
		<br>
		<input type="text" name="bed" required="required">
		<br>
		<p>사용할 수 있는 욕실은 몇개인가요?</p>
		<br>
		<input type="text" name="bathroom" required="required">
		<br>
		<hr>
		<p>숙소의 위치를 알려주세요</p>
		<input type="text" name="location" required="required">
		<br> //TODO : 네이버 api를 이용하여 지도 적용시키기
		<hr>
		<p>어떤 편의시설을 제공하나요?</p>
		<input type="checkbox" name="utilities" value="필수품목" required="required">
		필수품목<br>수건, 침대 시트, 비누, 화장지, 베개<br>
		<input type="checkbox" name="utilities" value="internet">
		무선인터넷<br>
		<input type="checkbox" name="utilities" value="tv">
		tv<br>
		<input type="checkbox" name="utilities" value="internet">
		무선인터넷<br>
		<input type="checkbox" name="utilities" value="heating">
		난방<br>
		<input type="checkbox" name="utilities" value="airconditioning">
		에어콘<br>
		<input type="checkbox" name="utilities" value="shampoo">
		샴푸<br>
		<input type="checkbox" name="utilities" value="Hair dryer">
		헤어 드라이어<br>
		<hr>
		<br>
		<p>게스트가 어떤 시설을 이용할 수 있나요?</p>
		<input type="checkbox" name="spaces" value="주방">
		주방<br>
		<input type="checkbox" name="spaces" value="세탁기">
		세탁기<br>
		<input type="checkbox" name="spaces" value="건조기">
		건조기<br>
		<input type="checkbox" name="spaces" value="주차">
		주차<br>
		<input type="checkbox" name="spaces" value="헬스장">
		헬스장<br>
		<hr>
		<h1>2단계 상세 정보 입력하기</h1>
		
		
		<h1>Ajax를 이용한 파일 업로드</h1>
		<div class="file-drop"></div>
	
		<div class="upload-list"></div>
		<h1>사진주소</h1>
		
		<input type="text" name="image" required="required">
		<br>

		<p>숙소의 제목을 입력해 주세요</p>
		<input type="text" name="title" required="required">
		<p>게스트에게 숙소에 대해 설명해 주세요</p>
		<input type="text" name="info" required="required">
		<br> <br> <br> <br>
		<hr>
		<h1>3단계 게스트를 맞이할 준비를 해주세요</h1>
		<p>게스트가 지켜야 할 규칙들</p>
		어린이(2~12세) 숙박에 적합함
		<input type="checkbox" name="rules" value="어린이(2~12세) 숙박에 적합함">
		<br> 반려동물 동반에 적합함
		<input type="checkbox" name="rules" value="반려동물 동반에 적합함">
		<br>흡연 가능
		<input type="checkbox" name="rules" value="흡연 가능">
		<br>행사나 파티 허용
		<input type="checkbox" name="rules" value="행사나 파티 허용">
		<hr>
		<p>체크인까지 최소한 어느정도 시간이 필요하세요?</p>
		<br>
		<input type="text" name="checkinInterval" required="required">
		<hr>
		체크인 가능 시간을 선택해 주세요
		<input type="text" name="checkinTime"required="required">
		<input type="text" name="checkoutTime"required="required">
		<hr>
		<p>게스트가 얼마나 숙박할 수 있나요?</p>
		<input type="text" name="stayNight"required="required">
		박<br>
		<input type="text" name="stayDay"required="required">
		일<br>
		<hr>
		<p>예약 가능한 시간 정하기</p>
		최소
		<input type="date" name="bookableDateBegin" min="sysdate"required="required">
		<br> 최대
		<input type="date" name="bookableDateEnd" min="sysdate"required="required">
		<br>
		<hr>
		<p>숙소요금 설정하기</p>
		<input type="text" name="price"required="required">
		<br>
		<input type="submit" value="등록하기">
		<br>

	</form>
<script type="text/javascript">
  $(document).ready(function(){
    // 파일을 끌어다 놓을 때(drag & drop)
    // 브라우저가 파일을 자동으로 열어주는 기능을 막음
    $('.file-drop').on('dragenter dragover', function(event){
      event.preventDefault();
    });
    
    $('.file-drop').on('drop', function(event){
      // drop 이벤트의 기본 동작을 막음
      event.preventDefault();
      
      console.log('drop 테스트');
      
      // Ajax를 이용해서 서버로 파일을 업로드
      // multipart/form-data 타입으로 파일을 업로드하는 객체
      var formData = new FormData();
      
      // drop한 파일에 대한 정보
      var files = event.originalEvent.dataTransfer.files;
      var i = 0;
      for (i = 0; i < files.length; i++) {
        console.log(files[i]);
        // 서버로 보낼 form-data 작성
        formData.append("files", files[i]);
      }
      
      $.ajax({
        type: 'post', 
        url : '/homeshare/upload-ajax', 
        data : formData,
        processData : false,
        contentType : false,
        /*
        	form의 enctype 속성을 
        	기본값인 "application/x-www-form-urlencoded"을 사용하지 않고
        	"multipart/form-data"를 사용하기 위해 (contentType : false)를 지정
        */
        success: function(data) {
          alert(data);
          var str = $('.upload-list').html();
          str += '<div class ="img_items">'
          		+ '<img src="/homeshare/display?fileName='
          	    + data
          	    + '" />'
          	    + data
          	    + '</div>';
          $('.upload-list').html(str);
  			
          var sum = '';
          console.log('img items : ' + $('.img_items').html());
          $('.img_items').each(function(){
              sum += $(this).text() +','; 
              console.log('sum : ' + sum);
          });
           console.log('sum : ' + sum);
           
           $('input[name=image]').val(sum);
           console.log('name image :'+$('input[name=image]').val());
          

        } //end success;
      }); //end ajax
    }); //end file drop
    
    

    
  });//end document
  </script>  
</body>
</html>