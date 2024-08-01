package net.daum.service;

import net.daum.vo.*;

import java.util.List;

public interface AdminService {
    void insertAdmin(AdminVO a);
    AdminVO adminLogin(String adminid);
    int getRowCount(PageVO p);
    List<MemberVO> getMemberList(PageVO p);
    MemberVO getMemberInfo(String mid);
    void memberDel(String mid);
    int getListCount(PageVO p);
    List<NoticeVO> getNoticeList(PageVO p);
    void insertNotice(NoticeVO n);
    NoticeVO contNotice(int no);
    void editNotice(NoticeVO n);
    void delNotice(int no);
    int getTopCount(PageVO p);
    List<ProductVO> getTopList(PageVO p);
    int getBottomCount(PageVO p);
    List<ProductVO> getBottomList(PageVO p);
    int getOuterCount(PageVO p);
    List<ProductVO> getOuterList(PageVO p);
    int getShoesCount(PageVO p);
    List<ProductVO> getShoesList(PageVO p);
    void insertProduct(ProductVO pro);
    ProductVO getProductCont(int procode);
    void editProduct(ProductVO pro);
    ProductVO getProductCont2(int procode);
    void delProduct(int procode);
    int getTotalCount(PageVO p);
    List<BbsVO> getUserBbsList(PageVO p);
    int getTotalOriginalCount(PageVO p);
}
