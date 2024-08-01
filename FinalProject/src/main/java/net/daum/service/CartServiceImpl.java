package net.daum.service;

import net.daum.dao.CartDAO;
import net.daum.vo.CartVO;
import net.daum.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDAO cartDAO;

    @Override
    public List<ProductVO> getTopList() {
        return this.cartDAO.getTopList();
    }

    @Override
    public List<ProductVO> getBottomList() {
        return this.cartDAO.getBottomList();
    }

    @Override
    public List<ProductVO> getOuterList() {
        return this.cartDAO.getOuterList();
    }

    @Override
    public List<ProductVO> getShoesList() {
        return this.cartDAO.getShoesList();
    }

    @Override
    public void insertCart(CartVO c) {
        this.cartDAO.insertCart(c);
    }

    @Override
    public List<CartVO> getCartList(String id) {
        return this.cartDAO.getCartList(id);
    }

    @Override
    public void delCart(Integer cartcode) {
        this.cartDAO.delCart(cartcode);
    }
    @Override
	public List<CartVO> getCartcode(String id) {
		return this.cartDAO.getCartcode(id);
    }
}
