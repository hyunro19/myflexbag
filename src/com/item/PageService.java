package com.item;

import java.util.ArrayList;
import javax.annotation.Resource;
import com.frame.Dao;
import com.frame.Service;
import com.vo.PageVO;

@org.springframework.stereotype.Service("pservice")
public class PageService implements Service<String, PageVO> {

	@Resource(name="pdao")
	Dao<String,PageVO> dao;
	
	@Override
	public void register(PageVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		dao.delete(k);
	}

	@Override
	public void modify(PageVO v) throws Exception {
		dao.update(v);
	}

	@Override
	public PageVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<PageVO> getall(PageVO v) throws Exception {
		return dao.selectall(v);
	}
}
