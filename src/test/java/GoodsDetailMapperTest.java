import com.oracle.ssmphone.domain.GoodsDetail;
import com.oracle.ssmphone.service.FunService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.oracle.ssmphone.mapper.*;
public class GoodsDetailMapperTest {
    @Test
    public void testGet()
    {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-ioc.xml","classpath:spring-aop.xml"});
        GoodsDetailMapper goodsDetailMapper=  (GoodsDetailMapper)context.getBean("orderDetailMapper");
        GoodsDetail gd=  goodsDetailMapper.get(1);
        System.out.println(gd.getGdId()+"\t"+gd.getGdPrice()+"\t"+gd.getGdGoods().getGoodsName()+"\t"+gd.getGdColor().getColorName()+"\t"+gd.getGdMemory().getMemoryName());
    }
}
