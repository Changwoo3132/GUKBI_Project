package net.daum.dao;

import net.daum.vo.CartVO;
import net.daum.vo.ProductVO;

import java.util.List;

public interface CartDAO {

    List<ProductVO> getTopList();

    List<ProductVO> getBottomList();

    List<ProductVO> getOuterList();

    List<ProductVO> getShoesList();

    void insertCart(CartVO c);

    List<CartVO> getCartList(String id);

    void delCart(Integer cartcode);
    
    List<CartVO> getCartcode(String id);
}
