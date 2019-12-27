package com.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.mapper.BoardMapper;
import com.vo.BoardVO;


@Repository("bdao")
public class BoardDao implements Dao<String, BoardVO> {
	
	@Autowired
	BoardMapper bm;

	@Override
	public void insert(BoardVO v) throws Exception {
		bm.insert(v);
	}

	@Override
	public void delete(String k) throws Exception {
		bm.delete(k);
	}
	

	@Override
	public void update(BoardVO v) throws Exception {
		bm.update(v);
	}

	@Override
	public BoardVO select(String k) throws Exception {
		return bm.select(k);
	}

	@Override
	public ArrayList<BoardVO> selectall(BoardVO v) throws Exception {
		return bm.selectall(v);
	}


}
