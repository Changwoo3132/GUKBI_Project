<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>공지 사항</title>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="../css/center/notice.css">
<form method="get" action="Notice">
	<div class="PcMenuBox">
		<div class="QuestionLeftMenu">
			<ul>
				<li><a href="question">자주하는 질문</a></li>
				<li><a href="askcenter">고객센터</a></li>
				<li><a href="notice">공지사항</a></li>
			</ul>
		</div>
	</div>
	<div class="right_contents" id="bList_wrap">
		<h2 class="bList_title">Notice</h2>
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
    <c:if test="${!empty nlist}">
        <!-- 페이지 시작 번호를 계산 -->
        <c:set var="startNumber" value="${listcount - (page - 1) * 10}" />
        <!-- 최신 글이 가장 큰 번호를 가지도록 설정 -->
        <c:set var="seq_no" value="${startNumber}" />

        <c:forEach var="n" items="${nlist}">
            <tr>
                <td>${seq_no}</td>
                <td class="tit_contents_td">
                    <a href="user_notice_cont?notice_no=${n.notice_no}">
                        <c:choose>
                            <c:when test="${fn:length(n.notice_title) > 16}">
                                ${fn:substring(n.notice_title, 0, 16)}...
                            </c:when>
                            <c:otherwise>
                                ${n.notice_title}
                            </c:otherwise>
                        </c:choose>
                    </a>
                </td>
                <td>${fn:substring(n.notice_date, 0, 10)}</td>
            </tr>
            <!-- 글 번호를 하나씩 감소, 1 이하로 내려가지 않도록 설정 -->
            <c:set var="seq_no" value="${seq_no - 1}" />
            <c:if test="${seq_no < 1}">
                <c:set var="seq_no" value="1" />
            </c:if>
        </c:forEach>
    </c:if>
    <c:if test="${empty nlist}">
        <tr><td colspan="3">공지 목록이 없습니다!</td></tr>
    </c:if>
</tbody>
		</table>
		
  
    </form>
</div>
<jsp:include page="../include/footer.jsp" />