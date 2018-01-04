<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
<script src="../resources/js/sidebar.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/header.css">
<style>
	#img {
		width: 200px;
	}
</style>
<script type="text/javascript">
	/* 프로필 이미지 미리보기 */
	var sel_file;

	$(document).ready(function() {
		$("#profile_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		$("#default-img").hide();
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}

			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
	
	/* 유효성 검사 */
	
	
</script>
<body>
	<div id="main" class="wrapper">
		<c:import url="../temp/header.jsp"></c:import>
		<div class="container">
			<div class="col-md-8">			
				<form class="form-horizontal" role="form" action="join" method="post" enctype="multipart/form-data">
					<div class="form-inner">
						<div class="form-group">
				          <div class="col-md-8">
				          	<div class="profile-img">
									<div class="img_wrap">
										<img id="img" />
										<img id="default-img" src="../resources/images/default-profile-img.png">
									</div>
				          		<input type="file" id="profile_img" name="file">
				          	</div>		          	
				          </div>              
				        </div>
				        
				        <div class="form-group">
				          <div class="col-md-8">		          	
				            <label for="username" class="control-label">이메일 주소</label>
				            <input type="email" class="form-control" id="id" name="username" placeholder="이메일 주소를 입력해주세요">		            		            		            
				          </div>              
				        </div>
				        			
				        <div class="form-group">
				          <div class="col-md-4">
				            <label for="password" class="control-label">비밀번호</label>
				            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
				          </div>
				          <div class="col-md-4">
				            <label for="password" class="control-label">비밀번호 확인</label>
				            <input type="password" class="form-control" id="password_confirm" name="password_confirm" placeholder="비밀번호를 확인하세요">
				          </div>
				        </div>
				        
				        <div class="form-group">
				          <div class="col-md-8">		          	
				            <label for="nickname" class="control-label">닉네임</label>
				            <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요">		            		            		            
				          </div>              
				        </div>
				        
				        <div class="form-group">
				          <div class="col-md-8">		          	
				            <label for="phone" class="control-label">연락처</label>
				            <input type="text" class="form-control" id="phone" name="phone" placeholder="연락처를 입력해주세요" maxlength="11">		            		            		            
				          </div>              
				        </div>
				        
				        <div class="form-group">
				          <div class="col-md-8">
				            <label><input type="checkbox">이용약관에 동의합니다.</label>
				          </div>
				        </div>
				        <div class="form-group">
				          <div class="col-md-8">
				            <input type="submit" value="회원가입" class="btn btn-info">
				            <a href="../" class="btn btn-default">취소</a>
				          </div>
				        </div>	
					</div>				    	
			      </form>		      
			</div>
		</div>
	</div>
</body>
</html>