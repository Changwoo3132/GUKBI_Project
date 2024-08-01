package net.daum.service;

import net.daum.vo.CartVO;
import net.daum.vo.ProductVO;

import java.util.List;

public interface CartService {

    List<ProductVO> getTopList();

    List<ProductVO> getBottomList();

    List<ProductVO> getOuterList();

    List<ProductVO> getShoesList();

    void insertCart(CartVO c);

    List<CartVO> getCartList(String id);

    void delCart(Integer cartcode);
    
    List<CartVO> getCartcode(String id);
}
