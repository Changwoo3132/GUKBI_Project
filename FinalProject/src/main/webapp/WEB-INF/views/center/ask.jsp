<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="./css/center/ask.css">
<title>망고: 문의센터</title>
<div class="inquiry-board">
	<div class="QuestionLeftMenu">
		<ul>
			<li><a href="question">자주하는 질문</a></li>
			<li><a href="askcenter">고객센터</a></li>
			<li><a href="notice">공지사항</a></li>
		</ul>
	</div>
	<h2>Customer Service</h2>
	<table class="table_basic">
		<colgroup>
			<col width="8%">
			<col width="*">
			<col width="15%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">내용</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/15170?page=1">배송 </a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>2</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/14830?page=1"> 배송</a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>3</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/14497?page=1">배송</a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>4</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/14432?page=1"> 배송 안내(3/28~)</a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>5</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/13590?page=1">배송</a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>6</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/13327?page=1">배송</a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>7</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/13288?page=1">배송</a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>8</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/13247?page=1">배송 </a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>9</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/13173?page=1"> 배송</a></td>
				<td>2024-05-29</td>
			</tr>
			<tr>
				<td>10</td>
				<td class="tit_contents_td">
					<a href="/app/cs/notice_view/12748?page=1">배송</a></td>
				<td>2024-05-29</td>
			</tr>
		</tbody>
	</table>
	<div class="form-actions">
		<button type="submit" onclick="location='AskWrite';">작성하기</button>
	</div>
</div>
<jsp:include page="../include/footer.jsp" />