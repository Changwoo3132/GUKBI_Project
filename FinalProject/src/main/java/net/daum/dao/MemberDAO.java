package net.daum.dao;

import net.daum.vo.MemberVO;

public interface MemberDAO {

    void joinmember(MemberVO m);

    MemberVO logincheck(String mid);

    void usereditok(MemberVO m);

    MemberVO mypage(String id);
}
