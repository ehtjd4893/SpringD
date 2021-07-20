<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="resources/css/insertBoard.css"> 
	<title>Homepage</title>
	<script>
	
		function loadFile(input, span_file, div_img) {
		
			$(div_img).empty();
			$(span_file).empty();	// 초기화
			
		    var file = input.files[0];	//선택된 파일리스트 가져오기
		    //미리 만들어 놓은 div에 text(파일 이름) 추가
		    
		
			if(file != null){
				var name = file.name;
				
				$(span_file).text(name);
				$('<img>')	
				.attr('src', URL.createObjectURL(file))		//이미지 source 가져오기
				.css('width', '200px')
				.css('height', '120px')
				.css('objectFit', 'contain')
				.appendTo(div_img);
				//이미지를 showImgs div에 추가
			}
		  	//새로운 이미지 div 추가
		};
	</script>

<body>
	<h1> 글 입력</h1>
	
	<form id="f" action="insertBoard.do" method="POST" enctype="multipart/form-data">
		<c:if test="${loginUser eq null && loginAdmin ne null}">
			<input type="hidden" name="m_id" value="${loginAdmin.MId}"><br>
		</c:if>
		<c:if test="${loginUser ne null && loginAdmin eq null}">
			<input type="hidden" name="m_id" value="${loginUser.MId}"><br>
		</c:if>
		
		
		<h3>제목</h3>
		<input type="text" name="bTitle" placeholder="제목을 입력하세요"><br>
		<h3>내용</h3>
		<textarea rows="20" cols="100" name="bContent" placeholder="내용을 입력하세요."></textarea>
		<div class="button">
			<div class="fileAdd">
	       		<label for="chooseFile1">  
		       		👉 Img File 1 👈 
		       		<input type="file" id="chooseFile1" name="chooseFile1" accept="image/*" onchange="loadFile(this,'#fileName1', '#showImgs1')">
	       		</label>
	   			<span id="fileName1"></span>
	   			<div id="showImgs1"></div>
   			</div>
       	
       		<div class="fileAdd">
	       		<label for="chooseFile2">  
		       		👉 Img File 2 👈 
		       		<input type="file" id="chooseFile2" name="chooseFile2" accept="image/*" onchange="loadFile(this,'#fileName2', '#showImgs2')">
	       		</label>
	   			<span id="fileName2"></span>
	   			<div id="showImgs2"></div>
   			</div>
   			
   			<div class="fileAdd">
	       		<label for="chooseFile3">  
		       		👉 Img File 3👈 
		       		<input type="file" id="chooseFile3" name="chooseFile3" accept="image/*" onchange="loadFile(this,'#fileName3', '#showImgs3')">
	       		</label>
	   			<span id="fileName3"></span>
	   			<div id="showImgs3"></div>
   			</div>
    	</div>
		<button>작성 완료</button>
	</form>
	
</body>
</html>