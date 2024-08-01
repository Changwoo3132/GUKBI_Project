<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 삭제</title>
<link rel="stylesheet" type="text/css" href="/css/bbs.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id="bsDel_wrap">
		<h2 class="bsDel_title">자료실 삭제</h2>
		<form method="post" action="admin_product_del_ok" onsubmit="return del_check();">
			<input type="hidden" name="procode" value="${pro.procode }">
			<input type="hidden" name="page" value="${page }">
			<input type="hidden" name="category" value="${category }">
			
			<div id="bsDel_menu">
				<input type="submit" value="삭제">
				<input type="reset" value="취소" onclick="location='admin_product_cont?category=${category }&page=${page }&procode=${pro.procode}&state=cont';">
			</div>
		</form>
	</div>
</body>
</html>