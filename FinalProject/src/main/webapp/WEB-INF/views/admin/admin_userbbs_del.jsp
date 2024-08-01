<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자료실 삭제</title>
    <link rel="stylesheet" type="text/css" href="./css/bbs.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div id="bsDel_wrap">
    <h2 class="bsDel_title">자료실 삭제</h2>
    <form method="post" action="bbs_del_ok" onsubmit="return del_check();">
        <input type="hidden" name="bbs_no" value="${b.bbs_no}">
        <input type="hidden" name="page" value="${page}">
        <table id="bsDel_t">
             <tr>
            <th>제목</th>
            <td>${b.bbs_title}</td>
        </tr>
        <tr>
            <th>글내용</th>
            <td>${bbs_cont}</td>
        </tr>
        </table>
        <div id="bsDel_menu">
            <input type="submit" value="삭제">
            <input type="reset" value="취소" onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=cont';">
        </div>
    </form>
</div>
</body>
</html>