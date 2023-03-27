import com.oracle.ssmphone.domain.Items;
import com.oracle.ssmphone.domain.User;
import com.oracle.ssmphone.service.GoodService;
import com.oracle.ssmphone.service.ItemsService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class ItemsServiceTest {
    @Test
    public void test() throws Exception {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-ioc.xml", "classpath:spring-aop.xml"});
        ItemsService itemsService = (ItemsService) context.getBean("itemsServiceImpl");
        User user = new User();
        user.setUserId(1);
        List<Items> list = itemsService.showItemsByUser(user);
        for (Items item : list) {
            System.out.println(item.getItemNum() + "\t" + item.getItemUser().getUserId()+"\t"+item.getItemGoodsDetail().getGdGoods().getGoodsName()+"\t"+item.getItemGoodsDetail().getGdColor().getColorName()+"\t"+item.getItemGoodsDetail().getGdMemory().getMemoryName());
        }
    }
}
