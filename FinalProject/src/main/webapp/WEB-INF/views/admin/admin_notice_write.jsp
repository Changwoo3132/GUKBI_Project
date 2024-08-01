<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/admin_header.jsp"%>
<title>망고 관리자: 공지사항 작성</title>
<link rel="stylesheet" type="text/css" href="./css/admin/admin.css" />
<div id="aMain_cont">
    <div id="bWrite_wrap">
        <h2 class="bWrite_title">공지 사항</h2>
        <form method="post" action="notice_write_ok">
            <table id="bWrite_t">
                <tr>
                    <th>작성자</th>
                    <td><input type="text" name="notice_name" size="30" maxlength="50" required ></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="notice_title" size="50" maxlength="100" required /></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="notice_cont" cols="60" rows="10" required></textarea></td>
                </tr>

            </table>
            <div id="bWrite_menu">
                <button type="submit">저장</button>
                <button type="button" onclick="location='admin_notice'">목록</button>
            </div>
        </form>
    </div>
</div>