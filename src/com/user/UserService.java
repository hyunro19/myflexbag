package com.user;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import com.frame.Dao;
import com.frame.Service;
import com.vo.UserVO;
@org.springframework.stereotype.Service("uservice")
public class UserService implements Service<String, UserVO> {

	@Resource(name="udao")
	Dao<String,UserVO> dao;
	
	@Override
	public void register(UserVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		dao.delete(k);
		
	}

	@Override
	public void modify(UserVO v) throws Exception {
		dao.update(v);
		
	}

	@Override
	public UserVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<UserVO> getall(UserVO v) throws Exception {
		return dao.selectall(v);
	}

}
