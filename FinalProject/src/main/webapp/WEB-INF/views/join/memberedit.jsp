<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>정보수정</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="./css/join/mypage.css">
    <script type="text/javascript" src="./js/member.js"></script>
</head>
<style>
    body {
        padding: 0;
        margin: 0;
    }

    @font-face {
        font-family: 'MoveSans-Bold';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-2@1.0/MoveSans-Bold.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }

    .MainLogo {
        font-family: 'MoveSans-Bold';
        text-align: center;
        padding: 20px;
        margin-bottom: 10px;
    }

    .MainLogo > a {
        text-decoration: none;
    }

    .MainLogo > a > strong {
        color: black;
        font-size: 20px;
    }

    button[type=submit] {
        margin-top: 80px;
        float: right;
    }

    .editwrap {
        margin-left: 5px;
    }

    .editwrap > h3 {
        margin-left: 5px;
    }

    .form-group {
        padding-left: 10px;
        padding-top: 5px;
        border-bottom: 1px solid gray;
    }
</style>
<body>
<form method="post" action="membereditok">
    <div class="MainLogo">
        <%-- 로고 --%>
        <a href="#"><strong>Mango</strong></a>
    </div>
    <div class="editwrap">
        <h3>내 정보</h3>
        <div class="form-group">
            <label for="mid">아이디:</label>
            <input type="text" id="mid" name="mid" value="${id}" readonly>
        </div>
        <div class="form-group">
            <label for="mname">사용자명:</label>
            <input type="text" id="mname" name="mname" value="${m.mname}" tabindex="1">
        </div>
        <div class="form-group">
            <label for="memail">이메일:</label>
            <input type="email" id="memail" name="memail" value="${m.memail}" tabindex="2">
        </div>
        <div class="form-group">
            <label for="mphone">전화번호:</label>
            <input type="tel" id="mphone" name="mphone" value="${m.mphone}" tabindex="3">
        </div>

        <h3>배송지 정보</h3>
        <div class="form-group">
            <label for="addrcode">우편번호:</label>
            <input type="text" id="addrcode" name="addrcode" value="${m.addrcode}"readonly>
            <button type="button" onclick="execDaumPostcode()">우편번호 찾기</button>
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
    </div>
</form>
</body>
</html>
