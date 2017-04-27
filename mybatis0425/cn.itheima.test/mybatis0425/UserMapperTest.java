package mybatis0425;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import cn.itheima.mapper.UserMapper;
import cn.itheima.pojo.User;

public class UserMapperTest {
private SqlSessionFactory factory;
	
	@Before
	public void setUp() throws Exception{
		String resource = "SqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		factory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	@Test
	public void testFindUserById() throws Exception{
		SqlSession openSession = factory.openSession();
		UserMapper mapper = openSession.getMapper(UserMapper.class);
		
		User user = mapper.findUserById(1);
		System.out.println(user);
	}
	
	@Test
	public void testFindUserByUserName() throws Exception{
		SqlSession openSession = factory.openSession();
		UserMapper mapper = openSession.getMapper(UserMapper.class);
		
		List<User> list = mapper.findUserByUserName("王");
		System.out.println(list);
	}
	
	@Test
	public void testInsertUser() throws Exception{
		SqlSession openSession = factory.openSession();
		UserMapper mapper = openSession.getMapper(UserMapper.class);
		
		User user = new User();
		user.setUsername("老丁");
		user.setSex("1");
		user.setBirthday(new Date());
		user.setAddress("福建福州");
		mapper.insertUser(user);
		
		openSession.commit();		
	}
}
