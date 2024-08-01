package net.daum.dao;

import net.daum.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDAOImpl implements AdminDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertAdmin(AdminVO a) {
        this.sqlSession.insert("InsertAdmin", a);
    }

    @Override
    public AdminVO adminLogin(String adminid) {
        return this.sqlSession.selectOne("AdminLogin", adminid);
    }

    @Override
    public int getRowCount(PageVO p) {
        return this.sqlSession.selectOne("GetRowCount", p);
    }

    @Override
    public List<MemberVO> getMemberList(PageVO p) {
        return this.sqlSession.selectList("GetMemberList", p);
    }

    @Override
    public MemberVO getMemberInfo(String mid) {
        return this.sqlSession.selectOne("GetMemberInfo", mid);
    }

    @Override
    public void memberDel(String mid) {
        this.sqlSession.delete("MemberDel", mid);
    }

    @Override
    public int getListCount(PageVO p) {
        return this.sqlSession.selectOne("ListCount", p);
    }

    @Override
    public List<NoticeVO> getNoticeList(PageVO p) {
        return this.sqlSession.selectList("ListNotice", p);
    }

    @Override
    public void insertNotice(NoticeVO n) {
        this.sqlSession.insert("InsertNotice", n);
    }

    @Override
    public NoticeVO contNotice(int no) {
        return this.sqlSession.selectOne("ContNotice", no);
    }

    @Override
    public void editNotice(NoticeVO n) {
        this.sqlSession.update("EditNotice", n);
    }

    @Override
    public void delNotice(int no) {
        this.sqlSession.delete("DelNotice", no);
    }

    @Override
    public int getTopCount(PageVO p) {
        return this.sqlSession.selectOne("p1_count", p);
    }

    @Override
    public List<ProductVO> getTopList(PageVO p) {
        return this.sqlSession.selectList("p1_list", p);
    }

    @Override
    public int getBottomCount(PageVO p) {
        return this.sqlSession.selectOne("p2_count", p);
    }

    @Override
    public List<ProductVO> getBottomList(PageVO p) {
        return this.sqlSession.selectList("p2_list", p);
    }

    @Override
    public int getOuterCount(PageVO p) {
        return this.sqlSession.selectOne("p3_count", p);
    }

    @Override
    public List<ProductVO> getOuterList(PageVO p) {
        return this.sqlSession.selectList("p3_list", p);
    }

    @Override
    public int getShoesCount(PageVO p) {
        return this.sqlSession.selectOne("p4_count", p);
    }

    @Override
    public List<ProductVO> getShoesList(PageVO p) {
        return this.sqlSession.selectList("p4_list", p);
    }

    @Override
    public void insertProduct(ProductVO pro) {
        this.sqlSession.insert("p_in", pro);
    }

    @Override
    public ProductVO getProductCont(int procode) {
        return this.sqlSession.selectOne("p_cont", procode);
    }

    @Override
    public void editProduct(ProductVO pro) {
        this.sqlSession.update("p_edit", pro);
    }

    @Override
    public void delProduct(int procode) {
        this.sqlSession.delete("p_del", procode);
    }

    @Override
    public int getTotalCount(PageVO p) {
        return this.sqlSession.selectOne("t_count", p);
    }

    @Override
    public List<BbsVO> getUserBbsList(PageVO p) {
        return this.sqlSession.selectList("t_user_bbs", p);
    }

    @Override
    public int getTotalOriginalCount(PageVO p) {
        return this.sqlSession.selectOne("t_totalOriginalCount", p);
    }


}
