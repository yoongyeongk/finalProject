$(function() {
	list();
	
	
	$(document).ajaxComplete(function() {
		sortable();
	});
	
	$(".section").on("click", ".title-wrap", function() {
		var task_id = $(this).data("id");
		view(task_id);
		comment(task_id);
	});
});

function comment(task_id) {
	// var task_id = $("input[name=task_id]").val();
	$.ajax({
		type : "get",
		url : "commentList?task_id="+task_id,
		data : {
			task_id : task_id
		},
		success : function(data) {
			$.each(data, function(key, value) {
				console.log(key + ": "+value.comment_id);
				console.log(key + ": "+value.task_id);
				console.log(key + ": "+value.title);
				console.log(key + ": "+value.writer);
				console.log(key + ": "+value.reg_date);
			});
		}
	});
}

function fileSave() {
	var formData = new FormData($("#file")[0]);
	$.ajax({
        type : 'post',
        url : 'fileUpload',
        data : formData,
        processData : false,
        contentType : false,
        success : function(html) {
            alert("파일 업로드하였습니다.");
        },
        error : function(error) {
            alert("파일 업로드에 실패하였습니다.");
            console.log(error);
            console.log(error.status);
        }
    });
}

function sortable() {
	$("#sortable").sortable({
		axis : "x",
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
			
		}
	});
}

function list() {
	open();
	in_progress();
	done();
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
					html += '<input type="text" readonly="readonly" value="'+ value.title + '">';
					html += '</div>';
				}
			});
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
					html += '<input type="text" readonly="readonly" value="'+ value.title + '">';
					html += '</div>';
				}
			});
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
					html += '<div class="title-wrap" data-id='+value.task_id+' data-toggle="modal" data-target=".task-view"';
					html += '<input type="text" readonly="readonly" value="'
							+ value.title + '">';
					html += '</div>';
				}
			});
			$(".done").html(html);
		}
	});
}
