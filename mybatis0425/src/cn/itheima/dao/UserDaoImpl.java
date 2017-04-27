package cn.itheima.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import cn.itheima.pojo.User;

public class UserDaoImpl implements UserDao {

	private SqlSessionFactory sqlSessionFactory;

	public UserDaoImpl(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public User findUserByUserId(Integer id) {
		SqlSession openSession = sqlSessionFactory.openSession();
		User user = openSession.selectOne("test.findUserById", id);
		return user;
	}

	@Override
	public List<User> findUserByUserName(String userName) {
		SqlSession openSession = sqlSessionFactory.openSession();
		List<User> list = openSession.selectList("test.findUserByUserName", userName);
		return list;
	}
	
	
	
}
