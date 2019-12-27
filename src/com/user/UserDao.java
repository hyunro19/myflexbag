package com.user;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.frame.Dao;
import com.mapper.UserMapper;
import com.vo.UserVO;

@Repository("udao")
public class UserDao implements Dao<String, UserVO> {

	@Autowired
	UserMapper um;
	
	@Override
	public void insert(UserVO v) throws Exception {
		um.insert(v);
	}

	@Override
	public void delete(String k) throws Exception {
		um.delete(k);
	}

	@Override
	public void update(UserVO v) throws Exception {
		um.update(v);		
	}

	@Override
	public UserVO select(String k) throws Exception {
		return um.select(k);
	}

	@Override
	public ArrayList<UserVO> selectall(UserVO v) throws Exception {
		return um.selectall(v);
	}

}

