<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="previewBox" id="imgDel${param.index }">
	<div title="imgDel${param.index }" class="imgDel" style="position: absolute;">
		<a href="javascpript:void(0)"  style="position: relative; left: 145px; top: -4px;">
			<img alt="" src="${pageContext.request.contextPath }/resources/images/tradeBoard/x.png" class="x">
		</a>
	</div>
		<label for="imgInput${param.index }">
		<div class="preview" id="preview${param.index }">
			<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/image+.png" style="width: 170px; height: 130px;">
		</div>
		<div class="move">
				<div class="b">이미지 선택</div>
				<input type="file" name="img" class="files" id="imgInput${param.index }"  title="${param.index }" accept=".jpg,.png,.jpeg,.pmp" style="display: none;">
		</div>
			</label>
</div>
