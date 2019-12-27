package com.board;

import java.util.ArrayList;

import javax.annotation.Resource;


import com.frame.Service;
import com.vo.ReviewVO;

@org.springframework.stereotype.Service("rservice")
public class ReviewService implements Service<String, ReviewVO> {

	@Resource(name="rdao")
	private ReviewDao dao;
	
	@Override
	public void register(ReviewVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		dao.delete(k);		
	}

	@Override
	public void modify(ReviewVO v) throws Exception {
		dao.update(v);		
	}

	@Override
	public ReviewVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<ReviewVO> getall(ReviewVO v) throws Exception {
		return dao.selectall(v);
	}

	

}
