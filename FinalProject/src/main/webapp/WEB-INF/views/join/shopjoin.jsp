<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://kit.fontawesome.com/064567d6a5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/join/join.css">
    <link rel="stylesheet" type="text/css" href="./css/include/header.css"/>
    <script type="text/javascript" src="./js/member.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>망고: 회원가입</title>
</head>
<body>
<%-- header 부분 --%>
<header style="border-bottom: none;">
    <div class="MainLogo">
        <%-- 로고 --%>
        <a href="index"><strong>Mango</strong></a>
    </div>
</header>
<form name="s" method="post" action="resgisterok" onsubmit="return joinCheck();">
    <div class="JoinContainer">
        <div class="MemberJoin">
            <%-- 필드 --%>
            <%-- 아이디 --%>
            <div class="JoinField">
                <b>아이디</b>
                <span class="UserID"><input placeholder="아이디" name="mid" id="mid"></span>
            </div>
            <%-- 비밀번호 --%>
            <div class="JoinField">
                <b>비밀번호</b>
                <input class="UserPwd" type="password" placeholder="비밀번호" name="mpwd" id="mpwd">
            </div>
            <div class="JoinField">
                <b>비밀번호 확인</b>
                <input class="UserPwdCheck" type="password" placeholder="비밀번호 확인" name="mpwdC" id="mpwdC">
            </div>
            <%-- 이메일 --%>
            <div class="JoinField">
                <b>본인 확인 이메일</b>
                <input type="email" name="memail" id="memail" placeholder="이메일">
            </div>
            <%-- 이름 --%>
            <div class="JoinField">
                <b>이름</b>
                <input type="text" placeholder="이름" name="mname" id="mname">
            </div>
            <%-- 생년월일 --%>
            <div class="FieldBirth" style="float: left;">
                <b>생년월일</b>
                <div><input type="text" placeholder="생년월일 8자리" name="mday" id="mday"></div>
            </div>
            <%-- 전화번호 --%>
            <div class="FieldTel">
                <b>휴대전화</b>
                <div><input type="tel" name="mphone" id="mphone" placeholder="휴대전화 번호"></div>
            </div>
            <div class="JoinField">
                <button type="button" onclick="execDaumPostcode();" style="float: right">우편번호 찾기</button>
                <b>우편번호</b>
                <input type="text" id="addrcode" name="addrcode" placeholder="우편번호" readonly>
            </div>
            <div class="JoinField">
                <b>주소</b>
                <input type="text" id="myaddr" name="myaddr" placeholder="주소" readonly>
            </div>
            <div class="JoinField" style="float: left; width: 240px;" >
                <input type="text" id="myaddr2" name="myaddr2" placeholder="상세 주소">
            </div>
            <%-- 가입하기 --%>
            <input type="submit" class="JoinCheck" value="가입하기">
        </div>
    </div>
</form>

</body>
</html>
