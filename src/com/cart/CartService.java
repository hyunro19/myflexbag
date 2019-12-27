package com.cart;

import java.util.ArrayList;
import javax.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import com.frame.Dao;
import com.frame.Service;
import com.vo.CartVO;
@org.springframework.stereotype.Service("cservice")
public class CartService implements Service<String, CartVO> {

	@Resource(name="cdao")
	Dao<String,CartVO> dao;
	
	@Override
	public void register(CartVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		dao.delete(k);
	}

	@Override
	public void modify(CartVO v) throws Exception {
		dao.update(v);
	}

	@Override
	public CartVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<CartVO> getall(CartVO v) throws Exception {
		return dao.selectall(v);
	}

}
