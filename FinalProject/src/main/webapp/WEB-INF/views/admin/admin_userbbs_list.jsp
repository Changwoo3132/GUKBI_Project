<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/admin_header.jsp"/>
<link rel="stylesheet" type="text/css" href="../css/admin/bbslist.css">
<%-- ../는 한단계 상위폴더로 이동하라는 상대경로.  ./는 현재경로. ../../ 두단계 상위폴더로 이동 --%>

<%--관리자 메인 본문 --%>
<div id="aMain_cont">
    <form method="get" action="admin_userbbs_list">
        <div id="bList_wrap">
            <h2 class="bList_title">관리자 상품문의</h2>
            <div class="bList_count">글개수: ${totalCount} 개</div>
            <table id="bList_t">
                <tr>
                    <th width="6%" height="26">번호</th>
                    <th width="*">제목</th>
                    <th width="18%">작성일</th>
                    <th width="18%">수정/삭제</th>
                </tr>
                <tbody>
                    <c:if test="${!empty blist}">
                        <!-- 내림차순 글번호를 설정하기 위한 초기 변수 -->
                        <c:set var="seq_no" value="${startNumber}"/>

                        <c:forEach var="b" items="${blist}">
                            <!-- 원본글만 표시 -->
                            <c:if test="${b.bbs_step == 0}">
                                <tr>
                                    <td align="center">${seq_no}</td>
                                    <td class="left-align" style="padding-left: 50px;">
                                        <a href="bbs_cont?bbs_no=${b.bbs_no}&state=cont&page=${page}">
                                            ${b.bbs_title}
                                        </a>
                                    </td>
                                    <td align="center">${fn:substring(b.bbs_date, 0, 10)}</td>
                                    <td align="center" style="padding-left: 20px;">
                                        <input type="button" value="수정" onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=edit';"/>
                                        <button type="button" onclick="deletePost(${b.bbs_no}, ${page})">삭제</button>
                                    </td>
                                </tr>
                                <c:set var="seq_no" value="${seq_no - 1}"/>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty blist}">
                        <tr>
                            <th colspan="4" align="center">자료실 목록이 없습니다.</th>
                        </tr>
                    </c:if>
                </tbody>
            </table>

            <c:if test="${empty blist}">
                <tr>
                    <th colspan="5">목록이 없습니다!</th>
                </tr>
            </c:if>
        </div>
    </form>

    <!-- 페이징 -->
    <div id="bList_paging">
        <c:if test="${(empty find_field) && (empty find_name)}">
            <c:if test="${page <= 1}">[이전]&nbsp;</c:if>
            <c:if test="${page > 1}">
                <a href="admin_userbbs_list?page=${page - 1}">[이전]</a>&nbsp;
            </c:if>
            <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                <c:if test="${a == page}"><${a}></c:if>
                <c:if test="${a != page}">
                    <a href="admin_userbbs_list?page=${a}">[${a}]</a>&nbsp;
                </c:if>
            </c:forEach>
            <c:if test="${page >= maxpage}">[다음]</c:if>
            <c:if test="${page < maxpage}">
                <a href="admin_userbbs_list?page=${page + 1}">[다음]</a>
            </c:if>
        </c:if>

        <c:if test="${(!empty find_field) || (!empty find_name)}">
            <c:if test="${page <= 1}">[이전]&nbsp;</c:if>
            <c:if test="${page > 1}">
                <a href="admin_userbbs_list?page=${page - 1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
            </c:if>
            <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                <c:if test="${a == page}"><${a}></c:if>
                <c:if test="${a != page}">
                    <a href="admin_userbbs_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
                </c:if>
            </c:forEach>
            <c:if test="${page >= maxpage}">[다음]</c:if>
            <c:if test="${page < maxpage}">
                <a href="admin_userbbs_list?page=${page + 1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
            </c:if>
        </c:if>
    </div>

    <div id="bList_menu">
        <input type="button" value="작성하기" onclick="location='userbbs_write?page=${page}';"/>
        <c:if test="${(!empty find_field) && (!empty find_name)}">
            <input type="button" value="전체목록" onclick="location='admin_userbbs_list?page=${page}';"/>
        </c:if>
    </div>

    <!-- 검색 폼 추가 -->
    <div id="bFind_wrap">
        <form method="get" action="admin_userbbs_list">
            <select name="find_field">
                <option value="bbs_title" <c:if test="${find_field == 'bbs_title'}">selected</c:if>>제목</option>
                <option value="bbs_cont" <c:if test="${find_field == 'bbs_cont'}">selected</c:if>>내용</option>
            </select>
            <input name="find_name" id="find_name" size="14" value="${find_name}"/>
            <input type="submit" value="검색"/>
        </form>
    </div>
</div>

<script>
    function deletePost(bbsNo, page) {
        if (confirm('정말 삭제하시겠습니까?')) {
            const form = document.createElement('form');
            form.method = 'post';
            form.action = 'admin_userbbs_del_ok';
            
            const bbsNoInput = document.createElement('input');
            bbsNoInput.type = 'hidden';
            bbsNoInput.name = 'bbs_no';
            bbsNoInput.value = bbsNo;
            form.appendChild(bbsNoInput);
            
            const pageInput = document.createElement('input');
            pageInput.type = 'hidden';
            pageInput.name = 'page';
            pageInput.value = page;
            form.appendChild(pageInput);

            document.body.appendChild(form);
            form.submit();
        }
    }
</script>
