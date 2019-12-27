package com.cart;

import java.util.ArrayList;
import javax.annotation.Resource;
import org.springframework.transaction.annotation.Transactional;
import com.frame.Dao;
import com.frame.Service;
import com.vo.OrderDetailVO;
@org.springframework.stereotype.Service("odservice")
public class OrderDetailService implements Service<String, OrderDetailVO> {

	@Resource(name="oddao")
	Dao<String,OrderDetailVO> dao;
	
	@Override
	public void register(OrderDetailVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		dao.delete(k);
	}

	@Override
	public void modify(OrderDetailVO v) throws Exception {
		dao.update(v);
	}

	@Override
	public OrderDetailVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<OrderDetailVO> getall(OrderDetailVO v) throws Exception {
		return dao.selectall(v);
	}

}
