<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="previewBox" id="imgDel${param.i }">
		<div title="imgDel" class="imgDel${param.i }" style="position: absolute;">
	<a href="javascpript:void(0)"  style="position: relative; left: 145px; top: -4px;">
		<img alt="" src="${pageContext.request.contextPath }/resources/images/tradeBoard/x.png" class="x">
	</a>
	</div>
	<div class="preview" id="preview${param.i }">
		<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/image+.png" style="width: 170px; height: 130px;">
	</div>
</div>