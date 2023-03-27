import com.oracle.ssmphone.domain.Orders;
import com.oracle.ssmphone.service.FunService;
import com.oracle.ssmphone.service.OrderService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class OrderServiceTest {
    @Test
    public void testShowOrderByStatus() {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-ioc.xml", "classpath:spring-aop.xml"});
        OrderService orderService = (OrderService) context.getBean("orderServiceImpl");
        List<Orders> list = orderService.showOrderByStatus(1,new Orders());
        list.forEach(orders -> {
            System.out.println(orders.getOrderId() + "\t" + orders.getOrderName() + "\t" + orders.getOrderUser().getUserName() + "\t" + orders.getOrderStatus().getStatusName());
            // System.out.println(orders.getOrderId()+"\t"+orders.getOrderName()+"\t"+orders.getOrderStatus().getStatusName());
        });
    }
}
