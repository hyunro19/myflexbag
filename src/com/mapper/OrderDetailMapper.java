package com.mapper;

import java.util.ArrayList;

import com.vo.OrderDetailVO;

public interface OrderDetailMapper {
	public void insert(OrderDetailVO obj);
	public void delete(String obj);
	public void update(OrderDetailVO obj);
	public OrderDetailVO select(String obj);
	public ArrayList<OrderDetailVO> selectall(OrderDetailVO obj);
}



