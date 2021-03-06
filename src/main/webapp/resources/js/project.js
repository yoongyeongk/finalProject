$(function() {
	list();
	create();
	
	$(".page-contents").on("click", "a", function(e) {
		var project_id = $(this).data("id");
		setting(project_id);
		e.preventDefault();
	});
	
	$(".page-contents").on("click", ".project-box", function(event) {
		if($(event.target).is(".project-box")) {
			var project_id = $(this).data("id");
			location.href = "task/main?project_id="+project_id;
		}
	});
	
	$("#update-project").click(function() {
		update();
	});
});

function list() {
	$.ajax({
		type : 'POST',
		url : "project/list",
		success : function(data) {
			var html = '';
			$.each(data, function(key, value) {
				html += '<div class="project-box" data-id='+value.project_id+'>';
				/* header */
				html += '<div class="project-header">';
				if (value.privacy == 'false') {
					html += '<i class="fas fa-lock"></i>';
				} else if (value.privacy == "true") {
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
				html += '<a href="#" data-id="'+value.project_id+'"><i class="fas fa-cog" data-toggle="modal" data-target=".setting"></i></a>';
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

function update() {
	var param = $("#update-frm").serialize();
	$.ajax({
		type : 'post',
		url : "project/update",
		data : param,
		dataType : 'json',
		success : function(data) {
			console.log(data);
		}
	});
}

function setting(project_id) {
	$.ajax({
		type: "GET",
		url: "project/setting",
		data: {
			project_id : project_id
		},
		success: function (data) {
			var start_date = data.start_date;
			var close_date = data.close_date;
			
			if(data.start_date != null)
				start_date = moment(data.start_date).format('YYYY-MM-DD');
			
			if(data.close_date != null)
				close_date = moment(data.close_date).format('YYYY-MM-DD');
			
			if(data.star == 0) 
				$(".setting-header").html('<i class="far fa-star"></i><input class="form-control" name="title" type="text">');
			else 
				$(".setting-header").html('<i class="fas fa-star"></i><input class="form-control" name="title" type="text">');
			
			$(".setting input[name=project_id]").attr("value", data.project_id);
			$(".setting input[name=title]").attr("value", data.title);
			
			if(data.status == '')
				$("#status option:eq(0)").attr("selected", "selected");
			else if(data.status == '계획됨')
				$("#status option:eq(1)").attr("selected", "selected");
			else if(data.status == '진행중')
				$("#status option:eq(2)").attr("selected", "selected");
			else if(data.status == '완료됨')
				$("#status option:eq(3)").attr("selected", "selected");
			else if(data.status == '보류')
				$("#status option:eq(4)").attr("selected", "selected");
			else if(data.status == '취소')
				$("#status option:eq(5)").attr("selected", "selected");
			
			$("input[name=start_date]").attr("value", start_date);
			$("input[name=close_date]").attr("value", close_date);
			
			if(data.privacy == 'true')
				$("input:radio[name=privacy][value=true]").prop("checked", true);
			else
				$("input:radio[name=privacy][value=false]").prop("checked", true);
			
		},
		error: function (data) {
			console.log('Error : ', data);
		}
	});
}
