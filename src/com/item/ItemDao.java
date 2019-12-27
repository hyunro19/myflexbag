package com.item;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.frame.Dao;
import com.mapper.ItemMapper;
import com.vo.ItemVO;

@Repository("idao")
public class ItemDao implements Dao<String, ItemVO> {

	@Autowired
	ItemMapper im;
	
	@Override
	public void insert(ItemVO v) throws Exception {
		im.insert(v);
	}

	@Override
	public void delete(String k) throws Exception {
		im.delete(k);
	}

	@Override
	public void update(ItemVO v) throws Exception {
		im.update(v);		
	}

	@Override
	public ItemVO select(String k) throws Exception {
		return im.select(k);
	}

	@Override
	public ArrayList<ItemVO> selectall(ItemVO v) throws Exception {
		return im.selectall(v);
	}
	

}