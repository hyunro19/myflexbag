package com.item;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mapper.PageMapper;
import com.vo.PageVO;
@Repository("pdao")
public class PageDao implements Dao<String, PageVO> {

	@Autowired
	PageMapper pm;
	
	@Override
	public void insert(PageVO v) throws Exception {
		pm.insert(v);
	}

	@Override
	public void delete(String k) throws Exception {
		pm.delete(k);
	}

	@Override
	public void update(PageVO v) throws Exception {
		pm.update(v);		
	}

	@Override
	public PageVO select(String k) throws Exception {
		return pm.select(k);
	}

	@Override
	public ArrayList<PageVO> selectall(PageVO v) throws Exception {
		return pm.selectall(v);
	}
	

}