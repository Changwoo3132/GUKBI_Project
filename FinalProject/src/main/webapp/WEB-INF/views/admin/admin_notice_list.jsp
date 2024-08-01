<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/admin_header.jsp" %>
<title>망고 관리자: 공지사항</title>
<link rel="stylesheet" type="text/css" href="./css/admin/admin.css"/>
<link rel="stylesheet" type="text/css" href="../css/admin/bbslist.css">
<%--<style>--%>

<%--    #bList_menu {--%>
<%--        display: flex;--%>
<%--        justify-content: flex-end;--%>
<%--        padding-right: 5px;--%>
<%--    }--%>

<%--    #bFind_wrap {--%>
<%--        display: flex;--%>
<%--        flex-wrap: nowrap;--%>
<%--        flex-direction: row;--%>
<%--        justify-content: center;--%>
<%--    }--%>

<%--    #bList_paging {--%>
<%--        padding-bottom: 5px;--%>
<%--        display: flex;--%>
<%--        justify-content: center;    }--%>

<%--    #aMain_cont {--%>
<%--        display: block;--%>
<%--        width: 80%;--%>
<%--    margin: 20px auto;--%>
<%--    padding: 20px;--%>
<%--    background-color: #ffffff;--%>
<%--   --%>
<%--    }--%>

<%--    .bList_count {--%>
<%--        float: right;--%>
<%--        margin-right: 10px;--%>
<%--        margin-bottom: 15px;--%>
<%--    }--%>

<%--    .bList_title {--%>
<%--        text-align: center;--%>
<%--    }--%>

<%--    #bList_wrap {--%>
<%--        height: 100%;--%>
<%--    }--%>

<%--    #bList_t {--%>
<%--        margin-top: 45px;--%>
<%--        border-collapse: collapse;--%>
<%--        width: 100%;--%>
<%--        margin-left: auto;--%>
<%--        margin-right: auto;--%>
<%--        height: 79%;--%>
<%--    }--%>

<%--    tr {--%>
<%--        display: flex;--%>
<%--        align-items: center;--%>
<%--    }--%>

<%--    td {--%>
<%--        flex: 1;--%>
<%--        padding: 5px 0;--%>
<%--        text-align: center;--%>
<%--    }--%>

<%--    th {--%>
<%--        flex: 1;--%>
<%--    }--%>

<%--    tbody {--%>
<%--        display: flex;--%>
<%--        flex-direction: column;--%>
<%--        flex-wrap: wrap;--%>
<%--    }--%>
<%--    .paging_wrap{--%>
<%--        display: flex;--%>
<%--        flex-direction: column;--%>
<%--        /*align-items: center;*/--%>
<%--    }--%>
<%--</style>--%>
<div id="aMain_cont">
    <form method="get" action="admin_notice">
        <div id="bList_wrap">
            <h2 class="bList_title">관리자 공지목록</h2>
            <div class="bList_count">글개수: ${listcount} 개</div>
            
            <table id="bList_t" style="height: 79%">
                <tr>
                    <th>번호</th>
                    <th>공지제목</th>
                    <th>글쓴이</th>
                    <th>작성일</th>
                    <th>수정/삭제</th>
                </tr>
                <c:if test="${!empty glist}">
        
                      <!-- 페이지 시작 번호를 계산 -->
            <c:set var="startNumber" value="${listcount - (page - 1) * 10}" />
            <!-- 최신 글이 가장 큰 번호를 가지도록 설정 -->
            <c:set var="seq_no" value="${startNumber}" />

            <c:forEach var="g" items="${glist}">
                        <tr>
                            <td align="center">${seq_no}</td>
                            <td><a href="notice_cont?no=${g.notice_no}&page=${page}&state=cont">
                                <c:if test="${fn:length(g.notice_title) > 16}">
                                    ${fn:substring(g.notice_title, 0, 16)}...
                                </c:if>
                                <c:if test="${fn:length(g.notice_title) <= 16}">
                                    ${g.notice_title}
                                </c:if>
                            </a></td>
                            <td align="center"><c:out value="${g.notice_name}"/></td>
                            <td align="center">${fn:substring(g.notice_date, 0, 10)}</td>
                            <td align="center">
                                <input type="button" value="수정" onclick="location='notice_cont?no=${g.notice_no}&page=${page}&state=edit';"/>
                                <input type="button" value="삭제" onclick="if(confirm('정말로 삭제할까요?')) {location='notice_del_ok?no=${g.notice_no}&page=${page}'; }"/>
                            </td>
                        </tr>
                         <!-- 글 번호를 하나씩 감소, 1 이하로 내려가지 않도록 설정 -->
                <c:set var="seq_no" value="${seq_no - 1}" />
                    </c:forEach>
                </c:if>
                <c:if test="${empty glist}">
                    <tr>
                        <th colspan="6">공지목록이 없습니다!</th>
                    </tr>
                </c:if>
                
            </table>
            <div class="paging_wrap">

                <div id="bList_menu">
                    <button type="button" onclick="location='notice_write?page=${page}';">공지작성</button>
                    <c:if test="${!empty find_field && !empty find_name}">
                        <input type="button" value="전체목록" onclick="location='admin_notice?page=${page}';"/>
                    </c:if>
                </div>

                <%--페이징 즉 쪽나누기 추가 --%>
                <div id="bList_paging">
                    <%-- 검색전 페이징 --%>
                    <c:if test="${(empty find_field) && (empty find_name)}">
                        <c:if test="${page <= 1}">[이전]&nbsp;</c:if>
                        <c:if test="${page > 1}"><a href="admin_notice?page=${page - 1}">[이전]</a>&nbsp;</c:if>

                        <%--현재 쪽번호 출력--%>
                        <c:forEach var="a" begin="1" end="${maxpage}" step="1">
                            <c:if test="${a == page}"><b><${a}></b></c:if>
                            <c:if test="${a != page}"><a href="admin_notice?page=${a}">[${a}]</a>&nbsp;</c:if>
                        </c:forEach>

                        <c:if test="${page >= maxpage}">[다음]</c:if>
                        <c:if test="${page < maxpage}"><a href="admin_notice?page=${page + 1}">[다음]</a></c:if>
                    </c:if>

                    <%-- 검색후 페이징 --%>
                    <c:if test="${(!empty find_field) || (!empty find_name)}">
                        <c:if test="${page <= 1}">[이전]&nbsp;</c:if>
                        <c:if test="${page > 1}"><a
                                href="admin_notice?page=${page - 1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;</c:if>

                        <%--현재 쪽번호 출력--%>
                        <c:forEach var="a" begin="1" end="${maxpage}" step="1">
                            <c:if test="${a == page}"><b><${a}></b></c:if>
                            <c:if test="${a != page}"><a
                                    href="admin_notice?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a>&nbsp;</c:if>
                        </c:forEach>

                        <c:if test="${page >= maxpage}">[다음]</c:if>
                        <c:if test="${page < maxpage}"><a
                                href="admin_notice?page=${page + 1}&find_field=${find_field}&find_name=${find_name}">[다음]</a></c:if>
                    </c:if>
                </div>

                <%--검색 폼추가 --%>
                <div id="bFind_wrap">
                    <select name="find_field">
                        <option value="notice_title" <c:if test="${find_field == 'notice_title'}">selected</c:if>>공지제목
                        </option>
                        <option value="notice_cont" <c:if test="${find_field == 'notice_cont'}">selected</c:if>>공지내용
                        </option>
                    </select>
                    <input type="search" name="find_name" id="find_name" size="14" value="${find_name}"/>
                    <input type="submit" value="검색"/>
                </div>
            </div>
        </div>
    </form>
</div>