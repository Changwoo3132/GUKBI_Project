<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 내용보기</title>
<link rel="stylesheet" type="text/css" href="./css/bbs.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="./js/bbs.js"></script>
</head>
<body>
	<div id="bsC_wrap">
		<h2 class="bsC_title">상품 상세 정보</h2>
		<table id="bsC_t">
			<tr>
				<th>상품코드</th>
				<td>${pro.procode}</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td>${pro.proname}</td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td>${pro.proprice}</td>
			</tr>
			<tr>
				<th>상품 상세 정보</th>
				<td>${pro.proinfo }</td>
			</tr>
			<c:if test="${!empty pro.profile}">
				<%-- 첨부파일이 있는 경우만 나오게 하기 --%>
				<tr>
					<th>상품 이미지</th>
					<td><img src="<c:url value='../upload/${pro.profile}'/>" alt="${pro.proname}"></td>
				</tr>
			</c:if>
			<tr>
				<th>판매여부</th>
				<td><c:choose>
						<c:when test="${pro.prostate == 1}">
                		O
            			</c:when>
						<c:when test="${pro.prostate == 2}">
               			X
            			</c:when>
						<c:otherwise>
                		N/A
           				</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th>등록날짜</th>
				<td>
					<fmt:formatDate value="${pro.prodate}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><c:choose>
						<c:when test="${pro.catecode == 1}">
						상의
						</c:when>
						<c:when test="${pro.catecode == 2}">
						하의
						</c:when>
						<c:when test="${pro.catecode == 3}">
						아우터
						</c:when>
						<c:when test="${pro.catecode == 4}">
						신발
						</c:when>
					</c:choose></td>
			</tr>
		</table>

		<div id="bsC_menu">

			<button
				onclick="location='admin_product_cont?category=${category}&page=${page}&procode=${pro.procode}&state=edit';">수정</button>

			<button
				onclick="location='admin_product_cont?category=${category}&page=${page}&procode=${pro.procode}&state=del';">삭제</button>

			<button
				onclick="location='admin_product_list?category=${category}&page=${page}';">목록</button>

		</div>
	</div>
</body>
</html>