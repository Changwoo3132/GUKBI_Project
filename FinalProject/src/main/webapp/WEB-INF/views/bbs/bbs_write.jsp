<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<title>망고: 문의사항</title>
<link rel="stylesheet" href="./css/center/askwrite.css">
<form method="post" action="bbs_write_ok" onsubmit="return write_check();" enctype="multipart/form-data">
    <%-- 자료실 기능을 만들때 필요한 사항
    1. method="post" 방식으로 해야한다. get 은 안된다
    2. form 태그에서 enctype="multipart/form-data" 속성을 지정해야 한다. --%>
    <div class="container">
        <div class="inquiry-popup">
            <div class="writeFormwrap">
                <h2>상품 문의</h2>
                <div class="form-group">
                    <label>문의 유형:</label>
                    <div class="radio-group">
                        <input type="radio" id="size" name="inquiryType" value="size" required>
                        <label for="size">사이즈</label>
                        <input type="radio" id="delivery" name="inquiryType" value="delivery">
                        <label for="delivery">배송</label>
                        <input type="radio" id="restock" name="inquiryType" value="restock">
                        <label for="restock">재입고</label>
                        <input type="radio" id="detail" name="inquiryType" value="detail">
                        <label for="detail">상품상세문의</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="bbs_title" class="inline-label">문의 제목:</label>
                    <input type="text" name="bbs_title" id="bbs_title" maxlength="15" required>

                    <input type="checkbox" id="secret" name="secret">
                    <label for="secret" class="secret-label">비밀글</label>
                </div>
                <div class="form-group">
                    <label for="bbs_cont" class="inline-label">문의 내용:</label>
                    <textarea name="bbs_cont" id="bbs_cont" maxlength="200" required></textarea>
                </div>
                <div class="form-group">
                    <label for="uploadFile" class="inline-label">첨부파일:</label>
                    <input type="file" id="uploadFile" name="uploadFile" accept="image/*" multiple>
                </div>
            </div>
            <div class="form-actions">
                <button type="reset" onclick="location='askcenter';">취소</button>
                <button type="submit">작성하기</button>
            </div>
        </div>
    </div>
</form>
<jsp:include page="../include/footer.jsp"/>