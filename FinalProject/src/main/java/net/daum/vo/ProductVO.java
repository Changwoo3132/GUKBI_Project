package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ProductVO {

	private int procode; // 상품코드
	private String proname; // 상품명
	private int proprice; // 상품가격
	private String proinfo; // 상품정보
	private int prostate; // 판매여부
	private int proqty; // 수량
	private String profile; // 이미지 파일 저장명
	private Date prodate;
	private int catecode; // 카테고리 코드
	
}
