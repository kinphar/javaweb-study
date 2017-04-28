package cn.itheima.mapper;

import java.util.List;

import cn.itheima.pojo.Orders;
import cn.itheima.pojo.QueryVo;
import cn.itheima.pojo.User;

public interface UserMapper {

	public User findUserById(Integer id);
	
	public List<User> findUserByUserName(String userName);
	
	public void insertUser(User user);
	
	public List<User> findUserByVo(QueryVo vo);
	
	public Integer findUserCount();
	
	public List<User> findUserByUserNameAndSex(User user);
	
	public List<User> findUserByIds(QueryVo vo);
	
	public List<Orders> findOrdersAndUser();
}
