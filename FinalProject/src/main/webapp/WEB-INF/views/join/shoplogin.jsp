<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script src="https://kit.fontawesome.com/064567d6a5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="./js/member.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/join/login.css"/>
    <link rel="stylesheet" type="text/css" href="./css/include/header.css"/>
</head>
<body>
<%-- 로그인 전 페이지 --%>
<c:if test="${empty id}">
    <title>망고: 로그인</title>
    <%-- header 부분 --%>
    <header style="border-bottom: none;">
        <div class="MainLogo">
                <%-- 로고 --%>
            <a onclick="location='index';"><strong>Mango</strong></a>
        </div>
    </header>
    <div class="LoginContainer">
        <div class="LoginMain">
            <div class="Login"><h2>로그인</h2></div>
                <%-- 로그인 창 --%>
            <form action="loginok" method="POST" onsubmit="return login_check();">
                <div class="LoginGroup">
                    <label for="mid"><b>아이디</b></label>
                    <input type="text" id="mid" name="mid" tabindex="1" placeholder="아이디를 입력해 주세요"/>
                </div>
                <div class="LoginGroup">
                    <label for="mpwd"><b>비밀번호</b></label>
                    <input type="password" id="mpwd" name="mpwd" tabindex="2" placeholder="비밀번호를 입력해 주세요"/>
                </div>
                <input type="submit" class="LoginBtn" value="로그인"/>
                <div class="LoginOption">
                    <a href="#">아이디 찾기</a>
                    <a href="#">비밀번호 찾기</a>
                    <a href="register">회원가입</a>
                </div>
            </form>
            <br>
        </div>
        <p style="text-align: center">Copyright © MANGO Corp. All Rights Reserved.</p>
    </div>
</c:if>
<c:if test="${!empty id}">
    <jsp:include page="../include/header.jsp"/>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>망고: 내 정보</title>
    <link rel="stylesheet" href="./css/join/mypage.css">
    <div class="mypageWrap">
        <div>
            <input class="Logout" type="button" value="로그아웃" onclick="location='logout';">
        </div>
        <div class="section">
            <h2>내 정보</h2>
            <form method="get" onsubmit="return member_edit();">
                <div class="form-group">
                    <label for="mid">아이디:</label>
                    <input type="text" id="mid" name="mid" value="${id}" readonly>
                </div>
                <div class="form-group">
                    <label for="mname">사용자명:</label>
                    <input type="text" id="mname" name="mname" value="${m.mname}" readonly>
                </div>
                <div class="form-group">
                    <label for="memail">이메일:</label>
                    <input type="email" id="memail" name="memail" value="${m.memail}" readonly>
                </div>
                <div class="form-group">
                    <label for="mphone">전화번호:</label>
                    <input type="tel" id="mphone" name="mphone" value="${m.mphone}" readonly>
                </div>
                <h2>배송지 정보</h2>
                <div class="form-group">
                    <label for="addrcode">우편번호:</label>
                    <input type="text" id="addrcode" name="addrcode" value="${m.addrcode}" readonly>
                </div>
                <div class="form-group">
                    <label for="myaddr">주소:</label>
                    <input type="text" id="myaddr" name="myaddr" value="${m.myaddr}" readonly>
                </div>
                <div class="form-group">
                    <label for="myaddr2">상세주소:</label>
                    <input type="text" id="myaddr2" name="myaddr2" value="${m.myaddr2}">
                </div>
                <button type="submit">정보 수정</button>
            </form>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp"/>
</c:if>