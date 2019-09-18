package com.netdisc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.netdisc.dao.UserMapper;
import com.netdisc.pojo.User;
import com.netdisc.service.IUserService;
import com.netdisc.util.IdUtil;
import com.netdisc.util.Md5Util;
import com.netdisc.vo.CapacityVo;




@Service
@Transactional
public class UserServiceImpl implements IUserService{

	@Autowired
	private UserMapper userDao;
	
	
	@Override
	public List<User> getUserByUname(String name) {
		List<User> users= userDao.getUserByUname(name);
		return users;
	}

	@Override
	public List<User> getUserByEmail(String email) {
		List<User> users= userDao.getUserByEmail(email);
		return users;
	}

	@Override
	public List<User> getUserByPhone(String phone) {
		List<User> users= userDao.getUserByPhone(phone);
		return users;
	}
	
	@Override
	public void saveUserRegister(String username,String email,String phone,String password,String sex) {
	/*User usera=new User();
	usera.setUsername(user.getUsername());
	usera.setEmail(user.getEmail());
	usera.setPhone(user.getPhone());
	usera.setPassword(Md5Util.getMd5EnCode(user.getPassword()));
	usera.setSex(user.getSex());
	System.out.println("user的信息"+user.getUsername()+"<<<<<"+user.getPhone()+">>>>"+user.getPassword());*/
	System.out.println(">>>>>");
	String id=IdUtil.getId();
	String pwd=Md5Util.getMd5EnCode(password);
	userDao.saveUserRegister(id,username,email,phone,pwd,sex);
	System.out.println("<<<<<<<<<<<<");
	}

	@Override
	public User getUserByUserNamePass(String username, String password) {
		
		String uname=(username);
		String pwd=(Md5Util.getMd5EnCode(password));
		User result = userDao.getUserByUserNamePass(uname,pwd);
		return result;
	}

	@Override
	public CapacityVo capacity(String userId) {
		CapacityVo capacityVo=new CapacityVo();
		User user=userDao.selectByPrimaryKey(userId);
		capacityVo.setHas_capacity(user.getHasCapacity());
		capacityVo.setTotal_capacity(user.getTotalCapacity());
		return capacityVo;
	}

	
	
}
