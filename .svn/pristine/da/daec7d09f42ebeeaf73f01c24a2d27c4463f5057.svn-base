package netdisc;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.netdisc.dao.UserMapper;
import com.netdisc.pojo.User;
import com.netdisc.util.IdUtil;
import com.netdisc.util.Md5Util;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserTest {
	@Autowired
	private UserMapper userMapper;
	
	@Test
	public void saveTest() {
		User user = new User();
		user.setId(IdUtil.getId());
		user.setUsername("jsu1234");
		user.setPassword(Md5Util.getMd5EnCode("jsu12345"));
		user.setEmail("1739434147@qq.com");
		userMapper.insert(user);
	}
	
}
