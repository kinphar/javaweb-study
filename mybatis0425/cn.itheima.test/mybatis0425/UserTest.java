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
		
		List<User> List = openSession.selectList("test.findUserByUserName", "Õı");		
		System.out.println(List);
		
	}
	
	@Test
	public void testInsertUser() throws Exception{
		String resource = "SqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession openSession = factory.openSession();
		
		User user = new User();
		user.setUsername("’‘Œ‰");
		user.setBirthday(new Date());
		user.setSex("1");
		user.setAddress("∏£Ω®∏£÷›");
		
		System.out.println("===" + user.getId());
		
		openSession.insert("test.insertUser", user);
		openSession.commit();
		
		System.out.println("===" + user.getId());
	}
}
