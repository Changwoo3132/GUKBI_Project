package net.daum.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class BbsVO {

    private int bbs_no; // 게시물 번호
    private String bbs_title; // 제목
    private String bbs_cont; // 내용
    private String bbs_file; // 이진 파일명
    private int bbs_ref; // 글 그룹번호
    private int bbs_step; // 첫번째 답변글 1, 두번째 답변글 2 즉 원본글과 답변글을 구분하는 번호값, 몇번째 답변글인가를 알려줌
    private int bbs_level; // 답변글 정렬순서
    private String bbs_date; // 등록 날짜

}
