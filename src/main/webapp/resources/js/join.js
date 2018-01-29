$(function() {
	/* 아이디 유효성 */
	$("#username").blur(function() {
		var username = $(this).val();
		var regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		$.ajax({
			type : 'POST',
			url : "../ajax/idCheck",
			data : {
				username : username
			},
			success : function(data) {
				if(regex.test(username) == false)
					swal("이메일 형식이 맞지 않습니다", "다시 입력하세요", "error");
				else if (data == 0) 
					swal("사용 가능한 아이디입니다", "", "success");
				else
					swal("이미 사용 중인 아이디입니다", "", "warning");
			}
		});
	});

	/* 비밀번호 유효성 */
	$("#password").change(function() {
		var val = $(this).val();
		var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}/;
		if (regex.test(val) == false) {
			swal("비밀번호는 8~16자리이어야 합니다.", "공백 없이 영문과 숫자, 특수문자를 반드시 포함하여야 합니다.", "warning");
			$(this).val("");
		}
	});
	
	/* 연락처 유효성 검사 */
	$("#phone").change(function() {
		var val = $(this).val();
		var regex1 = /^[0-9]+$/;
		var regex2 = /^\d{2,3}\d{3,4}\d{4}$/;
		var regex3 =  /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		if (regex1.test(val) == false) {
			swal("숫자만 입력 가능합니다");
			$(this).val("");
		} 
		else if (regex2.test(val) == false || regex3.test(val) == false) {
			swal("번호가 올바르지 않습니다");
			$(this).val("");
		}
	});

	/* 공란 제출 금지 */
	$("#form").submit(function() {
		if ($("#username").val() == "") {
			swal("이메일 주소를 입력하세요", "", "warning");
			$(this).focus();
			return false;
		} else if ($("#password").val() == "") {
			swal("비밀번호를 입력하세요", "", "warning");
			$("#password").focus();
			return false;
		} else if ($("#password_confirm").val() == "") {
			swal("비밀번호를 확인하세요", "", "warning");
			$("#password_confirm").focus();
			return false;
		} else if ($("#password").val() != $("#password_confirm").val()) {
			swal("비밀번호가 일치하지 않습니다.", "", "error");
			$("#password").focus();
			return false;
		} else if ($("#nickname").val() == "") {
			swal("닉네임을 입력하세요", "", "warning");
			$(this).focus();
			return false;
		} else if ($("#phone").val() == "") {
			swal("연락처를 입력하세요", "", "warning");
			$(this).focus();
			return false;
		} else if ($("#agree").is(":checked") == false) {
			swal("이용약관에 동의해주세요", "", "warning");
			return false;
		}
	});
});

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
			swal("이미지 파일만 가능합니다");
			return;
		}

		sel_file = f;

		var reader = new FileReader();
		reader.onload = function(e) {
			$("#img").attr("src", e.target.result);
			$("#img").show();
		}
		reader.readAsDataURL(f);
	});
}