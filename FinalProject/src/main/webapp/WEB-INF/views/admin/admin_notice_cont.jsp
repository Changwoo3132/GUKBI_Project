<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/admin_header.jsp" %>
<link rel="stylesheet" type="text/css" href="../css/admin/admin.css" />






<div id="aMain_cont">
 <div id="aBc_wrap">
  <h2 class="aBc_title">관리자 공지내용</h2>
  <table id="aBc_t">
  <tr>
    <th>공지제목</th> <td>${n.notice_title}</td>
  </tr>
  <tr>
   <th>공지내용</th> <td>${n_cont}</td>
  </tr>  

  </table>
  <div id="aBc_menu">
   <input type="button" value="공지목록" onclick="location='admin_notice?page=${page}';" >
  </div>
 </div>
</div>


