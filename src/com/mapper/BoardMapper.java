package com.mapper;

import java.util.ArrayList;

import com.vo.BoardVO;

public interface BoardMapper {
	public void insert(BoardVO obj);
	public void delete(String obj);
	public void update(BoardVO obj);
	public BoardVO select(String obj);
	public ArrayList<BoardVO> selectall(BoardVO obj);
}
