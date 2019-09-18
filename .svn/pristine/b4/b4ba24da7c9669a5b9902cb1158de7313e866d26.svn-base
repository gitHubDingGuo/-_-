package com.netdisc.service;

import java.util.List;

import com.netdisc.pojo.User;
import com.netdisc.vo.CapacityVo;

public interface IUserService {
	
	
	public List<User> getUserByUname(String name);
	public List<User> getUserByEmail(String email);
	public List<User> getUserByPhone(String phone);
	
	public void saveUserRegister(String username,String email,String phone,String password,String sex);
	
	public User getUserByUserNamePass(String username,String password);
	
	/**
	 * 容量
	 * @param userId
	 * @return
	 */
	CapacityVo capacity(String userId);

}
