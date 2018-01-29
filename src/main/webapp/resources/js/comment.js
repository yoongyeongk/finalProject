$(function() {
	$(".new-comment").click(function() {
		var param = $("#comment-form").serialize();
		commentWrite(param);
	});
});

function commentList(task_id){
    $.ajax({
        url : 'comment/list',
        type : 'get',
        data : {
        	task_id : task_id
        },
        success : function(data){
            var a = ''; 
            $.each(data, function(key, value){ 
            	a += '<div class="comment-wrap">'; 
            	a += '<input type="hidden" name="comment_id" value="'+value.comment_id+'">';
            	a += '<p>'+'작성자'+value.writer+'</p>';
            	a += '<div class="commentContents'+value.comment_id+'"><p>'+value.contents+'</p></div>';
            	a += '<a onclick="commentUpdateForm('+value.comment_id+',\''+value.contents+'\');"> 수정 </a>';
            	a += '<a onclick="commentDelete('+value.comment_id+');"> 삭제 </a> </div>';
            	a += '</div>';
            });
            $(".comment-list").html(a);
        }
    });
}

function commentWrite(param) {
	var task_id = $("input[name=task_id]").val();
	$.ajax({
		type : "post",
		url : "comment/write",
		data : param,
		dataType : "json",
		success : function(data) {
			if(data == 1) {
				commentList(task_id);
                $("[name=contents]").val("");
            }
		}
	});
}

function commentUpdateForm(comment_id, contents){
	var a ='';
	a += '<input type="text" class="input-comment form-control" name="content_id'+comment_id+'" value="'+contents+'"/>';
	a += '<button class="btn btn-default" type="button" onclick="commentUpdate('+comment_id+');">수정</button>';
	$('.commentContents'+comment_id).html(a);
}

function commentUpdate(comment_id) {
    var updateContent = $('[name=content_id'+comment_id+']').val();
    var task_id = $("[name=task_id]").val();
    $.ajax({
    	type : 'post',
        url : 'comment/update',
        data : {
        	contents : updateContent, 
        	comment_id : comment_id
        },
        success : function(data) {
            if(data == 1)
            	commentList(task_id);
        }
    });
}

function commentDelete(comment_id){
	var task_id = $("[name=task_id]").val();
    $.ajax({
    	type : 'post',
        url : 'comment/delete',
        data : {
        	comment_id : comment_id
        },
        success : function(data) {
            if(data == 1)
            	commentList(task_id);
        }
    });
}

