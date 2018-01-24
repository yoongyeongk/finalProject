$(function() {
	draggable();
	list();
});

function draggable() {
	$(".task").draggable({
		/* axis : "x", */ 
		containment : "parent"
	});
}
function list() {
	var project_id = $("input[name=project_id]").val();
	$.ajax({
		type : "get",
		url : "list?project_id="+project_id,
		success : function(data) {
			var html = '';
			$.each(data, function(key, value) {
				html += '<div class="draggable task">';
				html += '<div class="task-header">';
				html += '<input id="complete" class="checkbox-inline" type="checkbox">';
				html += '<input id="title" class="form-control" type="text" value="'+value.title+'" placeholder="업무 리스트 이름">';
				html += '<button id="new-task"><i class="fas fa-plus"></i></button>';
				html += '</div>';
				html += '<div class="task-input">';
				html += '<textarea class="form-control" placeholder="새 업무 작성">'+value.comments+'</textarea>';
				html += '<button class="btn btn-default">작성</button>';
				html += '<button class="btn btn-default">취소</button>';
				html += '</div>';
				html += '</div>';
			});
			$(".page-contents").html(html);
		}
	});
}