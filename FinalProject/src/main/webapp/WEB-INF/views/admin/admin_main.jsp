<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>망고 관리자: 메인</title>
<link rel="stylesheet" type="text/css" href="./css/admin/admin.css" />
</head>
<body>
   <div id="aMain_wrap">
      <%--관리자 메인 상단 --%>
      <div id="aMain_header">
         <%--관리자 로고 --%>
         <div id="aMain_logo">
            <a href="adminindex">Mango</a>
         </div>
         <%--관리자 상단메뉴 --%>
         <div id="aMain_menu">
            <ul>
               <li><a href="admin_notice">공지사항</a></li>
               <li><a href="admin_userbbs_list">상품문의</a></li>
               <li><a href="admin_product_category">상품등록</a></li>
               <li><a href="memberlist">회원관리</a></li>
            </ul>
         </div>
         <%--관리자 메인 우측메뉴 --%>
         <div id="aMain_right">
            <form method="post" action="adminlogout">
               <input type="submit" value="로그아웃" />
               <h3 class="aRight_title">
<%--                  ${admin_name}로 접속했습니다.--%>
               </h3>
            </form>
         </div>
      </div>

      <div class="clear"></div>

      <%--관리자 메인 본문 --%>
      <div id="aMain_cont">
         <h2 class="aMainCont_title"></h2>
      </div>

      <div class="clear"></div>

   </div>
</body>
</html>