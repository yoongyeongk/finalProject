$(function(){

	var curPage = 1;
	var kind = $("#kind").val();
	var search = "";
	callList(curPage,kind,search);

	//검색
	$(".search_btn").click(function(){
		search = $("#search").val();
		callList(curPage,kind,search);
	});

	//페이징
	$(".paging_one").click(function(){
		curPage = $(this).html();
		search = $("#search").val();
		callList(curPage,kind,search);
		$(".paging_one").removeCss("currentPage");
		$(this).addCss("currentPage");
	});
});

function callList(curPage,kind,search){	
	$.ajax({
		type: "POST",
		url: "./pmfList",
		data: {
			kind: kind,
			search: search,
			curPage: curPage
		},
		success: function(data){
			$("#listCall").html(data);
		}
	});
}
