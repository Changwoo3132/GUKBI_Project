<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />
<title>망고: 찜목록</title>
<link rel="stylesheet" href="../css/cart/wish.css">

<form id="cartForm" action="payment">
<input type="hidden" name="cartcode" value="${cartcode}"/>
<input type="hidden" id="totalPayInput" name="totalPay" value="0"/>
   <div class="cart-container">
      <h1>W I S H</h1>
      <c:if test="${!empty clist}">
         <table class="cart-table">
            <thead>
               <tr>
                  <th scope="col">카넘</th>
                  <th scope="col">선택</th>
                  <th scope="col">이미지</th>
                  <th scope="col">상품정보</th>
                  <th scope="col">수량</th>
                  <th scope="col">상품구매금액</th>
                  <th scope="col">배송비</th>
                  <th scope="col">선택</th>
               </tr>
            </thead>

            <tbody>
               <c:forEach var="c" items="${clist}">
                  <tr>
                     <td>${c.cartcode}</td>
                     <td><input type="checkbox" name="selectedProducts"
                        value="${c.product.proprice}" class="product-checkbox" onclick="calculateTotal()"></td>
                     <td><img
                        src="<c:url value='../upload/${c.product.profile}'/>"
                        alt="상품 이미지" class="product-image"></td>
                     <td>${c.product.proname }</td>
                     <td>${c.amount}</td>
                     <td>₩${c.product.proprice}</td>
                     <td>₩3500</td>
                     <td>
                        <button class="order-button">주문</button>
                        <a class="remove-button" href="basket_del?cartcode=${c.cartcode}">삭제</a>
                     </td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>

         <!-- 추가된 요약 테이블 -->
         <div class="summary-container">
            <table class="summary-table">
               <tr>
                  <td>총 상품금액:</td>
                  <td id="totalPay">₩0</td>
               </tr>
               <tr>
                  <td>결제예정금액:</td>
                  <td class="summary-total-amount" id="finalPay">₩0</td>
               </tr>
            </table>
         </div>

         <div class="actions">
            <button type="button" onclick="location='index';" class="continue-shopping">쇼핑 계속하기</button>
            <button type="button" onclick="submitForm()" class="checkout">결제하기</button>
         </div>
      </c:if>
      <c:if test="${empty clist}">
         <div>장바구니에 담은 상품이 없습니다.</div>
      </c:if>
   </div>
</form>
<jsp:include page="../include/footer.jsp" />

<script>
function calculateTotal() {
    const checkboxes = document.querySelectorAll('.product-checkbox');
    let total = 0;
    checkboxes.forEach((checkbox) => {
        if (checkbox.checked) {
            total += parseInt(checkbox.value, 10);
        }
    });
    document.getElementById('totalPay').innerText = '₩' + total.toLocaleString();
    document.getElementById('finalPay').innerText = '₩' + total.toLocaleString();
    document.getElementById('totalPayInput').value = total; // Update hidden input field
}

function submitForm() {
    document.getElementById('cartForm').submit();
}
</script>
