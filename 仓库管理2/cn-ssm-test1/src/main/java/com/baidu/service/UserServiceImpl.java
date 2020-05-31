package com.baidu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baidu.entity.User;
import com.baidu.mapper.UserMapperI;

@Service
public class UserServiceImpl implements UserServiceI{
	@Autowired
	private UserMapperI userMapper;

	@Override
	public User login(User user) {
		User u = this.userMapper.login(user);
		return u;
	}
}
