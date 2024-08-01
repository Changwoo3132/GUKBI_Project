package net.daum.service;

import net.daum.vo.MemberVO;

public interface MemberService {

    void joinmember(MemberVO m);

    MemberVO logincheck(String mid);

    void usereditok(MemberVO m);

    MemberVO mypage(String id);
}
