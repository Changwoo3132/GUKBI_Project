package net.daum.service;

import net.daum.dao.CenterDAO;
import net.daum.vo.BbsVO;
import net.daum.vo.NoticeVO;
import net.daum.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CenterServiceImpl implements CenterService{

    @Autowired
    private CenterDAO centerDAO;

    @Override
    public void insertBbsWrite(BbsVO bbs) {
        this.centerDAO.insertBbsWrite(bbs);
    }

    @Override
    public int getTotalCount(PageVO p) {
        return this.centerDAO.getTotalCount(p);
    }

    @Override
    public List<BbsVO> BbsList(PageVO p) {
        return this.centerDAO.BbsList(p);
    }

    @Override
    public BbsVO getBbsCont(int bbs_no) {
        return this.centerDAO.getBbsCont(bbs_no);
    }

    @Override
    public void replyBbs(BbsVO b) {
        this.centerDAO.replyBbs(b);
    }

    @Override
    public void editBbs(BbsVO b) {
        this.centerDAO.editBbs(b);
    }

    @Override
    public void delBbs(int bbs_no) {
        this.centerDAO.delBbs(bbs_no);
    }

    @Override
    public List<NoticeVO> getNoticeList() {
        return this.centerDAO.getNoticeList();
    }

    @Override
    public NoticeVO getNoticeCont(int notice_no) {
        return this.centerDAO.getNoticeCont(notice_no);
    }
}
