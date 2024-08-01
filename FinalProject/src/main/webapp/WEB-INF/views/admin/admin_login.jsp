<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>망고 관리자: 로그인</title>
    <link rel="stylesheet" type="text/css" href="./css/join/login.css">
    <link rel="stylesheet" type="text/css" href="./css/include/header.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        function admin_check() {
            $adminid = $.trim($('#adminid').val());
            if ($adminid.length == 0) {
                alert('관리자 아이디를 입력하세요!');
                $('#adminid').val('').focus();
                return false;
            }

            $adminpwd = $.trim($('#adminpwd').val());
            if ($adminpwd == '') {
                alert('관리자 비번을 입력하세요!');
                $('#adminpwd').val('').focus();
                return false;
            }
        }
    </script>
    <style>
        .LoginMain {
            width: 15%;
        }
    </style>
</head>
<div class="LoginContainer">
    <div class="MainLogo">
        <%-- 로고 --%>
        <a href="#"><strong>Mango</strong></a>
    </div>
    <div class="LoginMain">
        <div class="Login"><h2>관리자 로그인</h2></div>
        <%-- 로그인 창 --%>
        <form action="admin_login_ok" method="POST" onsubmit="return admin_check();">
            <div class="LoginGroup">
                <label for="adminid"><b>아이디</b></label>
                <input type="text" id="adminid" name="adminid" tabindex="1" placeholder="아이디를 입력해 주세요" colspan="30"/>
            </div>
            <div class="LoginGroup">
                <label for="adminpwd"><b>비밀번호</b></label>
                <input type="password" id="adminpwd" name="adminpwd" tabindex="2" placeholder="비밀번호를 입력해 주세요"/>
            </div>
            <input type="submit" class="LoginBtn" value="로그인"/>
        </form>
    </div>
</div>










