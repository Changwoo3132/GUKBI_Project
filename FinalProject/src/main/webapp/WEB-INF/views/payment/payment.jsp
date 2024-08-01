<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="./js/member.js"></script>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="../css/cart/payment.css">


<div class="order-form">
   <h1>주문서</h1>
   <hr>
   <form>
      <section class="section">
         <h2>회원 정보</h2>
         <table style="width: 80%" align="center">
            <tr>
               <th><label for="recipientName">받는사람:</label></th>
               <td><input type="text" id="recipientName" value="${m.mid}" required></td>
            </tr>
            <tr>
               <th><label for="userEmail">이메일</label></th>
               <td><input type="email" id="userEmail" value="${m.memail }" required></td>
            </tr>
            <tr>
               <th><label for="userPhone">휴대전화:</label></th>
               <td><input type="text" id="userPhone" value="${m.mphone }" required></td>
            </tr>

            <tr>
               <th><label for="addrcode">우편번호:</label></th>
               <td class="form-group">
                  <button type="button" onclick="execDaumPostcode()">우편번호 찾기</button>
                  <input type="text" id="addrcode" name="addrcode" value="${m.addrcode }" readonly>
               </td>
            </tr>
            <tr>
               <th><label for="myaddr">주소:</label></th>
               <td><input type="text" id="myaddr" name="myaddr" value="${m.myaddr }" readonly></td>
            </tr>
            <tr>
               <th><label for="myaddr2">상세주소:</label></th>
               <td><input type="text" id="myaddr2" name="myaddr2" value="${m.myaddr2 }"></td>
            </tr>
         </table>
      </section>

      <section class="section">
         <h2>상품확인</h2>
         <table style="display: flex">
            <tr>
               <th scope="col">상품명</th>
               <th scope="col">수량</th>
               <th scope="col">상품가격</th>
            </tr>
            <c:forEach var="product" items="${param.selectedProducts.split(';')}">
               <c:set var="productDetails" value="${product.split(',')}" />
               <tr>
                  <td>${productDetails[0]}</td>
                  <td>${productDetails[1]}</td>
                  <td>₩${productDetails[2]}</td>
               </tr>
            </c:forEach>
            <tr>
               <td>상품 총액 :</td>
               <td colspan="2">₩${param.finalPay}</td>
            </tr>
         </table>
      </section>

      <section class="aaaaa">
         <button type="button" onclick="requestPay()">결제</button>
      </section>
   </form>
</div>
<%--<script>--%>
<%--        document.getElementById('kakaoPayButton').addEventListener('click', function() {--%>
<%--            $.ajax({--%>
<%--                type: 'POST',--%>
<%--                url: '/payment/ready',--%>
<%--                dataType: 'json',--%>
<%--                success: function(data){--%>
<%--                   // alert(data.tid);--%>
<%--                    let box = data.next_redirect_pc_url;--%>
<%--                    open(box);--%>
<%--                },--%>
<%--                error: function(error) {--%>
<%--                    alert(error);--%>
<%--                    console.log(error);--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--</script>--%>

<script>
   var IMP = window.IMP;   // 생략 가능
   IMP.init("imp52330146"); // 예: imp00000000

   var today = new Date();
   var hours = today.getHours(); // 시
   var minutes = today.getMinutes();  // 분
   var seconds = today.getSeconds();  // 초
   var milliseconds = today.getMilliseconds();
   var makeMerchantUid = hours + minutes + seconds + milliseconds;

   function requestPay() {
      IMP.request_pay({
         pg : 'kakaopay.TC0ONETIME',
         pay_method : 'card',
         merchant_uid: "IMP" + makeMerchantUid,
         name : '호박',
         amount : 2000,
         buyer_email : 'Iamport@chai.finance',
         buyer_name : '포트원 기술',
         buyer_tel : '010-1234-5678',
         buyer_addr : '서울특별시 강남구 삼성동',
         buyer_postcode : '123-456'
      }, function (rsp) { // callbackttggv
         //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
         if (rsp.success) {
            // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            // jQuery로 HTTP 요청
            jQuery.ajax({
               url: "http://localhost:8052",
               method: "POST",
               headers: { "Content-Type": "application/json" },
               data: {
                  imp_uid: rsp.imp_uid,            // 결제 고유번호
                  merchant_uid: rsp.merchant_uid   // 주문번호
               }
            }).done(function (data) {
               // 가맹점 서버 결제 API 성공시 로직
            })
         } else {
            alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
         }
      });
   }
</script>

<jsp:include page="../include/footer.jsp" />
