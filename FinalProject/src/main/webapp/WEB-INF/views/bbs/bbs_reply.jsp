<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 자료실 답변폼</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/admin/bbsreply.css">
</head>
<body>
<div id="bsW_wrap">
    <h2 class="bsW_title">자료실 답변</h2>
    <form method="post" action="bbs_reply_ok" onsubmit="return write_check();">
        <%-- 답변글 히든값 --%>
        <input type="hidden" name="bbs_ref" value="${b.bbs_ref}">
        <%-- 원본글과 답변글을 묶어주는 글 그룹번호, hidden은 브라우저 출력창에서는 만들어 지지 않는다. 하지만 페이지 소스보기에서는 노출된다. 그러므로 보안상 중요한 데이터는
        히든으로 전달하는 것이 아니다. --%>

        <input type="hidden" name="bbs_step" value="${b.bbs_step}">
        <%--원본글과 답변글을 구분하는 번호값이면서 몇번쨰 답변글 인가를 알려준다. --%>
        <input type="hidden" name="bbs_level" value="${b.bbs_level}">
        <%--답변글 정렬순서 --%>

        <%--  페이징에서 책갈피 기능 페이지 번호 히든값 --%>
        <input type="hidden" name="page" value="${page}">

        <table id="bsW_t">
            <tr>
                <th>글제목</th>
                <td><input name="bbs_title" id="bbs_title" size="33" value="Re:${b.bbs_title}"></td>
            </tr>
            <tr>
                <th>글내용</th>
                <td><textarea name="bbs_cont" id="bbs_cont" rows="8" cols="34"></textarea></td>
            </tr>
        </table>
        <div id="bsW_menu">
            <input type="submit" value="답변">
            <input type="reset" value="취소" onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=cont';">
            <input type="button" value="목록" onclick="location='askcenter?page=${page}';">
        </div>
    </form>
</div>
</body>
</html>