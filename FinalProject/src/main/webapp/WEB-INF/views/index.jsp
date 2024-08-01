<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/064567d6a5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="./js/index.js"></script>
    <link rel="stylesheet" type="text/css" href="./css/include/header.css">
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <link rel="stylesheet" type="text/css" href="./css/include/footer.css">
    <title>망고샵</title>
</head>
<body>
<input type="hidden" name="mid" value="${m.mid}">
<%-- header 부분 --%>
<header>
    <div>
        <ul class="CartLeft">
            <%-- 카테고리 --%>
            <li class="cart">
                <div class="CartBtn">
                    <a href="#">
                        <button id="cartbtn"><i class="fa-solid fa-list"></i></button>
                    </a>
                </div>
            </li>
            <div id="cart-bg">
                <div class="HeaderCart">
                    <h3><strong>카테고리</strong></h3>
                    <ul class="HCartList">
                        <li class="HeaderItem">
                            <a href="product?category=top">상의</a>&nbsp;&nbsp;
                            <a href="product?category=bottom">하의</a>&nbsp;&nbsp;
                            <a href="product?category=outer">아우터</a>&nbsp;&nbsp;
                            <a href="product?category=shoes">신발</a>
                        </li>
                    </ul>
                </div>
                <div class="HeaderCart">
                    <h3>계정</h3>
                    <ul class="HCartList">
                        <li class="HeaderItem">
                            <a href="login">내 정보</a>&nbsp;&nbsp;
                            <a href="basket">장바구니</a>&nbsp;&nbsp;
                            <a href="#">주문확인</a>
                        </li>
                    </ul>
                </div>
                <div class="HeaderCart">
                    <h3>고객센터</h3>
                    <ul class="HCartList">
                        <li class="HeaderItem">
                            <a href="question">자주 묻는 질문</a>&nbsp;&nbsp;
                            <a href="askcenter">상품 문의</a>&nbsp;&nbsp;
                            <a href="notice">공지사항</a>
                        </li>
                    </ul>
                </div>
            </div>
        </ul>
    </div>
    <div class="MainLogo">
        <%-- 로고 --%>
        <a href="index"><strong>Mango</strong></a>
    </div>
    <div>
        <nav class="cartrightnav">
            <ul class="CartRight">
                <%-- 검색 --%>
                <li>
                    <div class="SearchBtn">
                        <a href="#">
                            <button id="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </a>
                    </div>
                </li>
                <div id="search-bg">
                    <input type="search" placeholder="search">
                </div>
                <%-- 로그인 --%>
                <li><a href="login"><i class="fa-solid fa-user"></i></a></li>
                <%-- 찜 목록 --%>
                <li><a href="#"><i class="fa-solid fa-heart"></i></a></li>
                <%-- 장바구니 --%>
                <li><a href="basket"><i class="fa-solid fa-basket-shopping"></i></a></li>
            </ul>
        </nav>
    </div>
</header>

<%-- main 부분 --%>
<main>
    <div class="wrapper">
        <%-- 이미지 슬라이드 컨테이너 --%>
        <div class="sliderContainer">
            <%-- 이미지 슬라이드 목록 --%>
            <div class="slider">
                <div class="imgSlide"><img src="./images/main/main14.jpg" alt="메인 이미지"></div>
                <div class="imgSlide"><img src="./images/main/main13.jpg" alt="메인 이미지"></div>
                <div class="imgSlide"><img src="./images/main/main12.jpg" alt="메인 이미지"></div>
            </div>
        </div>
        <%-- 이전, 다음 버튼 --%>
        <a class="prev" style="text-decoration: none;"><i class="fas fa-xl fa-chevron-left"></i></a>
        <a class="next" style="text-decoration: none;"><i class="fas fa-xl fa-chevron-right"></i></a>
    </div>
    <%-- 상품 목록 추가 --%>
    <div class="product">
        <%-- 신규 상품 목록 추가 --%>
        <fieldset>
            <legend>
                <strong></strong>
            </legend>
            <ul>
                <li><img src="./images/main/main115.gif" alt="상품 2"/></li>
            </ul>
        </fieldset>
        <%-- 신규 상품 목록 추가 --%>
        <fieldset>
            <legend>
                <strong></strong>
            </legend>
            <ul>
                <li><img src="./images/main/main114.gif" alt="상품 2"/></li>
            </ul>
        </fieldset>

        <fieldset>
            <legend>
                <strong></strong>
            </legend>
            <ul>
                <li><img src="./images/main/main113.gif" alt="상품 2"/></li>
            </ul>
        </fieldset>
    </div>
</main>
<%-- footer 부분 --%>
<footer class="FooterContainer" style="white-space:nowrap;">
    <div class="FooterTop">
        <div class="FooterCart">
            <h3>카테고리</h3>
            <ul class="FCartList">
                <li class="FooterItem">
                    <a href="product?category=top">상의</a>&nbsp;&nbsp;
                    <a href="product?category=bottom">하의</a>&nbsp;&nbsp;
                    <a href="product?category=outer">아우터</a>&nbsp;&nbsp;
                    <a href="product?category=shoes">신발</a>
                </li>
            </ul>
        </div>
        <div class="FooterCart">
            <h3>계정</h3>
            <ul class="FCartList">
                <li class="FooterItem">
                    <a href="login">내 정보</a>&nbsp;&nbsp;
                    <a href="basket">장바구니</a>&nbsp;&nbsp;
                    <a href="#">주문확인</a>
                </li>
            </ul>
        </div>
        <div class="FooterCart">
            <h3>고객센터</h3>
            <ul class="FCartList">
                <li class="FooterItem">
                    <a href="question">자주 묻는 질문</a>&nbsp;&nbsp;
                    <a href="askcenter">고객센터</a>&nbsp;&nbsp;
                    <a href="notice">공지사항</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="CopyRight">
        <p>Copyright © MANGO Corp. All Rights Reserved.</p>
        <p><small>프로젝트 인원 : 김동훈, 김창우, 성유철, 이정균</small></p>
    </div>
</footer>
</body>
</html>