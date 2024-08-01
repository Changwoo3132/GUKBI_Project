<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/admin_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="./css/admin/admin.css"/>
<style>
    #aMain_cont{
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
    }
    #aMem_wrap{
        margin-left: 5px;
    }
</style>
<div id="aMain_cont">
    <div id="aMem_wrap">
        <h2 class="aMem_title">관리자 회원정보</h2>
        <table id="aMem_t">
            <tr>
                <th>회원아이디</th>
                <td>${m.mid}</td>
            </tr>
            <tr>
                <th>회원이름</th>
                <td>${m.mname}</td>
            </tr>

            <tr>
                <th>휴대폰</th>
                <td>${m.mphone}</td>
            </tr>
            <tr>
                <th>전자우편</th>
                <td>${m.memail}</td>
            </tr>
            <tr>
                <th>가입회원/탈퇴회원</th>
                <td>
                    <c:if test="${m.mstate == 1}">가입회원</c:if>
                    <c:if test="${m.mstate == 2}">탈퇴회원</c:if>
                </td>
            </tr>
            <tr>
                <th>가입날짜</th>
                <td>${m.mdate}</td>
            </tr>
        </table>
        <div id="aMem_menu">
            <input type="button" value="회원목록" onclick="location='memberlist?page=${page}';"/>
        </div>
    </div>
</div>