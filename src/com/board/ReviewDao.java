package com.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mapper.ReviewMapper;
import com.vo.ReviewVO;

@Repository("rdao")
public class ReviewDao implements Dao<String, ReviewVO> {

	@Autowired
	ReviewMapper rm;
	
	@Override
	public void insert(ReviewVO v) throws Exception {
		rm.insert(v);
	}

	@Override
	public void delete(String k) throws Exception {
		rm.delete(k);
	}

	@Override
	public void update(ReviewVO v) throws Exception {
		rm.update(v);
	}

	@Override
	public ReviewVO select(String k) throws Exception {
		return rm.select(k);
	}

	@Override
	public ArrayList<ReviewVO> selectall(ReviewVO v) throws Exception {
		return rm.selectall(v);
	}
	
	
}
