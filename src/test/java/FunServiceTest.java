import com.oracle.ssmphone.domain.Funs;
import com.oracle.ssmphone.service.FunService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class FunServiceTest {
   @Test
    public void testFind()
    {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-ioc.xml","classpath:spring-aop.xml"});
        FunService funService=  (FunService)context.getBean("funServiceImpl");
        Funs fun=new Funs();
        fun.setFunName("管理");
        fun.setFunLevel(1);
        fun.setFunTarget("I2");
        funService.showFuns(fun);
    }
}
