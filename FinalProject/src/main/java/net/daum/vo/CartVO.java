package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {

	private int cartcode; // 장바구니 코드
	private int amount; // 수량 
	private int ischecked; // 상품 체크 (체크한 것만 주문)
	private String mid;
	private String memail; // 이메일
	private String mname; // 이름
	private String mphone; // 전화번호
	private int procode;
	private String profile;
	private String proname; // 상품명
	private int proprice; // 상품가격

	private MemberVO memberVO;

	public MemberVO getMember() {
		return memberVO;
	}

	public void setMember(MemberVO member) {
		this.memberVO = member;
	}

	private ProductVO productVO;

	public ProductVO getProduct() {
		return productVO;
	}

	public void setProduct(ProductVO product) {
		this.productVO = product;
	}

	private Product2VO product2VO;

	public Product2VO getProduct2() {
		return product2VO;
	}

	public void setProduct2(Product2VO product2) {
		this.product2VO = product2;
	}
}