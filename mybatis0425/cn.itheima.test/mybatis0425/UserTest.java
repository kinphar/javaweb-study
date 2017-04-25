package mybatis0425;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import cn.itheima.pojo.User;

public class UserTest {

	@Test
	public void testFindUserById() throws Exception{
		String resource = "SqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
 		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		
		SqlSession openSession = factory.openSession();		
		User user = openSession.selectOne("test.findUserById", 1);
		System.out.println(user);
		openSession.close();
	}
	
	@Test
	public void testFindUserByUserName() throws Exception{
		String resource = "SqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession openSession = factory.openSession();
		
		List<User> List = openSession.selectList("test.findUserByUserName", "王");		
		System.out.println(List);
		
	}
	
	@Test
	public void testInsertUser() throws Exception{
		String resource = "SqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession openSession = factory.openSession();
		
		User user = new User();
		user.setUsername("赵武");
		user.setBirthday(new Date());
		user.setSex("1");
		user.setAddress("福建福州");
		
		System.out.println("===" + user.getId());
		
		openSession.insert("test.insertUser", user);
		openSession.commit();
		
		System.out.println("===" + user.getId());
	}
	
	@Test
	public void testDelUserById() throws Exception{
		String resource = "SqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession openSession = factory.openSession();
		
		openSession.delete("test.delUserById", 28);
		openSession.commit();
	}
	
	@Test
	public void testUpdateUserById() throws Exception{
		String resource = "SqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession openSession = factory.openSession();
		
		User user = new User();
		user.setId(26);
		user.setUsername("王麻子");
		openSession.update("test.updateUserById", user);
		openSession.commit();
	}
}
