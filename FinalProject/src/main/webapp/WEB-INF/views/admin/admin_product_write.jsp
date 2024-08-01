<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 등록</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="./js/bbs.js"></script>
<%-- 유효성 검증 javascript & jQuery --%>
<link rel="stylesheet" type="text/css" href="../css/admin/productwrite.css">
</head>
<body>
	<div id="bsW_wrap">
		<h2 class="bsW_title">상품 등록</h2>
		<form method="post" action="admin_product_write_ok"
			onsubmit="return write_check();" enctype="multipart/form-data">
			<table id="bsW_t">
				<tr>
					<th>상품명</th>
					<td><input name="proname" id="proname" size="25"></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><input name="proprice" id="proprice" size="25"></td>
				</tr>
				<tr>
					<th>상품정보</th>
					<td><textarea name="proinfo" id="proinfo" rows="8" cols="34"></textarea>
					</td>
				</tr>
				<tr>
					<th>재고</th>
					<td><input name="proqty" id="proqty" size="10"></td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td><input type="file" name="uploadFile"></td>
				</tr>
				<tr>
					<th>판매여부</th><!-- 1. O 2. X -->
					<td>
						<input type="radio" name="prostate" id="prostate1" value="1">
				 		O 
				 		<input type="radio" name="prostate" id="prostate2" value="2"> 
				 		X
					 </td>
				 </tr>
				<tr>
					<th>카테고리</th>
						<td>
						<input type="radio" name="catecode" id="catecode1" value="1">
				 		상의
				 		<input type="radio" name="catecode" id="catecode2" value="2">
				 		하의
				 		<input type="radio" name="catecode" id="catecode3" value="3">
				 		아우터
				 		<input type="radio" name="catecode" id="catecode4" value="4">
				 		신발
					</td>
				</tr>
			</table>
			<div id="bsW_menu">
				<input type="submit" value="입력">
				<input type="reset" value="취소" onclick="$('#proname').focus();">
				<input type="button" value="목록" onclick="location='admin_product_list?category=${category}&page=${page}';">
			</div>
		</form>
	</div>
</body>
</html>