import com.oracle.ssmphone.domain.Goods;
import com.oracle.ssmphone.mapper.*;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GoodMapperTest {
    @Test
    public void testGetLazy() {
        //获取spring容器
        ApplicationContext context = new ClassPathXmlApplicationContext(new String[]{"classpath:spring-ioc.xml", "classpath:spring-aop.xml"});
        GoodsMapper goodsMapper = (GoodsMapper) context.getBean("goodsMapper");
        Goods goods = goodsMapper.getLazy(1);
        System.out.println(goods.getGoodsName());
       System.out.println(goods.getGoodsBrand().getBrandName());
            System.out.println(goods.getColorList());
//        System.out.println(goods.getGoodsImgList());
//        System.out.println(goods.getLabelsList());
//        System.out.println(goods.getMemoryList());
    }
}
