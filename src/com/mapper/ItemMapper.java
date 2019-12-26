package com.mapper;

import java.util.ArrayList;

import com.vo.ItemVO;

public interface ItemMapper {
	public void insert(ItemVO obj);
	public void delete(String obj);
	public void update(ItemVO obj);
	public ItemVO select(String obj);
	public ArrayList<ItemVO> selectall(ItemVO obj);
}



