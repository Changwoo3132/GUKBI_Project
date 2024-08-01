package net.daum.dao;

import net.daum.vo.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void joinmember(MemberVO m) {
        this.sqlSession.insert("Joinmember", m);
    }

    @Override
    public MemberVO logincheck(String mid) {
        return this.sqlSession.selectOne("Logincheck", mid);
    }

    @Override
    public void usereditok(MemberVO m) {
        this.sqlSession.update("Usereditok", m);
    }

    @Override
    public MemberVO mypage(String id) {
        return this.sqlSession.selectOne("Mypage", id);
    }
}
