package net.daum.dao;

import net.daum.vo.BbsVO;
import net.daum.vo.NoticeVO;
import net.daum.vo.PageVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CenterDAOImpl implements CenterDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertBbsWrite(BbsVO bbs) {
        this.sqlSession.insert("insertBbs", bbs);
    }

    @Override
    public int getTotalCount(PageVO p) {
        return this.sqlSession.selectOne("TotalCount", p);
    }

    @Override
    public List<BbsVO> BbsList(PageVO p) {
        return this.sqlSession.selectList("Bbslist", p);
    }

    @Override
    public BbsVO getBbsCont(int bbs_no) {
        return this.sqlSession.selectOne("BbsCont", bbs_no);
    }

    @Override
    public void replyBbs(BbsVO b) {
        this.sqlSession.insert("ReplyBbs", b);
    }

    @Override
    public void editBbs(BbsVO b) {
        this.sqlSession.update("EditBbs", b);
    }

    @Override
    public void delBbs(int bbs_no) {
        this.sqlSession.delete("DelBbs", bbs_no);
    }

    @Override
    public List<NoticeVO> getNoticeList() {
        return this.sqlSession.selectList("GetNoticeList");
    }

    @Override
    public NoticeVO getNoticeCont(int notice_no) {
        return this.sqlSession.selectOne("GetNoticeCont", notice_no);
    }
}
