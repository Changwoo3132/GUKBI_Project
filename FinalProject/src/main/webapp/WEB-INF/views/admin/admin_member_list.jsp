<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" type="text/css" href="./css/admin/admin.css"/>
<link rel="stylesheet" type="text/css" href="../css/admin/bbslist.css">
<%@ include file="../include/admin_header.jsp" %>
<title>망고 관리자: 회원 정보</title>
<style>
    <%--    #bFind_wrap {--%>
    <%--        display: flex;--%>
    <%--        flex-wrap: nowrap;--%>
    <%--        flex-direction: row;--%>
    <%--        justify-content: flex-end;--%>
    <%--    }--%>
    <%--    #bList_paging{--%>
    <%--        padding-bottom: 5px;--%>
    <%--    }--%>
    #aMain_cont {
        margin-right: auto;
        margin-left: auto;
        /* display: flex; */
        justify-content: center;
        align-items: center;
        width: 95%;
        height: 780px;
        border: 1px solid #d1d1d1;
        border-radius: 15px;
        /* margin: 10px 0 0 0;*/

    }

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

    <%--    tr{--%>
    <%--        display: flex;--%>
    <%--    }--%>

    <%--    td{--%>
    <%--        flex: 1;--%>
    <%--        padding: 5px 0;--%>
    <%--    }--%>

    <%--    #bList_t > thead > tr > th {--%>
    <%--        padding: 0 20px;--%>
    <%--        height: 0;--%>
    <%--        flex: 1;--%>
    <%--    }--%>

    <%--    tbody{--%>
    <%--        margin-top: 30px;--%>
    <%--        display: flex;--%>
    <%--        flex-direction: column;--%>
    <%--        flex-wrap: wrap;--%>
    <%--    }--%>

    <%--    .paging_wrap{--%>
    <%--        display: flex;--%>
    <%--        flex-direction: column;--%>
    <%--        align-items: center;--%>
    <%--    }--%>

</style>
<div id="aMain_cont">
    <form method="get" action="memberlist">
        <div id="bList_wrap">
            <h2 class="bList_title">회원 관리</h2>
            <div class="bList_count">회원수: ${memberCount} 명</div>
            <table id="bList_t">
                <thead>
                <tr>
                    <th style="width: 20%" height="26">회원 아이디</th>
                    <th style="width:16%">회원 이름</th>
                    <th style="width:20%">핸드폰 번호</th>
                    <th>가입 날짜</th>
                    <th style="width:14%">가입 / 탈퇴</th>
                    <th style="width:5%">삭제 여부</th>
                </tr>
                </thead>
                <c:if test="${!empty mlist}">
                    <c:forEach var="m" items="${mlist}">
                        <tr>
                            <td align="center"><a href="memberinfo?mid=${m.mid}&page=${page}&state=info">${m.mid}</a>
                            </td> <!-- 수정: m_id -->
                            <td align="center">${m.mname}</td>
                            <!-- 수정: m_id, m_name -->
                            <td align="center">${m.mphone}</td> <!-- 수정: m_phone -->
                            <td align="center">${m.mdate}</td>
                            <td align="center">
                                <c:if test="${m.mstate == 1}">가입 회원</c:if> <!-- 수정: m_state -->
                                <c:if test="${m.mstate == 2}">탈퇴 회원</c:if>
                            </td>
                            <td align="center">
                                <input type="button" value="삭제"
                                       onclick="if(confirm('정말로 삭제할까요?') == true){ location='memberdel?mid=${m.mid}&page=${page}'; } else { return ; }"/>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty mlist}">
                    <tr>
                        <th colspan="5">회원목록이 없습니다!</th>
                    </tr>
                </c:if>
            </table>
            <div class="paging_wrap">
                <div id="bList_paging">
                    <c:if test="${(empty find_field) && (empty find_name)}">
                        <c:if test="${page<=1}">[이전]&nbsp;</c:if>
                        <c:if test="${page>1}"><a href="memberlist?page=${page-1}">[이전]</a>&nbsp;</c:if>
                        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                            <c:if test="${a == page}">&lt;${a}&gt;</c:if>
                            <c:if test="${a != page}"><a href="memberlist?page=${a}">[${a}]</a>&nbsp;</c:if>
                        </c:forEach>
                        <c:if test="${page >= maxpage}">[다음]</c:if>
                        <c:if test="${page<maxpage}"><a href="memberlist?page=${page+1}">[다음]</a></c:if>
                    </c:if>

                    <c:if test="${(!empty find_field) || (!empty find_name)}">
                        <c:if test="${page<=1}">[이전]&nbsp;</c:if>
                        <c:if test="${page>1}"><a
                                href="memberlist?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;</c:if>
                        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                            <c:if test="${a == page}">&lt;${a}&gt;</c:if>
                            <c:if test="${a != page}"><a
                                    href="memberlist?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;</c:if>
                        </c:forEach>
                        <c:if test="${page >= maxpage}">[다음]</c:if>
                        <c:if test="${page<maxpage}"><a
                                href="memberlist?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a></c:if>
                    </c:if>
                </div>

                <%--                <div id="bList_menu">--%>
                <%--                    <c:if test="${(!empty find_field) && (!empty find_name)}">--%>
                <%--                        <input type="button" value="전체회원" onclick="location='memberlist?page=${page}';"/>--%>
                <%--                    </c:if>--%>
                <%--                </div>--%>
                <div id="bFind_wrap">
                    <select name="find_field" style="width: 75px">
                        <option value="mid" <c:if test="${find_field=='mid'}">${'selected'}</c:if>>아이디</option>
                        <!-- 수정: m_id -->
                        <option value="mname" <c:if test="${find_field=='mname'}">${'selected'}</c:if>>회원이름</option>
                        <!-- 수정: m_name -->
                    </select>
                    <input type="search" name="find_name" id="find_name" size="14" value="${find_name}"/>
                    <input type="submit" value="검색"/>
                </div>
            </div>
        </div>
    </form>
</div>
