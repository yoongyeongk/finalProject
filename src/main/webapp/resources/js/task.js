$(function() {
	list();
	$(document).ajaxComplete(function() {
		sortable();
	});
	
	$(".fa-arrow-left").click(function() {
		history.back();
	});
	
	$("#create-task").click(function() {
		create();
	});
	
	$(".section").on("click", ".title-wrap", function() {
		var task_id = $(this).data("id");
		view(task_id);
	});
	
	$("#update-task").click(function() {
		update();
	});
	
	$(".section").on("click", ".delete-btn", function(e) {
		var task_id = $(".title-wrap").data("id");
		console.log(task_id);
		e.stopPropagation();
		swal({
			title: "삭제하시겠습니까?",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
			deleteTask(task_id);
			if (willDelete) {
				swal("성공적으로 삭제되었습니다.", {
					icon: "success",
				});
			}
		});
	});
});

function sortable() {
	$(".sortable-x").sortable({
		axis : "x",
		containment : "parent"
	});
	
	$(".sortable-y").sortable({
		axis : "y",
		containment : "parent"
	});
}

function view(task_id) {
	$.ajax({
		type : "get",
		url : "view",
		data : {
			task_id : task_id,
		},
		success : function(data) {
			$("input[name=task_id]").val(data.task_id);
			$("input[name=title]").val(data.title);
			
			var start_date = data.start_date;
			var close_date = data.close_date;
			
			if(data.start_date != null)
				start_date = moment(data.start_date).format('YYYY-MM-DD');
			
			if(data.close_date != null)
				close_date = moment(data.close_date).format('YYYY-MM-DD');
			
			$("input[name=start_date]").attr("value", start_date);
			$("input[name=close_date]").attr("value", close_date);
			
			commentList(task_id);
		}
	});
}

function list() {
	open();
	in_progress();
	done();
}

function create() {
	var param = $("#task-form").serialize();
	$.ajax({
		type : "post",
		url : "create",
		data : param,
		dataType : "json",
		success : function(data) {
			list();
			$(".new-task-modal").modal('toggle');
		}
	});
}

function update() {
	var param = $("#update-form").serialize();
	console.log(param);
	$.ajax({
		type : "post",
		url : "update",
		data : param,
		dataType : "json",
		success : function(data) {
			list();
			$(".task-view").modal('toggle');
		}
	});
}

function deleteTask(task_id) {
	$.ajax({
		type : "post",
		url : "delete",
		data : {
			task_id : task_id
		},
		success : function(data) {
			list();
		}
	});
}

function open() {
	var project_id = $("input[name=project_id]").val();
	$.ajax({
		type : "get",
		url : "list?project_id=" + project_id,
		success : function(data) {
			var html = '';
			$.each(data, function(key, value) {
				if (value.status == null) {
					html += '<div class="title-wrap" data-id='+value.task_id+' data-toggle="modal" data-target=".task-view">';
					/*html += '<label class="form-label">'+value.title+'</lable>';*/
					html += '<input type="text" readonly="readonly" value="'+ value.title + '">';
					html += '<i class="delete-btn fas fa-times"></i>';
					html += '</div>';
				}
			});
			html += '<div class="add-task add-task-0" data-toggle="modal" data-target=".task"><i class="fas fa-plus"></i></div>';
			$(".open").html(html);
		}
	});
}

function in_progress() {
	var project_id = $("input[name=project_id]").val();
	$.ajax({
		type : "get",
		url : "list?project_id=" + project_id,
		success : function(data) {
			var html = '';
			$.each(data, function(key, value) {
				if (value.status == "1") {
					html += '<div class="title-wrap" data-id='+value.task_id+' data-toggle="modal" data-target=".task-view">';
					/*html += '<label class="form-label">'+value.title+'</lable>';*/
					html += '<input type="text" readonly="readonly" value="'+ value.title + '">';
					html += '<i class="delete-btn fas fa-times"></i>';
					html += '</div>';
				}
			});
			html += '<div class="add-task add-task-1" data-toggle="modal" data-target=".task"><i class="fas fa-plus"></i></div>';
			$(".in-progress").html(html);
		}
	});
}

function done() {
	var project_id = $("input[name=project_id]").val();
	$.ajax({
		type : "get",
		url : "list?project_id=" + project_id,
		success : function(data) {
			var html = '';
			$.each(data, function(key, value) {
				if (value.status == "2") {
					html += '<div class="title-wrap" data-id='+value.task_id+' data-toggle="modal" data-target=".task-view">';
					/*html += '<label class="form-label">'+value.title+'</lable>';*/
					html += '<input type="text" readonly="readonly" value="'+ value.title +'">';
					html += '<i class="delete-btn fas fa-times"></i>';
					html += '</div>';
				}
			});
			html += '<div class="add-task add-task-2" data-toggle="modal" data-target=".task"><i class="fas fa-plus"></i></div>';
			$(".done").html(html);
		}
	});
}
