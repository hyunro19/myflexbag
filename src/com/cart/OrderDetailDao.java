package com.cart;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.frame.Dao;
import com.mapper.OrderDetailMapper;
import com.mapper.OrderMapper;
import com.vo.OrderDetailVO;

@Repository("oddao")
public class OrderDetailDao implements Dao<String, OrderDetailVO> {
	
	@Autowired
	OrderDetailMapper om;

	@Override
	public void insert(OrderDetailVO v) throws Exception {
		om.insert(v);
	}

	@Override
	public void delete(String k) throws Exception {
		om.delete(k);
	}

	@Override
	public void update(OrderDetailVO v) throws Exception {
		om.update(v);
	}

	@Override
	public OrderDetailVO select(String k) throws Exception {
		return om.select(k);
	}

	@Override
	public ArrayList<OrderDetailVO> selectall(OrderDetailVO v) throws Exception {
		return om.selectall(v);
	}
	
}
