import com.oracle.ssmphone.domain.Goods;
import com.oracle.ssmphone.mapper.GoodsDetailMapper;
import com.oracle.ssmphone.service.GoodService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GoodServiceTest {
    @Test
    public void testDetailsGoods() {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-ioc.xml", "classpath:spring-aop.xml"});
        GoodService goodService = (GoodService) context.getBean("goodServiceImpl");
        Goods good = goodService.detailsGoods(1);
        System.out.println(good.getGoodsName());//商品名称
        System.out.println(good.getGoodsBrand().getBrandName());//关联类型对象的类型名称
        System.out.println(good.getGoodsImgList());//商品的图片集合
        System.out.println(good.getMemoryList());//商品的内存集合
        System.out.println(good.getLabelsList());//商品的标签集合
        System.out.println(good.getColorList());//商品的颜色集合
    }
}
