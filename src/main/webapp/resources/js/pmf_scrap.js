$(function(){
	var snums = [];

	//div 클릭 처리 - 비교하기
	$(".wrap_total").click(function(){
		clickedDiv = $(this);
		var snum = clickedDiv.attr("id");
		var result = 0;
		clickedDiv.toggleClass("click");	

		if(snums.length == 0){	//배열 크기가 0일 경우, 새롭게 추가
			snums.push(snum);
		}else{	
			var check = true;
			//배열 크기가 0이 아닌 경우, 해당 번호가 있는지 확인 후 추가
			for(var i=0; i<snums.length; i++){
				if(snum == snums[i]){			//번호가 없다면, 새롭게 추가	
					snums.splice(i,1);
					check = false;			
					break;
				}			
			}
			if(check){
				snums.push(snum);
			}
		}
	});

	//div 클릭 처리 2 - 원본 글 보기
	$(".wrap_total").dblclick(function(){
		var num = $(this).data("num");

		location.href = "../pmf/pmfView?num="+num;
	});

	//비교하기 버튼 클릭 시
	$(".compare_btn").click(function(){
		if(snums.length > 1 && snums.length < 5){
			//ajax로 배열 보내서 데이터 받아오기
			$.ajax({
				type: "POST",
				url: "./pmfViews",
				data:{
					snums: snums.toString()
				},
				success: function(data){
					$("#compare_result").html(data);
					snums.splice(0,snums.length);
					$(".wrap_total").removeClass("click");
				}
			});

			//modal로 띄우기
			$("#modal").show();
			$("#option_sec").hide();

		}else if(snums.length > 4){
			alert("4개까지만 비교가 가능합니다.");
		}else{
			alert("비교할 항목을 두 가지 이상 선택해 주세요.");
		}
	});

	//modal close
	$("#modal").click(function(){
		$(this).hide();
		$("#option_sec").hide();
	});

	//option 추가
	$("#option_btn").click(function(){
		event.stopPropagation();
		event.preventDefault();
		$("#option_sec").toggle();
	});

	//체크박스 클릭 시 전파 방지
	$(".check").click(function(){
		event.stopPropagation();
	});

	//option 변경사항 적용
	$("#submit").click(function(){
		event.stopPropagation();
		$(".compare_tr").hide();

		$('.check:checked').each(function() { 
			var id = $(this).attr("id");

			$("."+id).show();
		});
	});

	//초기화
	$("#reset").click(function(){
		event.stopPropagation();
	});

	//원본 글 보기 버튼 클릭 이벤트
	$("#compare_result").on("click", ".view_btn",function(){
		event.stopPropagation();
		var num = $(this).data("value");

		location.href = "../pmf/pmfView?num="+num;
	});
});