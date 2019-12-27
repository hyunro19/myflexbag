package com.cart;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.frame.DaoO;
import com.mapper.OrderMapper;
import com.vo.OrderVO;

@Repository("odao")
public class OrderDao implements DaoO<String, OrderVO> {
	
	@Autowired
	OrderMapper om;

	@Override
	public int insert(OrderVO v) throws Exception {
		return om.insert(v);
	}

//	@Override
//	public void delete(String k) throws Exception {
//		om.delete(k);
//	}
//
//	@Override
//	public void update(OrderVO v) throws Exception {
//		om.update(v);
//	}
//
	@Override
	public OrderVO select(String k) throws Exception {
		return om.select(k);
	}

	@Override
	public ArrayList<OrderVO> selectall(OrderVO v) throws Exception {
		return om.selectall(v);
	}
	
}
