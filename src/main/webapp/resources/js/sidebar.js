
$(function(){
	var check = true;
	$(".sideOn").click(function(){
		if(check){
			$("#main").css("margin-left",'130px');
			$("#sidenav").fadeIn(300);
			check = false;
		}else{
			$("#sidenav").hide(function(){
				$("#sidenav").fadeOut();
				$("#main").css("margin-left",'0px');
				check = true;
			});			
		}
	});
});