<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="../css/cart/detail.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<form method="post" action="basket_put">
	<input type="hidden" name="mid" value="${m.mid}">
	<input type="hidden" name="procode" value="${pro.procode}">
	<div class="product-container">
		<div class="product-image"></div>
		<div class="product-details">
			<img src="<c:url value='../upload/${pro.profile}'/>">
			<h3>아우터</h3>
			<p class="price">가격: ₩${pro.proprice}</p>
			<p class="sale-price">판매가: ₩${pro.proprice}</p>
			<label for="size">SIZE</label>
			<select id="size">
				<option>-- [필수] 옵션을 선택해 주세요 --</option>
				<option value="small">S</option>
				<option value="medium">M</option>
				<option value="large">L</option>
			</select>
			<br>
			<label for="color">수량</label>
			<input type="number" name="amount" value="1" min="1" class="quantity-input">
			<div class="button-container">
				<button type="button" onclick="location='payment?mid=${m.mid}';">구매하기</button>
				<button type="submit">장바구니 담기</button>
				<button type="button">찜목록</button>
			</div>
		</div>
	</div>
</form>
<jsp:include page="../include/footer.jsp" />