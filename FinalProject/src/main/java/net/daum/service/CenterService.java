package net.daum.service;

import net.daum.vo.BbsVO;
import net.daum.vo.NoticeVO;
import net.daum.vo.PageVO;

import java.util.List;

public interface CenterService {

    void insertBbsWrite(BbsVO bbs);
    int getTotalCount(PageVO p);
    List<BbsVO> BbsList(PageVO p);
    BbsVO getBbsCont(int bbs_no);
    void replyBbs(BbsVO b);
    void editBbs(BbsVO b);
    void delBbs(int bbs_no);

    List<NoticeVO> getNoticeList();
    NoticeVO getNoticeCont(int notice_no);
}
