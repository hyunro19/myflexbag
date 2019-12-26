package com.mapper;

import java.util.ArrayList;

import com.vo.OrderVO;

public interface OrderMapper {
	public int insert(OrderVO obj);
//	public void delete(String obj);
//	public void update(OrderVO obj);
	public OrderVO select(String obj);
	public ArrayList<OrderVO> selectall(OrderVO obj);
//	public void clear();
}



