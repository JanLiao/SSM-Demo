package com.jan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.jan.dao.UserDao;
import com.jan.entity.Users;
import com.jan.service.UserService;

/** 
* @author 作者: JanLiao
* @date 时间: 2020年5月21日 上午9:53:53
*/

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public String getUser(String name) {
		Users user =  userDao.getUser(name);
		return JSON.toJSONString(user);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	public void insert() {
		userDao.insert(new Users("sdf", 10));
		System.out.println("add success");
		userDao.insert(new Users("janjanjanajnajjsdfsdfaasdsdfasdfadsfsdfsadf", 10));
	}

}
