package spring;

import com.oracle.ssmphone.domain.User;
import com.oracle.ssmphone.mapper.UserMapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class IocTest {
    @Test
    public void test1() {
        //创建User对象，并且给封装属性
        //常规方式
        User user = new User();
        user.setUserId(100);
        user.setUserName("张三");
        System.out.println(user);//打印对象本质: 调用toString()

    }

    @Test
    public void test2() {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring-ioc.xml");
        //从容器中获取user
        User u = (User) context.getBean("user");
        System.out.println(u);
    }
    @Test
    public void test3() {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring-ioc.xml");
        SqlSessionFactory sf = (SqlSessionFactory) context.getBean("sf");
        System.out.println(sf.openSession(false));
    }
    @Test
    public void test4() {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring-ioc.xml");
        UserMapper userMapper = (UserMapper) context.getBean("userMapper");
        userMapper.find();
    }
}
