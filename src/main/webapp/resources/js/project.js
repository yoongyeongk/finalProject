$(function() {
	list();
	create();
	$(".page-contents").on("click", ".fa-cog", function() {
		alert("sidebar");
	});
});

function list() {
	$.ajax({
		type : 'POST',
		url : "project/list",
		success : function(data) {
			var html = '';
			$.each(data, function(key, value) {
				html += '<div class="project-box">';

				/* header */
				html += '<div class="project-header">';
				if (value.privacy == "private") {
					html += '<i class="fas fa-lock"></i>';
				} else if (value.privacy == "public") {
					html += '<i class="fas fa-globe"></i>';
				}
				html += '<span>' + value.title + '</span>';
				html += '</div>';
				/* /header */

				/* side */
				html += '<div class="project-side">';
				if (value.star == 0) {
					html += '<i class="far fa-star"></i>';
				} else if (value.star == 1) {
					html += '<i class="fas fa-star"></i>';
				}
				html += '<i class="fas fa-cog"></i>';
				html += '</div>';
				/* /side */

				/* footer */
				html += '<div class="project-footer">';
				html += '<select class="status" name="status">';
				if (value.status == null) {
					html += '<option value="' + value.status
							+ '" selected>상태 없음</option>';
					html += '<option value="계획됨">계획됨</option>';
					html += '<option value="진행중">진행중</option>';
					html += '<option value="완료됨">완료됨</option>';
					html += '<option value="보류">보류</option>';
					html += '<option value="취소">취소</option>';
				} else if (value.status == '계획됨') {
					html += '<option value="">상태 없음</option>';
					html += '<option value="' + value.status
							+ '" selected>계획됨</option>';
					html += '<option value="진행중">진행중</option>';
					html += '<option value="완료됨">완료됨</option>';
					html += '<option value="보류">보류</option>';
					html += '<option value="취소">취소</option>';
				} else if (value.status == '진행중') {
					html += '<option value="">상태 없음</option>';
					html += '<option value="계획됨">계획됨</option>';
					html += '<option value="' + value.status
							+ '" selected>진행중</option>';
					html += '<option value="완료됨">완료됨</option>';
					html += '<option value="보류">보류</option>';
					html += '<option value="취소">취소</option>';
				} else if (value.status == '완료됨') {
					html += '<option value="">상태 없음</option>';
					html += '<option value="계획됨">계획됨</option>';
					html += '<option value="진행중">진행중</option>';
					html += '<option value="' + value.status
							+ '" selected>완료됨</option>';
					html += '<option value="보류">보류</option>';
					html += '<option value="취소">취소</option>';
				} else if (value.status == '보류') {
					html += '<option value="">상태 없음</option>';
					html += '<option value="계획됨">계획됨</option>';
					html += '<option value="진행중">진행중</option>';
					html += '<option value="완료됨">완료됨</option>';
					html += '<option value="' + value.status
							+ '" selected>보류</option>';
					html += '<option value="취소">취소</option>';
				} else if (value.status == '취소') {
					html += '<option value="">상태 없음</option>';
					html += '<option value="계획됨">계획됨</option>';
					html += '<option value="진행중">진행중</option>';
					html += '<option value="완료됨">완료됨</option>';
					html += '<option value="보류">보류</option>';
					html += '<option value="' + value.status
							+ '" selected>취소</option>';
				}
				html += '</select>';
				html += '</div>';
				/* /footer */

				html += '</div>';
			});
			$(".page-contents").html(html);
		}
	});
}

function create() {
	$("#create-project").click(function() {
		var param = $("#frm").serialize();
		$.ajax({
			type : 'post',
			url : "project/create",
			data : param,
			dataType : 'json',
			success : function(data) {
			}
		});
	});
}

function view() {
	$.ajax({
		type : 'get',
		url : "project/view",
		
	});
}

function update() {
	$.ajax({
		type : 'post',
		url : "project/update",
		data : {
			
		},
		dataType : 'json',
		success : function(data) {
			
		}
	});
}
