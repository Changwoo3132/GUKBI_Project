package net.daum.service;

import net.daum.dao.AdminDAO;
import net.daum.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public void insertAdmin(AdminVO a) {
        this.adminDAO.insertAdmin(a);
    }

    @Override
    public AdminVO adminLogin(String adminid) {
        return this.adminDAO.adminLogin(adminid);
    }

    @Override
    public int getRowCount(PageVO p) {
        return this.adminDAO.getRowCount(p);
    }

    @Override
    public List<MemberVO> getMemberList(PageVO p) {
        return this.adminDAO.getMemberList(p);
    }

    @Override
    public MemberVO getMemberInfo(String mid) {
        return this.adminDAO.getMemberInfo(mid);
    }

    @Override
    public void memberDel(String mid) {
        this.adminDAO.memberDel(mid);
    }

    @Override
    public int getListCount(PageVO p) {
        return this.adminDAO.getListCount(p);
    }

    @Override
    public List<NoticeVO> getNoticeList(PageVO p) {
        return this.adminDAO.getNoticeList(p);
    }

    @Override
    public void insertNotice(NoticeVO n) {
        this.adminDAO.insertNotice(n);
    }

    @Override
    public NoticeVO contNotice(int no) {
        return this.adminDAO.contNotice(no);
    }

    @Override
    public void editNotice(NoticeVO n) {
        this.adminDAO.editNotice(n);
    }

    @Override
    public void delNotice(int no) {
        this.adminDAO.delNotice(no);
    }

    @Override
    public int getTopCount(PageVO p) {
        return this.adminDAO.getTopCount(p);
    }

    @Override
    public List<ProductVO> getTopList(PageVO p) {
        return this.adminDAO.getTopList(p);
    }

    @Override
    public int getBottomCount(PageVO p) {
        return this.adminDAO.getBottomCount(p);
    }

    @Override
    public List<ProductVO> getBottomList(PageVO p) {
        return this.adminDAO.getBottomList(p);
    }

    @Override
    public int getOuterCount(PageVO p) {
        return this.adminDAO.getOuterCount(p);
    }

    @Override
    public List<ProductVO> getOuterList(PageVO p) {
        return this.adminDAO.getOuterList(p);
    }

    @Override
    public int getShoesCount(PageVO p) {
        return this.adminDAO.getShoesCount(p);
    }

    @Override
    public List<ProductVO> getShoesList(PageVO p) {
        return this.adminDAO.getShoesList(p);
    }

    @Override
    public void insertProduct(ProductVO pro) {
        this.adminDAO.insertProduct(pro);
    }

    @Override
    public ProductVO getProductCont(int procode) {
        return this.adminDAO.getProductCont(procode);
    }

    @Override
    public void editProduct(ProductVO pro) {
        this.adminDAO.editProduct(pro);
    }

    @Override
    public ProductVO getProductCont2(int procode) {
        return this.getProductCont(procode);
    }

    @Override
    public void delProduct(int procode) {
        this.adminDAO.delProduct(procode);
    }

    @Override
    public int getTotalCount(PageVO p) {
        return this.adminDAO.getTotalCount(p);
    }

    @Override
    public List<BbsVO> getUserBbsList(PageVO p) {
        return this.adminDAO.getUserBbsList(p);
    }

    @Override
    public int getTotalOriginalCount(PageVO p) {
        return this.adminDAO.getTotalOriginalCount(p);
    }

}
