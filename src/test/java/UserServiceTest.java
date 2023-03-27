import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.ssmphone.domain.User;
import com.oracle.ssmphone.service.UserService;
import com.oracle.ssmphone.service.impl.UserServiceImpl;
import com.oracle.ssmphone.utils.MD5Util;
import org.junit.Test;

import java.util.List;

public class UserServiceTest {
    UserService userService=new UserServiceImpl();

    @Test
    public void testReg() throws Exception
    {
        User user = new User();
        user.setUserName("a67788");
        user.setUserPass(MD5Util.MD5ToString("654321"));
        user.setUserPhone("13938886625");
        userService.reg(user);//调用业务方式实现注册
        System.out.println("注册成功!");
    }
    @Test
    public void testFind()
    {
        //该方法的调用要放在查询之前
        PageHelper.startPage(2,5);//查询第1页，每页显示5条
        List<User> list=     userService.showUsers();
        PageInfo<User> pv=new PageInfo<User>(list);//传入集合
        System.out.println("当前页号:");
        System.out.println(pv.getPageNum());
        System.out.println("每页记录数:");
        System.out.println(pv.getPageSize());
        System.out.println("总页数:");
        System.out.println(pv.getPages());
        System.out.println("当前页的用户:");
        pv.getList().forEach(user->{
            System.out.println(user.getUserId()+"\t"+user.getUserName()+"\t"+user.getUserPhone());
        });

    }
}
