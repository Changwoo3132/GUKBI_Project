<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<link rel="stylesheet" href="../css/center/askwrite.css">
<div class="container">
    <div class="inquiry-popup">
        <div class="writeFormwrap">
            <h2>상품 문의</h2>
            <form action="submitInquiry.jsp" method="post">
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
                    <label for="inquiryTitle" class="inline-label">문의 제목:</label>
                    <input type="text" id="inquiryTitle" name="inquiryTitle" maxlength="15" required>
                    <input type="checkbox" id="secret" name="secret">
                    <label for="secret" class="secret-label">비밀글</label>
                </div>
                <div class="form-group">
                    <label for="inquiryContent" class="inline-label">문의 내용:</label>
                    <textarea id="inquiryContent" name="inquiryContent" maxlength="200" required></textarea>
                </div>
                <div class="form-group">
                    <label for="imageUpload" class="inline-label">첨부파일:</label>
                    <input type="file" id="imageUpload" name="imageUpload" accept="image/*" multiple>
                </div>
            </form>
        </div>
        <div class="form-actions">
            <button type="reset">취소</button>
            <button type="submit">작성하기</button>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
