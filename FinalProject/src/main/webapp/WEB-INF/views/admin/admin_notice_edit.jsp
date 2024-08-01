<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/admin_header.jsp"/>
<link rel="stylesheet" type="text/css" href="./css/admin/admin.css" />
<%--관리자 메인본문 --%>
<div id="aMain_cont">
    <div id="aBw_wrap">
        <h2 class="aBw_title">관리자 공지수정</h2>
        <form method="post" action="notice_edit_ok?no=${n.notice_no}&page=${page}" onsubmit="return gw_check();">
            <%-- ?no=번호값&page=쪽번호 2개 피라미터 값은 get방식으로 전달되고 나머지는 post로 전달된다. --%>
            <table id="aBw_t">
                <tr>
                    <th>공지작성자</th>
                    <td><input name="notice_name" id="notice_name" size="14" value="${n.notice_name}"></td>
                </tr>
                <tr>
                    <th>공지제목</th>
                    <td><input name="notice_title" id="notice_title" size="34" value="${n.notice_title}"></td>
                </tr>
                <tr>
                    <th>공지내용</th>
                    <td><textarea name="notice_cont" id="notice_cont" rows="9"
                                  cols="36">${n.notice_cont}</textarea></td>
                </tr>
            </table>
            <div id="aBw_menu">
                <input type="submit" value="수정"/>
                <input type="reset" value="취소" onclick="$('#notice_name').focus();">
                <input type="button" value="공지목록" onclick="location='admin_notice?page=${page}';">
            </div>
        </form>
    </div>
</div>
