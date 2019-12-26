package com.mapper;

import java.util.ArrayList;

import com.vo.ReviewVO;

public interface ReviewMapper {
	public void insert(ReviewVO obj);
	public void delete(String obj);
	public void update(ReviewVO obj);
	public ReviewVO select(String obj);
	public ArrayList<ReviewVO> selectall(ReviewVO obj);

}
