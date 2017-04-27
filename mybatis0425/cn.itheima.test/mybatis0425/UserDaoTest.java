package mybatis0425;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import cn.itheima.dao.UserDao;
import cn.itheima.dao.UserDaoImpl;
import cn.itheima.pojo.User;

public class UserDaoTest {
	
	private SqlSessionFactory factory;
	
	@Before
	public void setUp() throws Exception{
		String resource = "SqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		factory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	@Test
	public void testFindUserById() throws Exception{
		
		UserDao userDao = new UserDaoImpl(factory);
		User user = userDao.findUserByUserId(1);
		System.out.println(user);
	}
	
	@Test
	public void testFindUserByUserName() throws Exception{
		UserDao userDao = new UserDaoImpl(factory);
		List<User> list = userDao.findUserByUserName("Íõ");
		System.out.println(list);
	}
}
