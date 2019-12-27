package com.board;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.inject.Inject;

import com.frame.Dao;
import com.frame.Service;
import com.vo.BoardVO;
import com.vo.UserVO;

@org.springframework.stereotype.Service("bservice")
public class BoardService implements Service<String, BoardVO> {
	
@Inject
private BoardDao dao;
	
	@Override
	public void register(BoardVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		dao.delete(k);
		
	}

	@Override
	public void modify(BoardVO v) throws Exception {
		dao.update(v);
	}

	@Override
	public BoardVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<BoardVO> getall(BoardVO v) throws Exception {
		return dao.selectall(v);
	}


}
