<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>망고: 문의센터</title>
<jsp:include page="../include/header.jsp"/>
<link rel="stylesheet" href="./css/center/ask.css">
<form>
<div class="inquiry-board">
	<div class="QuestionLeftMenu">
		<ul>
			<li><a href="question">자주하는 질문</a></li>
			<li><a href="askcenter">고객센터</a></li>
			<li><a href="notice">공지사항</a></li>
		</ul>
	</div>
	<h2>Customer Service</h2>
        <table class="table_basic">
            <colgroup>
                <col width="8%">
                <col width="*">
                <col width="15%">
            </colgroup>
            <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">내용</th>
                <th scope="col">등록일</th>
            </tr>
            </thead>
           <tbody>
    <c:if test="${!empty blist}">
        <!-- 최신 글이 가장 큰 번호를 가지도록 설정 -->
        <c:set var="seq_no" value="${totalCount - (page - 1) * limit}" />

        <c:forEach var="b" items="${blist}">
            <tr>
                <td align="center">${seq_no}</td>
                <td class="left-align">
                    <c:if test="${b.bbs_step != 0}">
                        <c:forEach begin="1" end="${b.bbs_step}" step="1">
                            &nbsp;
                        </c:forEach>
                        <img src="./images/AnswerLine.gif">
                    </c:if>
                    <a href="bbs_cont?bbs_no=${b.bbs_no}&state=cont&page=${page}">
                        ${b.bbs_title}
                    </a>
                </td>
                <td align="center">${fn:substring(b.bbs_date, 0, 10)}</td>
            </tr>
            <!-- 글 번호를 하나씩 감소 -->
            <c:set var="seq_no" value="${seq_no - 1}" />
        </c:forEach>
    </c:if>
    <c:if test="${empty blist}">
        <tr>
            <th colspan="3">자료실 목록이 없습니다.</th>
        </tr>
    </c:if>
</tbody>

            
        </table>
        <!-- 페이징 -->
        <div id="bList_paging">
            <c:if test="${empty find_field && empty find_name}">
                <c:if test="${page <= 1}">[이전]&nbsp;</c:if>
                <c:if test="${page > 1}"><a href="askcenter?page=${page - 1}">[이전]</a>&nbsp;</c:if>
                <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                    <c:if test="${a == page}"><${a}></c:if>
                    <c:if test="${a != page}"><a href="askcenter?page=${a}">[${a}]</a>&nbsp;</c:if>
                </c:forEach>
                <c:if test="${page >= maxpage}">[다음]</c:if>
                <c:if test="${page < maxpage}"><a href="askcenter?page=${page + 1}">[다음]</a></c:if>
            </c:if>

            <c:if test="${!empty find_field && !empty find_name}">
                <c:if test="${page <= 1}">[이전]&nbsp;</c:if>
                <c:if test="${page > 1}"><a
                        href="askcenter?page=${page - 1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;</c:if>
                <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                    <c:if test="${a == page}"><${a}></c:if>
                    <c:if test="${a != page}"><a
                            href="askcenter?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;</c:if>
                </c:forEach>
                <c:if test="${page >= maxpage}">[다음]</c:if>
                <c:if test="${page < maxpage}"><a
                        href="askcenter?page=${page + 1}&find_field=${find_field}&find_name=${find_name}">[다음]</a></c:if>
            </c:if>
        </div>
        <div id="bList_menu">
            <input type="button" value="글쓰기" onclick="location='bbs_write?page=${page}';">
            <c:if test="${!empty find_field && !empty find_name}">
                <input type="button" value="전체목록" onclick="location='askcenter?page=${page}';">
            </c:if>
        </div>
        <!-- 검색 폼 -->

    </div>
</form>
<div class="form-actions">
<%--    <button type="submit" onclick="location='bbs_write';">작성하기</button>--%>
</div>
<jsp:include page="../include/footer.jsp"/>

