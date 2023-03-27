import com.oracle.ssmphone.domain.OrderDetail;
import com.oracle.ssmphone.mapper.GoodsDetailMapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.oracle.ssmphone.mapper.*;

import java.util.List;

public class OrderDetailMapperTest {
    @Test
    public void testFindByOrderId()
    {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-ioc.xml","classpath:spring-aop.xml"});
        OrderDetailMapper orderDetailMapper=  (OrderDetailMapper)context.getBean("orderDetailMapper");
       List<OrderDetail> odList=  orderDetailMapper.findByOrderId("ac56d2a590fc4feb93a3f773fb5c0f0c");
       for(OrderDetail od:odList)
       {
           System.out.println(od.getDetailId()+"\t"+od.getDetailNum()+"\t"+
                   od.getDetailPrice()+"\t"+
                   od.getDetailGoodsDetail().getGdPrice()+"\t"+
                   od.getDetailGoodsDetail().getGdGoods().getGoodsName());

       }

    }
}
