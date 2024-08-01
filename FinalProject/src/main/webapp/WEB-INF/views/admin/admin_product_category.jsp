<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<%@ include file="../include/admin_header.jsp"%>

<%-- ../는 한단계 상위폴더로 이동하라는 상대경로.
     ./는 현재경로. ../../ 두단계 상위폴더로 이동 --%>
     <style>
     #aMain_cont {
    width: 80%;
    margin: 20px auto;
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .bList_title {
    font-size: 24px;
    margin-bottom: 20px;
    color: #333;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background-color: black;
    color: #fff;
    padding: 10px;
   
}

th a {
    color: #fff;
    text-decoration: none;
}

th a:hover {
    text-decoration: underline;
}

th:not(:last-child) {
    border-right: 1px solid #fff;
}
    

     
     
     
     </style>

<%--관리자 상품 목록 --%>
<div id="aMain_cont">
	<form method="get">
		<div id="bList_wrap">
			<h2 class="bList_title">관리자 상품등록 목록</h2>
			<table>
				<tr>
					<th><a href="/admin_product_list?category=top&page=${page}">상의</a></th>
					<th><a href="/admin_product_list?category=bottom&page=${page}">하의</a></th>
					<th><a href="/admin_product_list?category=outer&page=${page}">아우터</a></th>
					<th><a href="/admin_product_list?category=shoes&page=${page}">신발</a></th>
				</tr>
			</table>
		</div>
	</form>
</div>

