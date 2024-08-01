<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/admin_header.jsp"%>
<link rel="stylesheet" href="../css/admin/productlist.css">
<%-- ../는 한단계 상위폴더로 이동하라는 상대경로.
     ./는 현재경로. ../../ 두단계 상위폴더로 이동 --%>
<%--관리자 상품 목록 --%>
<div id="aMain_cont">
	<form method="get">
	<input type="hidden" name="category" value="${category }"/>
		<div id="bList_wrap">
			<h2 class="bList_title">상품등록 목록</h2>
			<table>
				<tr>
					<th><a href="/admin_product_list?category=top&page=${page}">상의</a></th>
					<th><a href="/admin_product_list?category=bottom&page=${page}">하의</a></th>
					<th><a href="/admin_product_list?category=outer&page=${page}">아우터</a></th>
					<th><a href="/admin_product_list?category=shoes&page=${page}">신발</a></th>
				</tr>
			</table>
			<div class="bList_count">
				<c:choose>
					<c:when test="${category == 'top'}">
						상의
					</c:when>
					<c:when test="${category == 'bottom'}">
						하의
					</c:when>
					<c:when test="${category == 'outer'}">
						아우터
					</c:when>
					<c:otherwise>
						신발
					</c:otherwise>
				</c:choose>
				개수:<strong>${totalCount}</strong>개
			</div>
			<table>
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>상품가격</th>
				</tr>

				<c:forEach var="pro" items="${plist}">
					<tr>
						<td>${pro.procode}</td>
						<td><a href="admin_product_cont?category=${category}&page=${page}&procode=${pro.procode}&state=cont">
							${pro.proname}
						</a></td>
						<td>${pro.proprice}</td>
					</tr>
				</c:forEach>

				<c:if test="${empty plist }">
					<tr>
						<th colspan="5">자료실 목록이 없습니다.</th>
				</c:if>
			</table>

			<%-- 페이징 --%>
			<div id="bList_paging">
				<%-- 검색전 페이징 --%>
				<c:if test="${(empty find_field) && (empty find_name)}">
					<c:if test="${page <=1}">
						[이전]&nbsp;
					</c:if>
					<c:if test="${page >1}">
						<a href="admin_product_list?category=${category}&page=${page-1}">[이전]</a>&nbsp;
					</c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a href="admin_product_list?category=${category}&page=${a}">[${a}]</a>&nbsp;
						</c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a href="admin_product_list?category=${category}&page=${page+1}">[다음]</a>
					</c:if>
				</c:if>

				<%-- 검색 후 페이징 --%>

				<c:if test="${(!empty find_field) && (!empty find_name)}">
					<c:if test="${page <=1}">
						[이전]&nbsp;
					</c:if>
					<c:if test="${page >1}">
						<a
							href="admin_product_list?category=${category}&page=${page-1}&find_field=${find_field}&find_name=${find_name}">
							[이전] </a>&nbsp;
					</c:if>

					<%--쪽번호 출력부분 --%>
					<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>

						<c:if test="${a != page}">
							<a
								href="admin_product_list?category=${category}&page=${a}&find_field=${find_field}&find_name=${find_name}">
								[${a}] </a>&nbsp;
						</c:if>
					</c:forEach>

					<c:if test="${page>=maxpage}">[다음]</c:if>
					<c:if test="${page<maxpage}">
						<a
							href="admin_product_list?category=${category}&page=${page+1}&find_field=${find_field}&find_name=${find_name}">
							[다음] </a>
					</c:if>
				</c:if>
			</div>

			<div id="bList_menu">
				<input type="button" value="상품등록"
					onclick="location='admin_product_write?';">

				<c:if test="${(!empty find_field) && (!empty find_name)}">
					<input type="button" value="전체목록"
						onclick="location='admin_product_category';">
				</c:if>
			</div>

			<%-- 검색 폼 --%>
			<div id="bFind_wrap">
				<select name="find_field">
					<option value="procode"
						<c:if test="${find_field == 'procode'}">${'selected'}</c:if>>
						상품코드
					</option>
					<%-- selected 속성을 사용해서 선택되게 함 --%>
					<option value="proname"
						<c:if test="${find_field == 'proname'}">${'selectd'}</c:if>>
						상품명
					</option>
				</select>
				<input type="search" name="find_name" id="find_name" size="14" value="${find_name}"> 
				<input type="submit" value="검색">
			</div>

		</div>
	</form>
</div>