package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Setter
@Getter
public class MemberVO {

    private String mid; // 아이디
    private String mpwd; // 비밀번호
    private String mpwdC; // 비밀번호 체크
    private String memail; // 이메일
    private String mname; // 이름
    private String mday; // 생년월일
    private String mphone; // 전화번호
    private int mstate; // 가입 1 탈퇴 2
    private Date mdate; // 가입날짜
    private String myaddr; // 집주소
    private String myaddr2; // 나머지 주소
    private String addrcode; // 우편번호

}
