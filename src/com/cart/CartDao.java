package com.cart;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.frame.Dao;
import com.mapper.CartMapper;
import com.mapper.UserMapper;
import com.vo.CartVO;

@Repository("cdao")
public class CartDao implements Dao<String, CartVO> {
	
	@Autowired
	CartMapper cm;

	@Override
	public void insert(CartVO v) throws Exception {
		cm.insert(v);
	}

	@Override
	public void delete(String k) throws Exception {
		cm.delete(k);
	}

	@Override
	public void update(CartVO v) throws Exception {
		cm.update(v);
	}

	@Override
	public CartVO select(String k) throws Exception {
		return cm.select(k);
	}

	@Override
	public ArrayList<CartVO> selectall(CartVO v) throws Exception {
		return cm.selectall(v);
	}
	
}
