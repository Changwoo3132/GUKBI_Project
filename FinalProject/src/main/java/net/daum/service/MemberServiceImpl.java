package net.daum.service;

import net.daum.dao.MemberDAO;
import net.daum.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public void joinmember(MemberVO m) {
        this.memberDAO.joinmember(m);
    }

    @Override
    public MemberVO logincheck(String mid) {
        return this.memberDAO.logincheck(mid);
    }

    @Override
    public void usereditok(MemberVO m) {
        this.memberDAO.usereditok(m);
    }

    @Override
    public MemberVO mypage(String id) {
        return this.memberDAO.mypage(id);
    }
}
