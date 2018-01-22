function openNav() {
	document.getElementById("sidenav").style.width = "130px";
	document.getElementById("main").style.marginLeft = "130px";
}

/*function closeNav() {
	document.getElementById("sidenav").style.width = "0";
	document.getElementById("main").style.marginLeft = "0";
}*/
$(function(){
	$(".sidebar-btn").click(function(){
		$("#sidenav").toggle(function(){
			openNav();
		});
	});
});