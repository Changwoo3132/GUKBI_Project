<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 자료실 수정폼</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<%-- 유효성 검증 javascript & jQuery --%>
<link rel="stylesheet" type="text/css" href="../css/admin/bbsreply.css">
</head>
<body>
   <div id="bsW_wrap">
      <h2 class="bsW_title">자료실 수정</h2>
      <form method="post" action="bbs_edit_ok?bbs_no=${b.bbs_no}" onsubmit="return write_check();" enctype="multipart/form-data">
      
      <%-- 책갈피 기능 쪽번호 히든값 --%>
      <input type="hidden" name="page" value="${page}">
      
         <table id="bsW_t">
           
            <tr>
               <th>글제목</th>
               <td><input name="bbs_title" id="bbs_title" size="33" value="${b.bbs_title}"></td>
            </tr>
           
            <tr>
               <th>글내용</th>
               <td><textarea name="bbs_cont" id="bbs_cont" rows="8" cols="34">${b.bbs_cont}</textarea></td>
            </tr>
            <tr>
               <th>파일첨부</th>
               <td><input type="file" name="uploadFile" ><br>${b.bbs_file}
            </tr>
         </table>
         <div id="bsW_menu">
            <input type="submit" value="수정">
            <input type="reset" value="취소" onclick="$('#bbs_title').focus();">
            <input type="button" value="목록" onclick="location='askcenter?page=${page}';">
         </div>
      </form>
   </div>
</body>
</html>