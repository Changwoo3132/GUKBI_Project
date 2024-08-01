<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 수정폼</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<%-- jQuery CDN(Content Delivery Network의 약어)이란 인터넷 온라인으로 원격으로 연결해서 원격 서버 컴퓨터에 있는 jQuery
라이브러리를 다운받아서 사용하는 방식이다. 그러므로 jQuery라이브러리 파일을 로컬 컴에 실제 다운받지 않는다. --%>
<script src="./js/bbs.js"></script>
<%-- 유효성 검증 javascript & jQuery --%>
<link rel="stylesheet" type="text/css" href="./css/bbs.css">
</head>
<body>
	<div id="bsW_wrap">
		<h2 class="bsW_title">상품 수정</h2>
		<form method="post" action="admin_product_edit_ok"
			onsubmit="return write_check();" enctype="multipart/form-data">
			<input type="hidden" name="page" value="${page}"> <input
				type="hidden" name="category" value="${category}"> <input
				type="hidden" name="procode" value="${pro.procode}">
			<table id="bsW_t">
				<tr>
					<th>상품명</th>
					<td><input name="proname" id="proname" size="30"
						value="${pro.proname}"></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><input name="proprice" id="proprice" size="30"
						value="${pro.proprice }"></td>
				</tr>
				<tr>
					<th>상품정보</th>
					<td><textarea name="proinfo" id="proinfo" rows="8" cols="34">${pro.proinfo}</textarea>
					</td>
				</tr>
				<tr>
					<th>재고</th>
					<td><input name="proqty" id="proqty" size="10"
						value="${pro.proqty}"></td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file" name="uploadFile"><br>${pro.profile}</td>
				</tr>
				<tr>
					<th>판매여부</th>
					<!-- 1. O 2. X -->
					<td><input type="radio" name="prostate" id="prostate1" value="1" 
						${pro.prostate == 1 ? 'checked' : ''}> O 
						<input type="radio" name="prostate" id="prostate2" value="2"
						${pro.prostate == 2 ? 'checked' : ''}> X
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
						<td>
						<input type="radio" name="catecode" id="catecode1" value="1"
						${pro.catecode == 1 ? 'checked' : ''}>
				 		상의
				 		<input type="radio" name="catecode" id="catecode2" value="2"
				 		${pro.catecode == 2 ? 'checked' : ''}>
				 		하의
				 		<input type="radio" name="catecode" id="catecode3" value="3"
				 		${pro.catecode == 3 ? 'checked' : ''}>
				 		아우터
				 		<input type="radio" name="catecode" id="catecode4" value="4"
				 		${pro.catecode == 4 ? 'checked' : ''}>
				 		신발
					</td>
				</tr>
			</table>
			<div id="bsW_menu">
				<input type="submit" value="수정"> <input type="reset"
					value="취소" onclick="$('#procode').focus();"> <input
					type="button" value="목록"
					onclick="location='admin_product_list?category=${category}&page=${page}';">
			</div>
		</form>
	</div>
</body>
</html>