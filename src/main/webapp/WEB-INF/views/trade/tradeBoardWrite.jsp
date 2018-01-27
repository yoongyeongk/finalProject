<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/fakeLoader.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/plugin/fakeLoader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/tradeBoardWrite.css" rel="stylesheet">

<script type="text/javascript">
	var count = 0;
	var regNumber = /^[0-9]*$/;

	$(function() {

		var editor = CKEDITOR.replace('contents', {height : '310px'});

		// The "change" event is fired whenever a change is made in the editor.
		editor.on('change', function(evt) {timeout();
		});

		$("#tagForm").on("click","#addTag",function() {
							var tag = $("#addInput").val();
							var regExp = /[\{\}\[\]\/.;:|\)*~`!^\-_+<>@\s\#$%&\\\=\(\'\"]/gi

							if (tag == '' || regExp.test(tag)) {
								$("#addInput").val($("#addInput").val().replace(regExp, ""))
								$("#addTag").click()
							} else if ($(".tag").length < 8) {
								var ar = tag.split(",");

								for (var i = 0; i < ar.length; i++) {
									if ($(".tag").length < 8 && ar[i] != "") {
										var t = "<div class='tag'  id='del"+count+"'>"
												+ "<li>";
										t = t
												+ "<span class='tagColor'>"
												+ "#"
												+ ar[i]
												+ "</span>"
												+ "<span class='tagDel' title='del"+count+"'>X</span></li>";
										t = t
												+ "<input type='hidden' name='tag' class='tags' value="+ar[i]+">"
												+ "</div>";
										$("#tagBox ul").append(t)
										$("#addInput").val("")
										count++;
									}
								}
							} else {
								alert("최대 8개까지만 추가됩니다");
							}
						})

		$("#tagBox").on("click", ".tagDel", function() {
			var id = $(this).attr("title")
			$("#" + id).remove();
			count--;
		})

		$("#tagBox").on("click", ".upDel", function() {
			if (confirm("기존 태그를 삭제하시겠습니까? 게시글에서도 삭제됩니다") == true) {
				var num = parseInt(this.id);
				$.post("../tradeTag/tagDelete?num=" + num)
				var id = $(this).attr("title")
				$("#" + id).remove();
			}
		})

		$("#infoBox").on("keyup", "#phone", function() {
			if (!regNumber.test($(this).val())) {
				$(this).val("")
			} else if (this.value.length > 11) {
				$(this).val($(this).val().slice(0, -1))
			}
		})

		$("#infoBox").on("focusout", "#min_price", function() {
			$(this).val($(this).val().replace(/\,/g, ""))

			if ($(this).val() % 10000 != 0) {
				alert("10000 단위만 입력 가능합니다.")
				$(this).val("")
			}

		})

		var rd = 0;
		var check = true; //번호인증체크. 현재 일부러 true로 설정. 나중에 if ${form}이 Update일경우 true 아니면false

		$("#pc").click(function() {
			if (!check) {
				if ($("#phone").val().length == 11) {
					$("#checkBox").css("display", "block")
					var phone = $("#phone").val()
					$.ajax({
						type : "POST",
						url : "./tradeBoardCheck",
						data : {
							phone : phone
						},
						success : function(data) {
							rd = data
						}
					})
				} else {
					alert("올바른 번호를 입력해주세요")
				}
			} else {
				alert("인증되었습니다")
			}
		})

		$("#checkButton").click(function() {
			if ($("#check").val() == rd) {
				alert("인증되었습니다")
				check = true;
				$("#check").attr("readonly", "readonly")
				$("#phone").attr("readonly", "readonly")
			} else {
				alert("번호가 틀렸습니다 다시 시도하세요")
			}
		})

		$("#phone").change(function() {
			/* check = false; */
		})

		$("#btn").click(
				function() {
					if ($(".upPreviewBox").length > 0
							|| $(".previewBox").length > 0 && check == true) {
						$(this).attr("type", "")
					} else if (!check) {
						$(this).attr("type", "button")
						alert("번호 인증이 필요합니다")
					} else {
						$(this).attr("type", "button")
						alert("이미지 1개이상 선택해주세요")
					}

				})

	})
</script>
<script type="text/javascript">
	var timecheck = true;
	var url = "../tradeSave/tradeSaveInsert";
	var save_num = 0;
	var saveCount = 'insert';
	var totalCount = 0;
	var minute = 300000;
	var fnc;
	var nickName = '${user.nickname}';
	var list = { 
			call : function(id, curPage) {
			$.post("../tradeSave/saveList?writer=" + id + "&curPage=" + curPage+ "&save_num=" + save_num, function(data) {
				$(".list").html(data.trim())
				getCount();
				$(".listCall span").html("(" + totalCount + ")")
			})
		}
	}

	function timeout() {
		var writer = $("#writer").val();
		var title = "";
		var contents = "";

		if (timecheck == true) {
			timecheck = false;

			if (saveCount == 'insert') {
				fnc = setTimeout(function() {
					timecheck = true;
					title = $("#title").val();
					if (title == '') {
						title = "게시물 이름을 적어주세요";
					}
					contents = CKEDITOR.instances.contents.getData();
					$.ajax({
						type : "POST",
						url : url,
						data : {
							writer : writer,
							title : title,
							contents : contents
						},
						success : function(data) {
							save_num = data.save_num
							if (save_num == 0) {
								alert("저장되지 않았습니다. 임시저장은 최대 50개까지 입니다.");
							}
							list.call(nickName, 1, save_num)
							saveCount = 'up';
						}
					})
				}, minute);
			} else {
				fnc = setTimeout(function() {
					timecheck = true;
					title = $("#title").val();
					if (title == '') {
						title = "게시물 이름을 적어주세요";
					}
					contents = CKEDITOR.instances.contents.getData();
					url = "../tradeSave/tradeSaveUpdate";
					$.ajax({
						type : "POST",
						url : url,
						data : {
							save_num : save_num,
							writer : writer,
							title : title,
							contents : contents
						},
						success : function(data) {
							list.call(nickName, 1, save_num)
						}
					})
				}, minute);
			}
		}

	}

	function timeClear() {
		timecheck = true;
		clearTimeout(fnc);
	}

	$(function() {

		$("#over").css("display", "none");
		$(".hideSet").css("display", "none");

		list.call(nickName, 1, save_num);

		$(".listCall").click(function() {
			if ($("#over").css("display") == 'block') {
				$("#over").css("display", "none")
			} else {
				$("#over").css("display", "block ")
			}
		})

		$(".close").click(function() {
			$("#over").css("display", "none")
		})

		$(".settingGUI").click(function() {
			if ($(".hideSet").css("display") == 'block') {
				$(".hideSet").css("display", "none")
			} else {
				$(".hideSet").css("display", "block ")
			}
		})

		$("#minBtn").click(function() {
			var minSet = $("#minute").val();
			if (minSet == 1) {
				minute = 1000 * 60;
			} else if (minSet == 3) {
				minute = 1000 * 60 * 3;
			} else if (minSet == 5) {
				minute = 1000 * 60 * 5;
			} else if (minSet == 10) {
				minute = 1000 * 60 * 10;
			}
			timeClear();
			alert("설정됐습니다")
		})

		$("#over").on("click", ".list_x", function() {
			var title = $(this).attr("title");
			var num = this.id;

			$.post("../tradeSave/saveDelete?save_num=" + num)
			$("#" + title).remove();
			saveCount = 'insert';
			url = "../tradeSave/tradeSaveInsert";
			list.call(nickName, 1, save_num)
		})

		$("#over").on("click", ".page", function() {
			var curPage = $(this).attr("title");
			list.call(nickName, curPage, save_num)
		})

		$("#over").on("click",".viewLink",function() {
			var getNum = this.title;
			$.post("${pageContext.request.contextPath }/tradeSave/saveOne?save_num="+ getNum, function(data) {
								$("#title").val(data.title)
								CKEDITOR.instances.contents.setData(data.contents)
							})
				})

	})
</script>
<script type="text/javascript">
	var sel_files = [];
	var i = 0;

	$(function() {

		$("#fileBox").on("click", ".imgDel", function() {
			var id = $(this).attr("title");
			$("#" + id).remove();
			i--;
		})

		$("#fileBox").on("click", ".upImgDel", function() {
			if (confirm("기존 이미지를 삭제하시겠습니까? 게시글에서도 삭제됩니다") == true) {
				var fnum = this.id
				$.post("../tradeBoardFile/fileDelete?fnum=" + fnum);
				var id = $(this).attr("title");
				$("#" + id).remove();
			}
		})

		$("#but").on("change", "#f", function() {
			preview(this)
		})

		function preview(e) {
			sel_files = [];

			$(".previewBox").remove();

			i = 0;
			var files = e.files;
			var filesAr = Array.prototype.slice.call(files);

			var index = 0;
			filesAr
					.forEach(function(f) {
						if (!f.type.match("image.*")) {
							alert("업로드는 이미지만 가능합니다");
							return;
						}

						sel_files.push(f);

						var reader = new FileReader();
						reader.onload = function(e) {
							$("#default").remove();
							var html = '<div class="previewBox" id="imgDel'+i+'">'
									+ '<div title="imgDel'+i+'" class="imgDel" style="position: absolute;">'
									+ '<a href="javascpript:void(0)"  style="position: relative; left: 178px; top: 15px;">'
									+ '<img alt="" src="${pageContext.request.contextPath }/resources/images/tradeBoard/x.png" class="x"></a></div>'
									+ '<div class="preview" id="preview'+i+'">'
									+ '<img src="'+e.target.result +'" style="width: 170px; height: 130px;"></div></div>'

							$("#fileBox").append(html);
							i++;

						}
						reader.readAsDataURL(f);

					})
		}

	})
</script>
<script>
	$(document).ready(function() {
		$("#fakeLoader").fakeLoader({
			timeToHide : 700, // 로딩중에 걸리는 시간, 1000은 1초
			bgColor : "white", // 배경색
			spinner : "spinner1" // 로딩중으로 원하는 로딩이미지타입
		});
	});
</script>
</head>
<body>
	<div id="fakeLoader"></div>
	<contents>
	<div class="all">
		<form action="./tradeBoard${form }" method="post"
			enctype="multipart/form-data" name="frm">

			<c:if test="${form eq 'Update'}">
				<input type="hidden" name="num" value="${param.num }">
			</c:if>

			<div class="box" style="margin-top: 70px;">
				<div id="titleBox">
					<span class="star">*</span> <input type="text" name="title"
						id="title" value="${one.title }" placeholder="프로젝트의 제목을 입력해주세요."
						onkeyup="timeout()" style="padding-left: 12px"> <input
						type="hidden" name="writer" id="writer" value="${user.nickname}"
						required="required">
				</div>
			</div>

			<div id="over">
				<div class="listBox">
					<div class="position">
						<div class="guide">임시 저장된 글을 불러올 수 있습니다</div>
						<span class="close"> <img
							src="${pageContext.request.contextPath }/resources/images/tradeBoard/btn_x_close.gif">
						</span>
						<div class="list"></div>
						<div class="time_setBox">
							<div class="inBox">
								<a href="javascript:void(0)" class="settingGUI"> <img
									src="${pageContext.request.contextPath }/resources/images/tradeBoard/btn_editchange.gif">
								</a>
							</div>

							<div class="hideSet" id="hideSet">
								<div class="inBox txt">
									<p class="save_guide">시간설정에따라 글이 자동 저장되며 최대 50개까지 저장 됩니다.</p>
									<p class="save_guide sg">저장된 글은 저장일부터 한달 후에 삭제 됩니다.</p>
								</div>

								<div class="inBox ts">
									<div class="inner">
										<span>작성중인 글을</span> <select id="minute">
											<option>1</option>
											<option>3</option>
											<option selected="selected">5</option>
											<option>10</option>
										</select> <span>분마다 자동 저장</span> <input type="button" class="b"
											id="minBtn" value="확인">
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div id="tempBox">
				<div class="listCall" style="float: right;">
					<a href="javascript:void(0)">임시 저장된 글<span></span></a>
				</div>
			</div>
			<div class="box" style="height: auto;">

				<div id="con">
					<div id="conBox">
						<textarea style="width: 800px; height: 450px; resize: vertical;"
							name="contents" id="contents">${one.contents }</textarea>
					</div>
				</div>
			</div>


			<div class="box" style="margin-bottom: 20px;">
				<div id="tagForm">
					<span id="text1">태그</span> <span id="addForm"
						style="color: #969696;">#</span> <input type="text"
						placeholder="태그와 태그는 쉼표로 구분합니다. (최대 8개)" id="addInput"> <input
						type="button" id="addTag" class="b" value="추가">

					<div id="tagBox">
						<ul>
							<c:if test="${form eq 'Update'}">
								<c:forEach items="${one.tags }" var="t" varStatus="i">

									<div class='tag' id="uptag${i.index }">
										<li><span class='upColor'>#${t.tag}</span> <span
											class='upDel' title='uptag${i.index }' id="${t.tag_num }">X</span>
										</li>
									</div>
								</c:forEach>
							</c:if>
						</ul>
					</div>

				</div>
			</div>

			<div class="box" style="height: auto;">
				<div id="but">
					<label for="f">
						<div class="move">
							<div class="select b">이미지 선택</div>
							<input type="file" id="f" name="img" multiple="multiple"
								style="display: none;">
						</div>
					</label>
					<h5 style="user-select: none; display: inline-block;">
						<span class="star">*</span> 샘플 이미지를 1개 이상 선택하세요.
					</h5>
				</div>

				<div id="fileBox">
					<c:if test="${form eq 'Update' }">
						<c:forEach items="${one.fileNames }" var="file" varStatus="f">
							<div class="upPreviewBox" id="upImgDel${f.index }">
								<div title="upImgDel${f.index }" id="${file.fnum }"
									class="upImgDel" style="position: absolute;">
									<a href="javascpript:void(0)"
										style="position: relative; left: 178px; top: 15px;"> <img
										alt=""
										src="${pageContext.request.contextPath }/resources/images/tradeBoard/x.png"
										class="x">
									</a>
								</div>
								<div class="preview" id="upPreview${f.index }">
									<img
										src="${pageContext.request.contextPath }/resources/upload/${file.fileName}"
										style="width: 170px; height: 130px;">
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>


			<div class="line">
				<div class="addBox">
					<input type="button" value="주소찾기" class="ad b"
						onclick="sample2_execDaumPostcode()"><span class="star">
						*</span><br> <input style="margin-top: 10px;" type="text"
						id="address" name="address" value="${one.address }"> <input
						type="text" id="address_detail" name="address_detail"
						placeholder="상세주소" value="${one.address_detail }">
				</div>
				<div id="layer"
					style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
					<img
						src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
						id="btnCloseLayer"
						style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
						onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
			</div>



			<div class="box" style="height: auto">
				<div id="infoBox">

					<div class="in">
						<label for="corporation" class="lb">기업명 <span class="star">*</span></label>
						<input type="text" id="corporation" name="corporation"
							value="${one.corporation }" placeholder="ex) Together"
							required="required">
					</div>

					<div class="in">
						<label for="email" class="lb">이메일 <span class="star">*</span></label>
						<input type="email" id="email" name="email" value="${one.email }"
							placeholder="" required="required">
					</div>

					<div class="in">
						<label for="phone" class="lb">연락처 <span class="star">*</span></label>
						<input type="tel" id="phone" name="corporate_phone"
							value="${one.corporate_phone }" placeholder="ex) 01056807909">
						<input type="button" id="pc" value="번호인증" class="pb b">
					</div>

					<div class="in" id="checkBox" style="display: none;">
						<label for="check" class="lb">인증번호입력</label> <input type="text"
							id="check"> <input type="button" id="checkButton"
							class="b" value="확인">
					</div>

					<div class="in">
						<div style="display: inline-block; float: left;">
							<label for="min_price" class="lb">최소 경매가 <span
								class="star">*</span></label> <input type="text" name="min_price"
								id="min_price" value="${one.min_price }"
								placeholder="ex) 13,000,000" required="required">
						</div>

						<div style="display: inline-block; float: right;">
							<label for="closing_date" class="lb">마감일 <span
								class="star">*</span></label> <input type="date" name="closing_date"
								id="closing_date" value="${one.closing_date}"
								required="required">
						</div>
					</div>

				</div>
			</div>

			<div id="buttonBox">
				<button id="btn">
					<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/v.png" id="v">
					<c:choose>
						<c:when test="${form eq 'Update' }">
							수정하기
						</c:when>
						<c:otherwise>
							등록하기
						</c:otherwise>
					</c:choose>
				</button>
			</div>
		</form>
	</div>
	</contents>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById('layer');

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function sample2_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = data.address; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 기본 주소가 도로명 타입일때 조합한다.
					if (data.addressType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					/* document.getElementById('sample2_postcode').value = data.zonecode;  *///5자리 새우편번호 사용
					document.getElementById('address').value = fullAddr;
					/* document.getElementById('sample2_addressEnglish').value = data.addressEnglish; */

					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_layer.style.display = 'none';
				},
				width : '100%',
				height : '100%',
				maxSuggestItems : 5
			}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() {
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}
	</script>

</body>
</html>