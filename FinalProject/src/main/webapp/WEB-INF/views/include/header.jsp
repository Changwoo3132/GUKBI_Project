<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/064567d6a5.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
<link rel="stylesheet" type="text/css" href="../css/include/header.css" />
<link rel="stylesheet" type="text/css" href="../css/include/footer.css" />
<title></title>
</head>
<body>
<%-- header 부분 --%>
<header>
	<div>
		<ul class="CartLeft">
			<%-- 카테고리 --%>
			<li class="cart">
				<div class="CartBtn">
					<a href="#"><button id="cartbtn"><i class="fa-solid fa-list"></i></button></a>
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
							<a href="Basket">장바구니</a>&nbsp;&nbsp;
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
							<a href="#"><button id="btn"><i class="fa-solid fa-magnifying-glass"></i></button></a>
						</div>
					</li>
					<div id="search-bg"><input type="search" placeholder="search"></div>
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