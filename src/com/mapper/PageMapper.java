package com.mapper;

import java.util.ArrayList;

import com.vo.PageVO;

public interface PageMapper {
	public void insert(PageVO obj);
	public void delete(String obj);
	public void update(PageVO obj);
	public PageVO select(String obj);
	public ArrayList<PageVO> selectall(PageVO obj);
}



