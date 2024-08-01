<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<link rel="stylesheet" href="../css/cart/bottom.css">
<input type="hidden" name="mid" value="${m.mid}">
<div class="outerwear-container">
    <%-- 아우터 제품 목록 --%>

    <c:forEach var="pro" items="${plist}">
        <div class="outerwear-item">
            <img src="<c:url value='../upload/${pro.profile}'/>" alt="${pro.proname}"
                 href="detail?procode=${pro.procode }">
            <h3><a href="detail?procode=${pro.procode }">${pro.proname }></a></h3>
            <span>${pro.proprice }</span>
        </div>
    </c:forEach>
</div>
<jsp:include page="../include/footer.jsp"/>