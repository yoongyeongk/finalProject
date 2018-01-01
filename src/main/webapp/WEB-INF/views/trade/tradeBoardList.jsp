<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
	body{
		width: 100%;
		height: 100%;
	}
	.all{
		width: 1300px;
		height: 1500px;
		margin: 0 auto;
	}
	.box{
		width: 1200px;
		height: auto;
		margin: 0 auto;
	}
	#listBox{
		margin-top: 150px;
	}
	#tb{
		width: 1100px;
		table-layout: fixed;
		border-left: none;
		border-right: none;
	}
	tr{
		border-bottom:1px solid #e1e1e1;
	}
	th{
		font-weight: normal;
	}
	#top>th{
		text-align: center;
    	height: 37px;
    	background: #fafafa;
    	border:0;
    	border-bottom: 1px solid #ddd;
    	border-top: 1px solid #ddd;
    	font-family: "Malgun Gothic", "Arial", sans-serif !important;
    	font-size: 13px;
    	color: #888;
	}
	.cell>th,td{
		height: 130px;
		overflow: hidden;
   		text-overflow: ellipsis;
    	white-space: nowrap;
    	vertical-align: top;
	}
	.co{
		font-size: 14px;
		text-align: center;
	}
	.corporation{
		width: 220px;
	}
	.loc>a{
		font-size: 16px;
		text-decoration: none;
		color: black;
	}
	.loc>a:hover{
		color: black;
	}
	.t{
		padding-left: 12px;
	}
	.ct{
		text-align: center;
	}
	.price{
		font-size: 12px;
    	line-height: 20px;
    	font-family: "Malgun Gothic", "Arial", sans-serif;
    	color: #666;
	}
	.date{
		padding: 0;
    	font-size: 12px;
   		letter-spacing: -.03em;
    	color: #888;
	}
	.tags{
		border: none;
		border-radius:10px;
		background : darkturquoise;
		margin-right: 8px;
		padding: 0px 5px; 0px 5px;
		text-decoration: none;
	}
	.tags:hover{
		border: 1px solid darkturquoise;
		background: none;
		text-decoration: none;
	}
	.tags:hover >span{
		color:darkturquoise;
	}
	.tagSet{
		font-family: "Malgun Gothic", "Arial", sans-serif;
		font-size:13px;
		color: white;
		margin-left: 1px;
	}
	.line{
		margin-top: 15px;
	}
	.loc{
		padding: 30px 0px 25px 0px;
	}
</style>
</head>
<body>
	<list>
		<div class="all">
		
		
		
		
		
			<div class="box">
				<div id="listBox">
					<table id="tb">
						<colgroup>
							<col width="20%">
							<col width="50%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr id="top">
								<th scope="col">기업명</th>
								<th scope="col">프로젝트 제목</th>
								<th scope="col">현재 경매가</th>
								<th scope="col">마감일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="dto">
								<tr class="cell">
									<th scope="row" class="co">
										<div class="loc">
											<div class="corporation">
												<span>
													${dto.corporation }
												</span>
											</div>
										</div>
									</th>
									
									<td class="title t"> 
										<div class="loc" style="margin-left: 10px;"><a href="./tradeBoardView?num=${dto.num }">${dto.title }</a>
											<div class="line"> 
												<c:forEach items="${tags }" var="t">
													<c:if test="${dto.num eq t.num}">
														<a href="#" class="tags">
															<span class="tagSet">${t.tag }</span>
														</a>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</td>
									
									<td class="ct price">
										<div class="loc">
											<fmt:formatNumber value="1000" type="currency" currencySymbol="￦"/>
										</div>
									</td>
									
									<td class="ct date">
										<div class="loc">
											<div>~</div>
											<fmt:formatDate dateStyle="long"  value="${dto.closing_date }"/>
										</div>
									</td>
								</tr>
							</c:forEach>
					
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
	</list>
</body>
</html>