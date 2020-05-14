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
	<h1>file-upload-test</h1>
	<h1>파일 업로드 폼</h1>
	<h2>단일 파일 업로드</h2>
	<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file">
		<input type="submit" value="업로드">
	</form>

	<h2>다중 파일 업로드</h2>
	<form action="upload2" method="post" enctype="multipart/form-data">
		<input type="file" name="files" multiple>
		<input type="submit" value="업로드">
	</form>

	<h1>Ajax를 이용한 파일 업로드</h1>
	<div class="file-drop"></div>
	
	<div class="upload-list"></div>
	<h1>사진주소</h1>
	<div id = "file-path-area"></div><br>
	
	<div id = "file-path-area-seperate"></div>

	<img src="display?fileName=/test/s_test_1.jpg"/>

          	    
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
          str += '<div>'
          		+ '<img src="display?fileName='
          	    + data
          	    + '" />'
          	    + data
          	    + '</div>';
          $('.upload-list').html(str);	    
	      getAllgetPath();
        } //end success;
      }); //end ajax

    }); //end file drop
    
    
    function getAllgetPath(){
        $.ajax({
            type: 'get', 
            url : '/homeshare/getpath', 
            data : null,
            processData : false,
            contentType : false,
            
            success: function(data) {
            	console.log(data);
            	var strData = data.split(',');
            	
            	
            	 //홀수만 출력
         		console.log('중간값 이상만 출력하기');
            	 var length = strData.length;
            	 
            	 for ( var i in strData) {
         			 if(i>=length/2){
          	       	  	//document.write( '<p>' + strData[i] + '</p>' );
          	         	console.log(strData[i]);
         			 }
          	       }
            	  	
            	$('#file-path-area').html(data);
            	
            }, //end success
            error : function( fail ) {
				alert('사진은 최대 5개만 가능합니다.');
				console.log('사진은 최대 5개만 가능합니다.');
            } // end fail
            	
            
          }); //end ajax
        }//end get all getPath
    
  });//end document
  </script>  
	
</body>
</html>