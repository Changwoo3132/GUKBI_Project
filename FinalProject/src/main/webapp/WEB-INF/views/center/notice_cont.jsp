<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 공지내용</title>
    <link rel="stylesheet" type="text/css" href="../css/gongji.css">
</head>
<body>
<div id="gCont_wrap">
    <h2 class="gCont_title">공지내용</h2>
    <table id="gCont_t">
        <tr>
            <th>제목</th>
            <td>${n.notice_title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${n_cont}</td>
        </tr>
    </table>
    <div id="gCont_menu">
        <input type="button" value="공지목록" onclick="location='/notice';">
    </div>
</div>
</body>
</html>
