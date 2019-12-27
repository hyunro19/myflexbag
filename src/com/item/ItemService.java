package com.item;

import java.util.ArrayList;
import javax.annotation.Resource;
import com.frame.Dao;
import com.frame.Service;
import com.vo.ItemVO;

@org.springframework.stereotype.Service("iservice")
public class ItemService implements Service<String, ItemVO> {

	@Resource(name="idao")
	Dao<String,ItemVO> dao;
	
	@Override
	public void register(ItemVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		dao.delete(k);
	}

	@Override
	public void modify(ItemVO v) throws Exception {
		dao.update(v);
	}

	@Override
	public ItemVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<ItemVO> getall(ItemVO v) throws Exception {
		return dao.selectall(v);
	}
}
