package net.daum.dao;

import net.daum.vo.CartVO;
import net.daum.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDAOImpl implements CartDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<ProductVO> getTopList() {
        return this.sqlSession.selectList("top_list");
    }

    @Override
    public List<ProductVO> getBottomList() {
        return this.sqlSession.selectList("bottom_list");
    }

    @Override
    public List<ProductVO> getOuterList() {
        return this.sqlSession.selectList("outer_list");
    }

    @Override
    public List<ProductVO> getShoesList() {
        return this.sqlSession.selectList("shoes_list");
    }

    @Override
    public void insertCart(CartVO c) {
        this.sqlSession.insert("cart_in", c);
    }

    @Override
    public List<CartVO> getCartList(String id) {
        return this.sqlSession.selectList("cart_list", id);
    }

    @Override
    public void delCart(Integer cartcode) {
        this.sqlSession.delete("del_cart", cartcode);
    }
    @Override
	public List<CartVO> getCartcode(String id) {
		return this.sqlSession.selectList("get_cartcode", id);
	}

}
