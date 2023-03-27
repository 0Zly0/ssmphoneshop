# ssmphoneshop   实现全流程


SSM手机商城API
精通一门语言:
java
配套技术:
前端:html、css、js、 jquery、vue
数据库:mysql
后端:java:

web:b/s架构  浏览器服务器
 
MYBATIS
mybatis作用: 简化数据库操作
jdbc:java+数据库交互
如何搭建:
javase环境下测试
准备:
maven(可替代 )
idea
1.	引入依赖架包
pom.xml
<!--mybatis依赖-->
 <dependency>
     <groupId>org.mybatis</groupId>
     <artifactId>mybatis</artifactId>
     <version>3.5.2</version>
 </dependency>
 <!--mysql8驱动-->
 <dependency>
     <groupId>mysql</groupId>
     <artifactId>mysql-connector-java</artifactId>
     <version>8.0.22</version>
 </dependency>
 <!--log4j日志依赖-->
 <dependency>
     <groupId>log4j</groupId>
     <artifactId>log4j</artifactId>
     <version>1.2.17</version>
 </dependency>
 <!--junit依赖-->
 <dependency>
     <groupId>junit</groupId>
     <artifactId>junit</artifactId>
     <version>4.10</version>
     <scope>test</scope>
 </dependency>
2.配置mybatis核心文件
位置:main-resources      mybatis-config.xml
 
最基本配置:
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
        PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-config.dtd">
<!-- 通过这个配置文件完成mybatis与数据库的连接 -->
<configuration>
    <settings>
        <!-- 配置mybatis的log实现为LOG4J -->
        <setting name="logImpl" value="LOG4J"/>
        <!--启用驼峰转换-->
        <setting name="mapUnderscoreToCamelCase" value="true"/>
    </settings>
    <typeAliases>
        <!-- <typeAlias alias="Provider" type="cn.smbms.pojo.Provider"/> -->
        <!-- <package name="org.xja.phone2.entity"/>-->
    </typeAliases>
    <environments default="test">
        <environment id="test">
            <!--配置事务管理，采用JDBC的事务管理  -->
            <transactionManager type="JDBC"></transactionManager>
            <!-- POOLED:mybatis自带的数据源，JNDI:基于tomcat的数据源 -->
            <dataSource type="POOLED">
                <!--mysql8连接驱动(mysql5不一样)-->
                <property name="driver" value="com.mysql.cj.jdbc.Driver"/>
                <!--mysql8连接字符串(mysql5不一样)-->
                <property name="url"
                          value="jdbc:mysql://localhost/phonedb?characterEncoding=utf8&amp;useSSL=true&amp;serverTimezone=Asia/Shanghai"/>
               <!--数据库账号-->
                <property name="username" value="root"/>
                <!--数据库密码-->
                <property name="password" value="root"/>
            </dataSource>
        </environment>
    </environments>
    <!-- 将mapper文件加入到配置文件中 -->
   <!-- <mappers>
      <mapper resource="mapper/UserMapper.xml"/>
    </mappers>
 -->
</configuration>

3.加入mybatis工具类
新建utils包
 
复制工具类(MyBatisUtils.java)
 
import java.io.IOException;
import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
public class MyBatisUtil {
   private static SqlSessionFactory factory;
   static{//在静态代码块下，factory只会被创建一次
      try {
         //一定要与mybatis核心配置文件名称一致
         InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
         factory = new SqlSessionFactoryBuilder().build(is,"test");
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } 
   }
   
   public static SqlSession createSqlSession(){
      return factory.openSession(false);//true 为自动提交事务
   }
   
   public static void closeSqlSession(SqlSession sqlSession){
      if(null != sqlSession) 
         sqlSession.close();
   }
}
4.添加log4j配置文件
 
log4j.rootLogger=info,CONSOLE
#log4j.rootLogger=ERROR,ROLLING_FILE
log4j.logger.com.t6.mybatis.mapper=TRACE
log4j.logger.com.ibatis=info
log4j.logger.com.ibatis.common.jdbc.SimpleDataSource=info
log4j.logger.com.ibatis.common.jdbc.ScriptRunner=info
log4j.logger.com.ibatis.sqlmap.engine.impl.SqlMapClientDelegate=info
log4j.logger.java.sql.Connection=info
log4j.logger.java.sql.Statement=trace
log4j.logger.java.sql.PreparedStatement=debug
log4j.logger.java.sql.ResultSet=debug

log4j.appender.CONSOLE=org.apache.log4j.ConsoleAppender
log4j.appender.Threshold=error
log4j.appender.CONSOLE.Target=System.out
log4j.appender.CONSOLE.layout=org.apache.log4j.PatternLayout
log4j.appender.CONSOLE.layout.ConversionPattern= [%p] %d %c - %m%n
log4j.logger.com.opensymphony.xwork2=error  

5.测试mybatis数据库连接
新建测试类: 命名规范:Test结尾
 
 
运行测试方法:
 
 

MYBATIS的CRUD操作(Users为例)
准备工作(xml方式)
1.	完成项目规范的包结构
mapper接口(mapper)和实体类(domain)对应的包
 
新建mapper接口(命名规范:表名+Mapper)
 
先不要添加任何方法
 
实体类:实体类中属性要与表中字段对应
 
生成setter和 getter
 
 
 
 


映射文件配置
 
 
建议映射文件(UserMapper.xml)名称与Mapper接口对应
 
 
将映射文件注册到mybatis-config.xml配置
 

1.	查询
在 UserMapper接口中添加查询方法
 
在映射中文件(UserMapper.xml)注册该方法
 
 
记录mybatis操作  log.propertis修改配置(选中行调整为mapper接口所在的包)
 

测试:
 

测试代码:
 
2.带参查询
 
映射文件:
 
测试:
 
3.添加
 
 
测试
因为事务设置不自动提交, 所以手工提交事务
 


4.删除
 
 
 

5.修改
 
 
 

项目结构:  添加业务层
业务与Mapper之间的关系：
业务对应的是项目中功能，比如登陆、注册、转账等
Mapper的职能就是操作数据库，被业务方法所调用
如果该业务的实现需要操作数据库，将会调用Mapper来实现，而不是直接操作数据库：业务与数据库之间使用Mapper(数据层)进行衔接:业务依赖Mapper
 
 
 
 

新建接口的实现类(放在impl下:命名规范是业务接口+Impl)
 
实现接口，重写接口中方法(方法重写 )
 
 
 

补充业务方法(登陆方法login)
 
测试登陆:
 
注册:
 
 
测试:
 


分页
使用第三方组件:pageHelper
引入依赖
<!--pageHelper实现分页-->
<dependency>
    <groupId>com.github.pagehelper</groupId>
    <artifactId>pagehelper</artifactId>
    <version>5.1.10</version>
</dependency>
在mybatis-config.xml配置分页插件
 
<!--配置分页插件：注意位置-->
<plugins>
    <plugin interceptor="com.github.pagehelper.PageInterceptor">
        <property name="helperDialect" value="mysql"/>
        <property name="pageSizeZero" value="true"/>
    </plugin>
</plugins>
使用插件:
 
业务实现:
 
测试调用:
 

spring
1.	介绍spring
spring轻量级框架。作者音乐学专业
包含:IOC(控制反转:依赖注入(DI))、持久化操作、WEB框架(spring mvc)、AOP(面向切面编程)、web框架支持(整合其他web框架:struts等)、orm支持(整合其他orm框架,比如mybatis、hibernate等)
本质作用:管理项目、简化操作、增强可扩展性、可维护性
spring boot:简化spring配置(本质:集成了 tomcat服务器、默认了常见配置)
spring cloud:基于spring boot实现分布式
搭建(使用IOC):
a.添加依赖:
在pom.xml中增加如下配置:
<!--spring核心架包-->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-core</artifactId>
    <version>4.2.1.RELEASE</version>
</dependency>
<!--spring上下文依赖-->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>4.2.1.RELEASE</version>
</dependency>
b.增加spring配置文件
建议:resources下
 
头:
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd" >


</beans>
测试:
需求:创建一个User对象，封装属性，并打印
以下是常规方式:
 
 
生成toString()  (方法重写)
 
 
 


解释:
a, javabean  满足两个基本条件的类  公共类、公共的无参的构造(该构造可以是默认的)    
比如User  、UserServiceImpl
 

 
b.容器   容纳内容的“东西”
比如:tomcat  可以放置web应用   ,称为web容器
bean 容器:盛放javabean的容器  (比如spring IOC)

2.	使用ioc
本质:把javabean的创建和管理(如有依赖则根据要求注入)交给spring，使用的时候直接从bean容器中获取
以下是spring方式(XML方式):
在spring.xml中配置:
 
使用:
 
 案例:  使用spring管理业务
 
测试:
 
调整为注解方式:
 
业务实现:
 
测试同上(注意从容器查找bean时的名字要调整)
 


3.	整合spring+mybatis
思考问题:
mapper是否可以交给spring管理?
mapper的工作需要:
a.	 需要数据库连接(默认连接池)
b.	 获取mapper的代理对象
答案是可以(sm整合:使用德鲁伊连接池)
实现步骤:
引入依赖增加:
<!--spring orm依赖-->
 <dependency>
     <groupId>org.springframework</groupId>
     <artifactId>spring-orm</artifactId>
     <version>4.2.1.RELEASE</version>
 </dependency>
 <!--mybatisspring依赖-->
 <dependency>
     <groupId>org.mybatis</groupId>
     <artifactId>mybatis-spring</artifactId>
     <version>2.0.7</version>
 </dependency>
 <!--使用阿里出品的德鲁伊连接池-->
 <dependency>
     <groupId>com.alibaba</groupId>
     <artifactId>druid</artifactId>
     <version>1.2.14</version>
 </dependency>
添加德鲁伊配置
 
jdbc.driverClassName=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://localhost/phonedb?characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Shanghai
jdbc.username=root
jdbc.password=root
jdbc.maxActive=50
jdbc.maxWait=60000
jdbc.testWhileIdle=false
修改spring.xml
 
<!--配置德鲁伊文件的位置-->
<context:property-placeholder location="classpath:druid.properties"/>
<!--配置连接池做为数据源(连接池和数据源的关系就是电池和电源的关系)-->
<bean id="ds" class="com.alibaba.druid.pool.DruidDataSource">
    <property name="driverClassName" value="${jdbc.driverClassName}"/>
    <property name="url" value="${jdbc.url}"/>
    <property name="username" value="${jdbc.username}"/>
    <property name="password" value="${jdbc.password}"/>
    <property name="maxActive" value="${jdbc.maxActive}"/>
    <property name="maxWait" value="${jdbc.maxWait}"/>
    <property name="testWhileIdle" value="${jdbc.testWhileIdle}"/>
</bean>
<!--配置sqlsessionFactory:获取session使用-->
<bean id="sf" class="org.mybatis.spring.SqlSessionFactoryBean" >
    <!--注入依赖的ds-->
    <property name="dataSource" ref="ds"/>
    <!--指定mybatis-config.xml位置-->
    <property name="configLocation" value="classpath:mybatis-config.xml"/>
    <!--指定映射文件*.xml所有xml文件-->
    <property name="mapperLocations" value="classpath:mapper/*.xml"/>
</bean>
Mybatis-config.xml去掉连接的配置和映射文件位置
 

测试:sf 是否可用
 
配置mapper
 
<!--配置mapper的代理-->
<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
    <!--指定mapper所在的包-->
    <property name="basePackage" value="com.oracle.ssmphone.mapper"/>
    <!--注入sf-->
    <property name="sqlSessionFactoryBeanName" value="sf"/>
</bean>
Mapper接口需要增加注解
 
测试Mapper:
 
到此mapper已经纳入spring管理

是否可以让 spring在业务中注入mapper?
 
测试:(不变)
 
常见错误:
在UserService中没有注入userMapper
正确做法:
 
直接创建UserService对象
正确做法:
 
如果有以上错误发生，会引发空指针
完整配置参考
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd">
    <!--扫描包下的注解-->
    <context:component-scan base-package="com.oracle.ssmphone.service.impl"/>
    <!--配置德鲁伊文件的位置-->
    <context:property-placeholder location="classpath:druid.properties"/>
    <!--配置连接池做为数据源(连接池和数据源的关系就是电池和电源的关系)-->
    <bean id="ds" class="com.alibaba.druid.pool.DruidDataSource">
        <property name="driverClassName" value="${jdbc.driverClassName}"/>
        <property name="url" value="${jdbc.url}"/>
        <property name="username" value="${jdbc.username}"/>
        <property name="password" value="${jdbc.password}"/>
        <property name="maxActive" value="${jdbc.maxActive}"/>
        <property name="maxWait" value="${jdbc.maxWait}"/>
        <property name="testWhileIdle" value="${jdbc.testWhileIdle}"/>
    </bean>
    <!--配置sqlsessionFactory:获取session使用-->
    <bean id="sf" class="org.mybatis.spring.SqlSessionFactoryBean" >
        <!--注入依赖的ds-->
        <property name="dataSource" ref="ds"/>
        <!--指定mybatis-config.xml位置-->
        <property name="configLocation" value="classpath:mybatis-config.xml"/>
        <!--指定映射文件*.xml所有xml文件-->
        <property name="mapperLocations" value="classpath:mapper/*.xml"/>
    </bean>
    <!--配置mapper的代理-->
    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <!--指定mapper所在的包-->
        <property name="basePackage" value="com.oracle.ssmphone.mapper"/>
        <!--注入sf-->
        <property name="sqlSessionFactoryBeanName" value="sf"/>
    </bean>
</beans>
4.	使用aop
面向切面编程
把多个方法中重复的代码提取出来，单独放在一个类中，在运行的时候加上。
优势：
注意力放在具体的业务实现上。
实现原理：使用代理。两种方式:1.jdk动态代理(接口代理) 2.cglib代理(不要求被代理的类实现接口)
spring使用代理时  如果被代理的类有接口，自动选择使用接口代理，没有接口，则使用cglib代理
使用:
a.	引入依赖
 <!--aop依赖-->
 <dependency>
     <groupId>org.springframework</groupId>
     <artifactId>spring-aop</artifactId>
     <version>4.2.1.RELEASE</version>
 </dependency>
<!--辅助必须的依赖-->
 <dependency>
     <groupId>org.aspectj</groupId>
     <artifactId>aspectjrt</artifactId>
     <version>1.6.11</version>
 </dependency>
 <dependency>
     <groupId>org.aspectj</groupId>
     <artifactId>aspectjweaver</artifactId>
     <version>1.6.11</version>
 </dependency>
b.使用aop给业务添加简单日志输出
 
编写前置增强(前置通知)
 
配置增强:spring-aop.xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/aop
       http://www.springframework.org/schema/aop/spring-aop.xsd
       http://www.springframework.org/schema/tx
       http://www.springframework.org/schema/tx/spring-tx.xsd">
   <!--配置前置增强bean-->
<bean id="logBefore" class="com.oracle.ssmphone.advices.BeforeLog"></bean>
   <!--结合方法-->
<aop:config>
    <!--切入点表达式  第一个*:所有返回类型 .. 代表参数-->
    <aop:pointcut id="pc" expression="execution(public * com.oracle.ssmphone.service.*.*(..)) "/>
    <!--增强和切入点结合:织入-->
    <aop:advisor advice-ref="logBefore" pointcut-ref="pc"/>
</aop:config>
</beans>
execution(public *(任意返回类型) com.oracle.ssmphone.service.*(任意类或者接口).*(任意方法)(..(任意参数))) 
注意:
 
从容器中获得的bean,如果该bean对应的类有接口(UserServiceImpl有接口UserService)，spring采用接口代理,类型转换时使用接口(原因时代理类与被代理类实现了相同的接口但不是同一类型)
5.	完善 spring+mybatis
加上aop来处理事务。
当前调用一次mapper便提交事务，关闭sesssion。不合理
合理做法是调业务之前开启事务，业务调用完毕提交事务，如果有异常则回滚事务
比如转账业务(我向新阳转10元):
转账是业务，设计一个业务方法.
业务方法需要操作数据库，操作数据库调用mapper完成.
a.	调用mapper修改我的余额
b.	调用mapper修改新阳的余额
c.	记录流水
a b c全部成功后提交事务。任意一部出错则回滚事务
具体实现:
spring-aop.xml文件
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/aop
       http://www.springframework.org/schema/aop/spring-aop.xsd
       http://www.springframework.org/schema/tx
       http://www.springframework.org/schema/tx/spring-tx.xsd">
    <!--事务管理器-->
    <bean id="tm" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <!--ds在spring.xml中配置-->
        <property name="dataSource" ref="ds"/>
    </bean>
    <!--事务增强-->
    <tx:advice id="trAdvice" transaction-manager="tm">
        <tx:attributes>
            <!--show开头的方法  事务传播:SUPPORTS 支持当前事务-->
            <tx:method name="show*" propagation="SUPPORTS" read-only="true"/>
            <tx:method name="login" propagation="SUPPORTS" read-only="true"/>
            <!--其余方法-->
            <tx:method name="*" rollback-for="Exception"/>
        </tx:attributes>
    </tx:advice>

    <aop:config>
        <aop:pointcut id="pc" expression="execution(public * com.oracle.ssmphone.service.*.*(..))"/>
        <aop:advisor advice-ref="trAdvice" pointcut-ref="pc"/>
    </aop:config>


</beans>
测试:
 
到此sm整合完善

spring整合mybatis
关键点:
a.	使用ioc管理bean
依赖关系:
控制器 -->service(功能:注解方式)-->mapper(操作数据库:注解方式)-->sqlsessionFactory(配置方式)-->datasource(配置方式:数据库连接相关)
b.	使用aop管理事务

默认:mapper的方法每次调用完毕会提交事务，关闭session  :不合理
正确:业务方法调用该业务所需的所有mapper中方法，提交事务，关闭session。如果有异常则事务回滚(撤销数据库操作)  策略:aop控制事务
关键点:使用框架提供的事务增强(依赖事务管理器-->依赖datasource)
事务增强与业务方法结合
6.	spring mvc(web环境)
搭建:
a.依赖
<!--servlet依赖:必须-->
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>4.0.1</version>
    <scope>provided</scope>
</dependency>
<!--web依赖:建议添加-->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-web</artifactId>
    <version>4.2.1.RELEASE</version>
</dependency>
<!--mvc依赖:必须-->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>4.2.1.RELEASE</version>
</dependency>
b.配置web.xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    <!--配置mvc核心控制器:该servlet由spring框架提供-->
    <servlet>
        <!--配置servlet名字:可以自定义-->
        <servlet-name>mvc</servlet-name>
        <!--类:spring框架提供-->
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <!--配置spring-mvc.xml路径-->
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:spring-mvc.xml</param-value>
        </init-param>
    </servlet>
    <servlet-mapping>
        <!--配置servlet名字:与上面的名字保持一致-->
        <servlet-name>mvc</servlet-name>
        <!--请求路径/ 除了jsp之外所有请求均由核心控制器处理-->
        <url-pattern>/</url-pattern>
    </servlet-mapping>
</web-app>
c.在resourses下增加spring-mvc.xml
 
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd
       http://www.springframework.org/schema/context
       http://www.springframework.org/schema/context/spring-context.xsd
http://www.springframework.org/schema/mvc
http://www.springframework.org/schema/mvc/spring-mvc.xsd">

</beans>
测试:
 
 
创建控制器:
 
spring-mvc.xml配置
 
启动tomcat并访问UserController
 

缓存问题:错误代码或者配置调整之后，没有被加载
解决方案如下(顺序):
a.	删除 target
 
b.重新构建
 
c.使用 maven 打包
 
abc步骤后尝试运行
如果仍然未加载新修改的内容
做法:
a.	重启idea
b.	仍未解决则重新配置tomcat
c.	仍未解决重启电脑

基本原理:
输入http://localhost:8088/ssmphone_war_exploded/user/login
tomcat接到该请求----不是jsp结尾 ---进入核心控制器(mvc工作流程)---DispatcherServlet开始工作----根据user/login扫描注解并找控制器(严格意义称为
 

处理器更合适(handler))---将本次请求委派给该控制器处理
7.	ssm整合
 
 
 
建议:
调整核心控制器加载优先级
 
控制器处理:
 
测试:
 
业务对象已成功创建,测试成功

项目前热身
规范建议:
样式、js、图片放在static下
jsp放在WEB-INF下
欢迎页:
 


 
原因:被spring拦截, web.xml 配置/,所以样式图片被拦截
解决方案:
配置静态资源放行
 
 
客户端向服务端提交数据乱码问题
在web.xml中添加一个过滤器
位置:
 

<!-- 配置中文乱码过滤器 -->
    <filter>
        <filter-name>characterEncodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <!-- 初始化过滤器 -->
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
    </filter>
    <filter-mapping>
        <filter-name>characterEncodingFilter</filter-name>
        <!-- 拦截所有请求 -->
        <url-pattern>/*</url-pattern>
    </filter-mapping>

1.在控制器中接收参数
前端:前端组件加name
 
 

控制器中:
 
测试:
启动服务器
2.存值
登陆信息、购物车等客户端独有的信息存入session
 

其他信息一般存入request
 

3.跳转
默认请求转发:
 
使用视图解析器进行简化:
在spring-mvc.xml添加
 
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
   <!--跳转路径前缀-->
    <property name="prefix" value="/WEB-INF/"/>
    <!--跳转路径后缀-->
    <property name="suffix" value=".jsp"/>
</bean>
跳转路径简化:
 

转发后样式图片js无法找的问题:
 
问题出现的原因:转发时url 停留在上一个url
比如:
 
样式使用相对路径:
 
因为相对路径是相对当前url，造成样式无法找到
 
解决方案:
添加base标签
引入依赖
 
在页面上增加base
 

4.视图(页面)取值显示
 

操作数据字典
新表:
登陆
一个实体
 

一个FunsMapper
 




一个映射文件
 
一个业务接口和业务实现
 
显示
 
 
一个控制器:
 

前端显示:
 
 
修改UserController
 
完善登陆失败的错误提醒:
 
index.jsp :
 
删除:
mapper添加删除方法(基本方法提前设计好：插件等)
温馨提示:
物理删除:真正从数据库删除  delete
逻辑删除(使用频度高):没有真正删除     update 做法: 增加一个标记是否删除的字段   0:代表未删除  1:代表已删除
案例展示:物理删除
 
 
业务:
 
 
控制器(Controller    MVC中C):
 
视图:(view 前端页面  MVC中V)
 

添加:
前端界面: 元素name对应Funs实体属性
 
解释:
WEB-INF下的页面只能通过控制转发到达
 
路由控制器:
rout/saveFun
return "saveFun"  因为有视图解析器:到达/WEB-INF/saveFun.jsp
 
控制器:
 
Mapper:
 
映射文件:
 
实体:
 
控制器中处理level
 
处理下拉框:
 
思路:
点击超链转向 saveFun.jsp前应该查询一级字典fun_level为1
 
mapper添加方法:
 

映射文件:
 
业务:
 
 
路由控制器处理:
 
解释:
存值可以使用ModelAndView也可以使用Map类型的model
 
 
 测试结果  ：
 
 
常见错误:
 
错误原因:违反主外键约束
不建议的做法,设置数据级联删除
 
建议做法:删除1级的前，先删除引用该1级的2级记录
 

 

 

依然报错:
 
错误的原因同上，主外键约束问题
删除funs中记录时，造成了permission记录孤立
解决方案:删除该表中子记录或者使用数据库的级联删除
 

修改:
 
路由控制器:
 
mapper和service省略
updateFun.jsp
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<base href="${pageContext.request.contextPath}/"/>
<head>
    <meta charset="utf-8" />
    <title>编辑页</title>
    <link rel="stylesheet" href="static/css/bootstrap.css" />
</head>
<body>
<div class="container">
    <div class="col-md-4 col-lg-offset-4">
        <form action="fun/update" method="post">
            <!--更新需要id-->
            <input type="hidden" name="funId" value="${fun.funId}"/>
            <table class="table table-bordered table-condensed">
                <tr>
                    <td>名称:</td>
                    <td><input type="text"  name="funName" value="${fun.funName}"  /> </td>
                </tr>
                <tr>
                    <td>URL:</td>
                    <td><input type="text" name="funUrl" value="${fun.funUrl}" /> </td>
                </tr>
                <tr>
                    <td>父级ID:</td>
                    <td>
                        <select name="funPid">
                            <option value="">请选择</option>
                         <c:forEach var="f" items="${list}">
                             <option value="${f.funId}"
                             <c:if test="${f.funId == fun.funPid}">
                                     selected
                             </c:if>
                             >${f.funName}</option>

                         </c:forEach>
                        </select>

                    </td>
                </tr>
                <tr>
                    <td>TARGET:</td>
                    <td><input type="text"  name="funTarget" value="${fun.funTarget}"/> </td>
                </tr>
                <tr>
                    <td>SORT:</td>
                    <td><input type="text"  name="funSort" value="${fun.funSort}"/> </td>
                </tr>

                <tr>
                    <td colspan="2" class="text-center">
                        <input type="submit" value="保存" />
                        <input type="reset" value="重置" />
                    </td>

                </tr>
            </table>
        </form>

    </div>
</div>
</body>
</html>

mapper:
 
 

service:
 
 
控制器:
 
更新流程:
 点击“编辑”---->(根据id取本条记录)详情页---->保存---->控制器---->调用业务---->调用mapper
手机商城实战:
后台:
基本流程:
 
实战:
后台
目录结构:
样式图片等:
 
页面:
 
后端登陆:
http://localhost:8088/ssmphone_war_exploded/
 
后端主界面:
 

前端:
 
前端登录页:
 

实现:
模块1:后台登陆
界面:
 
登陆后主界面:
 
 

表:
 
实体:(不写setter和 getter)
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.16.20</version>
    <scope>provided</scope>
</dependency>
 

控制器:
 
解释:
先跑通流程，然后添加业务
业务:(省略)
mapper:(省略)
 

模块2：菜单生成
数据表:
 
页面: 
分析:
二级菜单:
 
fun_level为1的是一级菜单
fun_level为2的为二级子菜单
一级和二级菜单关联：
 
解决问题:
查询所有的一级菜单，同时把对应的二级菜单也查询处理
解决方案:
 
 
实体:(一对多关联)
 
service: 
控制器:
 

视图上展示:
 
 


模块3:功能管理
显示:
 
 
 
 


新增:
 
 
页面效果:
 

 
查询:
 
查询:
如果不填写则视为不做条件
模糊查询
 
控制器:
 
业务:
 
 
mapper:
 
映射文件:动态sql
 
<select id="showFuns" resultType="Funs">
    select *
    from funs
    <where>
        <if test="funName!=null and funName!=''">
            and fun_name like concat('%',#{funName},'%')
        </if>
        <if test="funTarget!=null and funTarget!=''">
            and fun_target =#{funTarget}
        </if>
        <if test="funLevel!=null">
            and fun_level =#{funLevel}
        </if>
    </where>
    order by fun_sort
</select>
分页:
 

控制器：
 
mapper和映射文件不变
页面处理:将list替换为pv.list
 
 
实现效果:
 
新增:
 
 
 
删除:
 

模块4:商品类型管理

 
将funs文件夹复制到桌面
修改文件夹名称:
 
复制到admin下:
 
先让流程跑通:
 
 
 
控制器:
 

业务:
 
 
 


实体:
 

Mapper:
 

映射文件:

 

填充控制器:
 
 

其他模块参考Fun处理
注意:
点击添加到达save.jsp时，不需要查询,不需要修改路由控制器ToCtroller
点击编辑到达update.jsp时，需要查询，需要修改路由控制器
 
为了保持路由控制器统一性,不再添加参数
 
funId对应:
 
模块4：商品类型管理
数据表:
 
对应菜单:
 
模块5:订单管理
 
功能：
查看：全部订单、未付款订单、待发货订单、订单详细信息（明细、收货信息等）

订单在本项目中的关联：
订单数据的产生由购买者想购买物品时下订单产生
前端订单和后台订单区别：
前端订单只能维护登陆用户的,比如查看自己的订单、取消订单等
后台订单时所有购买者下的
表:
 

orders:订单 
 
依次为:
订单编号
下单用户编号
订单日期
联系人姓名
联系电话
订单地址
订单总价
订单状态编号

order_details:订单明细
 
明细编号
订单编号
商品详情编号
数量
价格

order_status：订单状态
 
状态编号
状态
 

order_recipients:订单接收信息
 
编号、收货人、收货地址、电话、用户编号、是否签收
实施第一步:
跑通流程:
 
目录:
 
控制器:
 
流程跑通后的效果:
 
 
 
 

实体的处理:多对一关(订单和订单用户、订单和订单状态)联和一对多(订单和订单明细)  
注意:外键所在的一方是多方
 
需要存在的Mapper接口:
 

OrderMapper.xml映射文件:
 
 

要求:
 
 
<resultMap id="orderStatusMap" type="OrderStatus">
    <result property="statusId" column="status_id" javaType="java.lang.Integer"/>
    <result property="statusName" column="status_name" javaType="java.lang.String"/>
</resultMap>

 
<resultMap id="userMap" type="User">
    <result property="userId" column="user_id" javaType="java.lang.Integer"/>
    <result property="userName" column="user_name" javaType="java.lang.String"/>
    <result property="userPass" column="user_pass" javaType="java.lang.String"/>
    <result property="userPhone" column="user_phone" javaType="java.lang.String"/>
</resultMap>
控制器:
 

查询:
分析:
全部、未付款、待发货使用相同的页面。
查询时不同页面过来，点击查询时条件不一样：带状态
 
注意会员名name
控制器:
 

业务:
 
 
Mapper:
 
映射文件:
 
<select id="findOrderByStatusId" resultMap="orderMap">
    SELECT o.*, u.*, s.*
    FROM orders o
    LEFT JOIN users u ON o.order_user_id = u.user_id
    LEFT JOIN order_status s ON o.order_status_id = s.status_id
    <where>
        <if test="statusId!=null">
            and s.status_id = #{statusId}
        </if>
        <if test="order.orderId!=null and order.orderId!=''">
            and order_id like concat('%',#{order.orderId},'%')
        </if>
        <if test="order.orderUser!=null and order.orderUser.userName!='' and  order.orderUser.userName!=null">
            and u.user_name =#{order.orderUser.userName}
        </if>
        <if test="order.orderName!=null and order.orderName!=''">
            and order_name =#{order.orderName}
        </if>
        <if test="order.orderPhone!=null and order.orderPhone!=''">
            and order_phone =#{order.orderPhone}
        </if>
    </where>
    order by o.order_user_id ,o.order_time desc
</select>
订单查看:
跑通流程:
 
 
分析：
订单查看时需要显示订单相关信息:
订单中包含订单明细集合(one  to many) 代码封装
订单明细中关联商品明细(many to one)  mybatis封装
商品明细中关联颜色、商品、内存(many to one)mybatis封装

层级三层:
订单-订单明细-商品明细-颜色、内存、商品
具体实现建议:
1.	先根据商品明细编号，关联查询商品
 
 

测试:
 
查询订单明细:
 

 
测试:
 


查询订单:
 
 
 
 
控制器:
 


模块6商品管理
功能:商品列表、查询、分页、查看商品详情、新品上架、下架、修改
 


 

数据表:
商品表
 
类型(品牌:多对一)
 
一对多:商品图片可以多张
 

多对多:
颜色:
 
 
内存:
 
 
标签:
 
 

功能要求:
 
商品列表显示名称、价格、品牌、库存
查询条件:名称(模糊查询)、品牌、价格区间
思考问题:
价格是一个区间，无法用现有的实体存价格最大值和最小值
解决方案:增加SearchVo实体类存储查询条件
 
前端页面查询组件的name与SearchVo中属性保持一致
 
控制器:
 
业务:
 
 
Mapper:
 
映射文件:
 
页面效果:
 
点击查询:
 
商品详情:
 
控制器:
 
业务:
 
 
Mapper处理:
 
实体类:
 

映射文件:
 
本次查询所涉及映射文件:
goodMapper.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.oracle.ssmphone.mapper.GoodsMapper">
    <resultMap id="goodsMap" type="Goods">
        <id property="goodsId" column="goods_id" javaType="java.lang.Integer"/>
        <result property="goodsName" column="goods_name" javaType="java.lang.String"/>
        <result property="goodsPrice" column="goods_price" javaType="java.lang.Double"/>
        <result property="goodsImg" column="goods_img" javaType="java.lang.String"/>
        <result property="goodsIntr" column="goods_intr" javaType="java.lang.String"/>
        <result property="goodsDesc" column="goods_desc" javaType="java.lang.String"/>
        <result property="goodsSpec" column="goods_spec" javaType="java.lang.String"/>
        <result property="goodsPack" column="goods_pack" javaType="java.lang.String"/>
        <result property="goodsServ" column="goods_serv" javaType="java.lang.String"/>
        <result property="goodsEval" column="goods_eval" javaType="java.lang.Integer"/>
        <result property="goodsNum" column="goods_num" javaType="java.lang.Integer"/>
        <!--多对一关联类别-->
        <association property="goodsBrand" resultMap="com.oracle.ssmphone.mapper.BrandMapper.brandMap"/>
        <!--多对多关联-->
        <collection property="colorList" ofType="Color" resultMap="com.oracle.ssmphone.mapper.ColorMapper.colorMap"/>
        <collection property="labelsList" ofType="Labels" resultMap="com.oracle.ssmphone.mapper.LabelMapper.labelMap"/>
        <collection property="memoryList" ofType="Memory"
                    resultMap="com.oracle.ssmphone.mapper.MemoryMapper.memoryMap"/>
        <!--一对多关联-->
        <collection property="goodsImgList" ofType="GoodsImg"
                    resultMap="com.oracle.ssmphone.mapper.GoodsImgMapper.goodsImgMap"/>
    </resultMap>
    <select id="get" resultMap="goodsMap">
        SELECT g.*, b.*, color.*, gi.*, l.*, m.*
        FROM goods g
                 LEFT JOIN brands b ON g.goods_brand_id = b.brand_id
                 LEFT JOIN goods_color gc ON gc.gc_goods_id = g.goods_id
                 LEFT JOIN sku_color color ON color.color_id = gc.gc_color_id
                 LEFT JOIN goods_img gi ON gi.img_goods_id = g.goods_id
                 LEFT JOIN goods_label gl ON gl.gl_goods_id = g.goods_id
                 LEFT JOIN labels l ON l.label_id = gl.gl_label_id
                 LEFT JOIN goods_memory gm ON gm.gm_goods_id = g.goods_id
                 LEFT JOIN sku_memory m ON m.memory_id = gm.gm_memory_id
        where g.goods_id = #{goodsId}
    </select>
    <select id="find" resultMap="goodsMap">
        select g.*,b.*
        from goods g
        left join brands b on g.goods_brand_id = b.brand_id
        <where>
            <if test="goodsName!=null and goodsName!=''">
                and g.goods_name like concat('%',#{goodsName},'%')
            </if>
            <if test="brandId!=null">
                and g.goods_brand_id =#{brandId}
            </if>
            <if test="prMin!=null">
                and g.goods_price &gt;=#{prMin}
            </if>
            <if test="prMax!=null and prMax!=-1">
                and g.goods_price &lt;=#{prMax}
            </if>
        </where>
        order by g.goods_id
    </select>

</mapper>
BrandMapper.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!--命名空间(namespace指向Mapper接口)-->
<mapper namespace="com.oracle.ssmphone.mapper.BrandMapper">
    <resultMap id="brandMap" type="Brands">
        <result property="brandId" javaType="java.lang.Integer" column="brand_id"/>
        <result property="brandName" javaType="java.lang.String" column="brand_name"/>
    </resultMap>
    <select id="find" resultType="Brands">
        select *  from brands
        <where>
            <if test="brandName!=null and brandName!=''">
                and brand_name like concat('%',#{brandName},'%')
            </if>
        </where>
        order by brand_id
    </select>
    <delete id="delete">
        delete  from brands  WHERE brand_id = #{brandId}
    </delete>
    <insert id="save">
        INSERT INTO brands (brand_name) VALUES (#{brandName})
    </insert>
    <select id="get" resultType="Brands">
        SELECT *    FROM brands   WHERE brand_id = #{brandId}
    </select>
    <update id="update">
        update brands    set brand_name=#{brandName}    WHERE brand_id = #{brandId}
    </update>
</mapper>
colorMapper.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.oracle.ssmphone.mapper.ColorMapper">
    <resultMap id="colorMap" type="Color">
        <id column="color_id" property="colorId" javaType="java.lang.Integer"/>
        <result column="color_name" property="colorName" javaType="java.lang.String"/>
    </resultMap>


</mapper>
labelMapper.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.oracle.ssmphone.mapper.LabelMapper">
    <resultMap id="labelMap" type="Labels">
        <id property="labelId" column="label_id" javaType="java.lang.Integer" />
        <result property="labelName" column="label_name" javaType="java.lang.String" />
    </resultMap>


</mapper>
MemoryMapper.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.oracle.ssmphone.mapper.MemoryMapper">
    <resultMap id="memoryMap" type="Memory">
        <id column="memory_id" property="memoryId" javaType="java.lang.Integer"/>
        <result column="memory_name" property="memoryName" javaType="java.lang.String"/>
    </resultMap>


</mapper>
GoodsImgMapper.xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.oracle.ssmphone.mapper.GoodsImgMapper">
    <resultMap id="goodsImgMap" type="GoodsImg">
        <id column="memory_id" property="imgId" javaType="java.lang.Integer"/>
        <result column="img_big" property="imgBig" javaType="java.lang.String"/>
        <result column="img_small" property="imgSmall" javaType="java.lang.String"/>

    </resultMap>


</mapper>
GoodService测试:
 
页面效果:
 

新品上架:
 
功能要求:
外观:文件上传(一个)
品牌:下拉框选择 (brands表)
颜色、内存、标签用复选框选择，对应的表分别为sku_color、sku_memory、labels
图片:多张图(本次实现使用1张图，大家可以使用文件上传组件，实现多图选择上传和预览效果)
描述、规格参数、售后、包装使用富文本编辑器
 
映射文件:
 
 
富文本编辑
 
<dependency>
    <groupId>com.googlecode.json-simple</groupId>
    <artifactId>json-simple</artifactId>
    <version>1.1.1</version>
</dependency>
<dependency>
    <groupId>commons-fileupload</groupId>
    <artifactId>commons-fileupload</artifactId>
    <version>1.3.2</version>
</dependency>
 
 
//根目录路径，可以指定绝对路径，比如 /var/www/attached/
String rootPath = pageContext.getServletContext().getRealPath("/") + "/static/images/";
   System.out.println(rootPath);
//根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
String rootUrl  = request.getContextPath() + "/static/images/";
save.jsp
 
<link rel="stylesheet" type="text/css" href="../kindeditor/themes/default/default.css">
<link rel="stylesheet" type="text/css" href="../kindeditor/plugins/code/prettify.css">
<script type="text/javascript" src="../kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="../kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="../kindeditor/plugins/code/prettify.js"></script>
<script>
  KindEditor.ready(function(K) {
    var editor1 = K.create('#goodsDesc', {
      cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
      uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
      fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
    });
    var editor2 = K.create('#goodsSpec', {
      cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
      uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
      fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
    });
    var editor3 = K.create('#goodsPack', {
      cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
      uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
      fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
    });
    var editor4 = K.create('#goodsServ', {
      cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
      uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
      fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
    });
  });
</script>
<link rel="stylesheet" type="text/css" href="../kindeditor/themes/default/default.css">
<link rel="stylesheet" type="text/css" href="../kindeditor/plugins/code/prettify.css">
<script type="text/javascript" src="../kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="../kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript" src="../kindeditor/plugins/code/prettify.js"></script>
<script>
  KindEditor.ready(function(K) {
    var editor1 = K.create('#goodsDesc', {
      cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
      uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
      fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
    });
    var editor2 = K.create('#goodsSpec', {
      cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
      uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
      fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
    });
    var editor3 = K.create('#goodsPack', {
      cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
      uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
      fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
    });
    var editor4 = K.create('#goodsServ', {
      cssPath : '${pageContext.request.contextPath}/static/kindeditor/css/prettify.css',
      uploadJson : '${pageContext.request.contextPath}/static/kindeditor/upload_json.jsp',
      fileManagerJson : '${pageContext.request.contextPath}/static/kindeditor/file_manager_json.jsp'
    });
  });
</script>
文件上传
富文本和文件上传所需依赖:
<dependency>
    <groupId>com.googlecode.json-simple</groupId>
    <artifactId>json-simple</artifactId>
    <version>1.1.1</version>
</dependency>
<dependency>
    <groupId>commons-fileupload</groupId>
    <artifactId>commons-fileupload</artifactId>
    <version>1.3.2</version>
</dependency>
<dependency>
    <groupId>commons-io</groupId>
    <artifactId>commons-io</artifactId>
    <version>2.6</version>
</dependency>
spring配置文件:
 
<!--文件上传解析器:注意id写法-->
<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
    <property name="maxUploadSize" value="5000000"/>
    <property name="defaultEncoding" value="UTF-8"/>
</bean>
页面的处理:
 
对应实体:
 
控制器:
 
新品上架：
点击上架，经过路由控制器，取出品牌集合、内存集合、颜色集合、标签集合
数据库写入:
商品表:goods
商品标签关系表:goods_labels
商品颜色关系表:goods_color
商品内存关系表:goods_memory
商品图片表:goods_img
页面组件name处理:
多对一关联品牌:
 
 
 
多对多关联颜色:
 
 
 
 
控制器:
 
业务:
参考素材
Mapper:
参考素材
映射文件:
参考素材
处理商品图片:
 
表单中组件name: 注意不要与Goods属性名字一致，建议方式属性名File
 

 

 


商品下架：
物理删除:(不建议)
先删除关联表中的数据，在删除商品
逻辑删除(建议):
 
不需要在实体中关联.
下架时更改isDel字段值为0
查询商品时加条件  isDel    is  null(未下架)
视图:
 
控制器:
 
业务:
 
 
Mapper:
 
映射文件:
 
注意:查询商品时加上goodsid is null
GoodMapper.xml
 
编辑商品:
 
路由控制器:
 
模块7：首页显示
二级缓存和延迟加载
一级缓存:是框架默认为我们开启的，我们不需要做任何配置,是SqlSession级别的缓存，在操作数据库的时候需要创建一个SqlSession，其中有一个HashMap，用于存储缓存数据。不同的SqlSession之间，其缓存数据的HashMap是不同的。所以当我们多次调用同一个Mapper和同一个方法的同一个参数，只会进行一次数据库查询，然后把数据缓存到缓冲中，以后直接先从缓存中取出数据，不会直接去查数据库。但是不同的SqlSession对象，因为不同的SqlSession都是相互隔离的，所以相同的Mapper、参数和方法，他还是会再次发送到SQL到数据库去执行，返回结果。

二级缓存:是 mapper 级别的缓存，多个sqlSession去操作同一个Mapper的sql，不管Sqlsession 是否相同，只要 mapper 的 namespace相同就能共享数据。也可以称之为 namespace 级别的缓存 。sqlSession 关闭后(close) ，一级缓存的数据会保存到二级缓存中，新的相同的查询语句就会去二级缓存中去查询。二级缓存是Mapper级别的缓存，多个SqlSession去操作同一个Mapper中的SQL语句，则这些SqlSession可以共享二级缓存，即二级缓存是跨SqlSession的。
开启二级缓存
mybatis全局配置
<settings>    <!-- 开启二级缓存 -->    <setting name="cacheEnabled" value="true" /></settings>
mapper映射文件中使用二级缓存
<!-- 开启本mapper所在namespace的二级缓存 -->
<cache />
<!-- 通过设置useCache也可以针对某个select语句关闭二级缓存 -->
<select id="selectAll" resultType="User" useCache="false">
        select *from user
</select>
 
<!--
<cache
  eviction="FIFO"
  flushInterval="60000"
  size="512"
  readOnly="true"/>
这个更高级的配置创建了一个 FIFO 缓存，每隔 60 秒刷新，最多可以存储结果对象或列表的 512 个引用，
而且返回的对象被认为是只读的，因此对它们进行修改可能会在不同线程中的调用者产生冲突。 
 可用的清除策略有：
    LRU – 最近最少使用：移除最长时间不被使用的对象。
    FIFO – 先进先出：按对象进入缓存的顺序来移除它们。
    SOFT – 软引用：基于垃圾回收器状态和软引用规则移除对象。
    WEAK – 弱引用：更积极地基于垃圾收集器状态和弱引用规则移除对象。
默认的清除策略是 LRU。
flushInterval（刷新间隔）属性可以被设置为任意的正整数，设置的值应该是一个以毫秒为单位的合理时间
量。 默认情况是不设置，也就是没有刷新间隔，缓存仅仅会在调用语句时刷新。
size（引用数目）属性可以被设置为任意正整数，要注意欲缓存对象的大小和运行环境中可用的内存资源。默
认值是 1024。
readOnly（只读）属性可以被设置为 true 或 false。只读的缓存会给所有调用者返回缓存对象的相同实
例。 因此这些对象不能被修改。这就提供了可观的性能提升。而可读写的缓存会（通过序列化）返回缓存对
象的拷贝。 速度上会慢一些，但是更安全，因此默认值是 false。 
-->
注意:需要将要存储数据的 实体类实现 Serializable接口，为了将数据取出做反序列化操作， 因为二级的缓存的存储方式多种多样，有可能存储在内存中，也可能储存到磁盘中。如果我们要再取这个缓存的话，就需要反序列化了。所以建议mybatis中的pojo都去实现Serializable接口。

内存、颜色、便签由于在本项目中未更新，且查询频度高，适合开启二级缓存，提升 查询效率(也可以使用监听器监听ServletContext并在初始化时查询，存入application)

首页goods/list.jsp显示流程:
设置欢迎页
 
index.jsp:
 
控制器中:
 
Mapper:把标签id做为查询条件:
 需要注意:牵扯一对多或者多对多查询时，分页查询会有问题。可以采用子查询做条件
 


模块8:查找
参考首页实现
模块9；商品详情
流程:
 
点击商品图片，根据id查询商品,显示商品详情
 
控制器:
 
测试效果:
 

模块10：购物车
模块11；会员注册、登陆
验证码:
<div class="lg-username input-item clearfix">
    <i class="iconfont">&#xe664;</i>
    <input type="text" placeholder="输入四位验证码" name="captcha" id="captcha" onkeypress="onInputKeyup();" style="width:105px;" />
        <img src="checkCaptchaCode.do" id="createCheckCode" onclick="changeCaptcha();" align="middle" style="width:150px;"/>  
</div>

//生成验证码图片  
    @ResponseBody
    @RequestMapping(value = "/checkCaptchaCode.do", method = RequestMethod.GET)  
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws Exception{ 
        //第一个参数是生成的验证码，第二个参数是生成的图片  
        Object[] objs = ImageUtil.createImage();  
        //将验证码存入Session  
        request.getSession(true).setAttribute("validateCode",objs[0]);  
        //将图片输出给浏览器  
        BufferedImage image = (BufferedImage) objs[1];  
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache"); 
        response.setHeader("Cache-Control", "no-cache"); 
        response.setDateHeader("Expires", 0); 
        response.setContentType("image/jpeg"); 
        OutputStream os = response.getOutputStream();  
        ImageIO.write(image, "jpeg", os); 
        os.flush();
    }

public class ImageUtil {
    public static Object[] createImage() {
        Object[] obj = new Object[2];
        int width = 60;
        // 验证码图片的高度。
        int height = 18;
        // 验证码字符个数
        int codeCount = 4;
        int x = 0;
        // 字体高度
        int fontHeight;
        int codeY;
        x = width / (codeCount + 1);
        fontHeight = height - 2;
        codeY = height - 4;
        char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J',
                'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
                'X', 'Y','3', '4', '5', '6', '7', '8', '9','a','b','c','d','e','f','g','h',
                'j','k','m','n','r','s','t','u','v','w','x','y'};
        //定义图像buffer
        BufferedImage buffImg = new BufferedImage(
        width, height,BufferedImage.TYPE_INT_RGB); 
        Graphics2D g = buffImg.createGraphics(); 
        //创建一个随机数生成器类
        Random random = new Random(); 
        //将图像填充为白色
        g.setColor(Color.WHITE); 
        g.fillRect(0, 0, width, height); 
        //创建字体，字体的大小应该根据图片的高度来定。
        Font font = new Font("Fixedsys", Font.PLAIN, fontHeight-5); 
        //设置字体。
        g.setFont(font); 
        //画边框
        g.setColor(Color.WHITE); 
        g.drawRect(0, 0, width - 2, height - 2); 

        //随机产生干扰线，使图象中的认证码不易被其它程序探测到。
        /*g.setColor(Color.BLACK); 
        for(int i = 0; i < 5; i++) 
        {
            int x = random.nextInt(width); 
            int y = random.nextInt(height); 
            int xl = random.nextInt(12); 
            int yl = random.nextInt(12); 
            g.drawLine(x, y, x + xl, y + yl); 
        }*/
        //randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
        StringBuffer randomCode = new StringBuffer(); 
        int red = 0, green = 0, blue = 0; 

        //随机产生codeCount数字的验证码。
        for (int i = 0; i < codeCount; i++) {
        //得到随机产生的验证码数字。
        String strRand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]); 
        //产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
        /*red = random.nextInt(255); 
        green = random.nextInt(255); 
        blue = random.nextInt(255);*/ 

        //用随机产生的颜色将验证码绘制到图像中。
        g.setColor(new Color(red, green, blue)); 
        g.drawString(strRand, (i + 1) * x, codeY-2); 

        //将产生的四个随机数组合在一起。
        randomCode.append(strRand); 
        }
        obj[0] = randomCode.toString();
        obj[1] = buffImg;
        return obj;
    }
}
 
 

控制器:
 
 
添加验证码:
流程:打开注册页，提交注册后，先验证验证码，通过调用业务注册，否则转回注册页，并给出提示
验证:
客户端接收的和session存的进行匹配
控制器:
 
 

 
登陆:
 
 
 

处理导航菜单:
处理原因，很多页面都有，每个都修改太麻烦。
解决方案:
使用include包含  :编译时包含
nav.jsp
 



 

权限控制:
原理:
加拦截器，配置非登陆用户可以访问哪些控制器。
过滤器区别：
拦截器只拦截方法或者控制器的执行，过滤器拦截http请求
使用:
 
 

 
<mvc:interceptors>
    <mvc:interceptor>
        <mvc:mapping path="/**"/>
        <!--设置放行的请求-->
        <mvc:exclude-mapping path="/goods/toIndex"/>
        <mvc:exclude-mapping path="/to/userlogin"/>
        <mvc:exclude-mapping path="/to/reg"/>
        <mvc:exclude-mapping path="/user/**"/>
        <mvc:exclude-mapping path="/to/help"/>
        <mvc:exclude-mapping path="/goods/show/**"/>
        <!--后台管理员登陆后的操作都要放行-->
        <mvc:exclude-mapping path="/to/admin/**"/>
        <!--后台其他需要放行的请求-->
        
        <bean class="com.oracle.ssmphone.interceptor.UserInterceptor"/>
    </mvc:interceptor>
    <mvc:interceptor>
        <mvc:mapping path="/to/admin/**"/>
        <mvc:mapping path="/goods/**"/>
        <mvc:mapping path="/admin/**"/>
        <!--设置放行的请求-->
        <mvc:exclude-mapping path="/goods/toIndex"/>
        <!--省略其他放行请求-->
        <bean class="com.oracle.ssmphone.interceptor.AdminInterceptor"/>
    </mvc:interceptor>
</mvc:interceptors>
注意:
该配置并未完全，需要自己加上拦截或者放行的请求
购物车实现流程:
 
 
两处点击购物车(ajax)，点击立即购买进入购物车流程



模块12：会员后台
模块13：订单及支付
实现支付宝沙箱支付功能
1 什么是支付宝沙箱
https://open.alipay.com/develop/sandbox/app
沙箱环境是协助开发者进行接口开发及主要功能联调的模拟环境
1.1 沙箱APP
  
1.2 沙箱账号
  
1.3 应用信息
  
2 导入依赖
<dependency>
  <groupId>com.alipay.sdk</groupId>
  <artifactId>alipay-sdk-java</artifactId>
  <version>4.34.86.ALL</version>
</dependency>

3 支付宝开放平台密钥工具
https://opendocs.alipay.com/open/02np9g
  
3.4 支付宝的支付流程
商户系统 与 支付宝系统 有二次交互
1 订单时：商户系统 向 支付宝 发请求
2 确认支付完成之后 ： 支付宝 向 商户系统 发请求
 

3.5 编写支付宝支付的配置参数类
这个类也是从支付宝的DEMO中下载
  
3.5.1 沙箱的AAPID
3.5.2 商户私钥
根据支付宝开放平台密钥工具获得
  
3.5.3 支付宝公钥
根据 应用公钥 从 沙箱环境中 获取 支付宝公钥
3.5.4 支付宝回调URL
支付宝完成支付之后，调用商户系统哪一个URL的参数设计。
http://localhost:8088/PhoneProj_war_exploded/order/payresult
 
3.6 编写Mapper接口和Mapper.xml文件
编写修改订单状态的方法
@Repository("OrderMapper")
public interface OrderMapper {
    /**
     * 更新订单状态
     * @param orderId 订单编号
     * @param statusId 状态编号
     */
    public void updateStatus(
            @Param("orderId") String orderId,
            @Param("statusId") Integer statusId);
 
<update id="updateStatus">
    update orders
    set order_status_id = #{statusId}
    where order_id = #{orderId}
</update>
 
3.7 编写Service类
@Service("OrderService")
public class OrderService {
    @Autowired@Qualifier("ReciMapper")
    private ReciMapper reciMapper;
    @Autowired@Qualifier("ItemMapper")
    private ItemMapper itemMapper;
    @Autowired@Qualifier("OrderMapper")
    private OrderMapper orderMapper;
    @Autowired@Qualifier("OrderDetailMapper")
    private OrderDetailMapper orderDetailMapper;
    @Autowired@Qualifier("GoodsDetailMapper")
    private GoodsDetailMapper goodsDetailMapper;


    /**
     * 修改订单状态方法
     * @param orderId 订单编号
     * @param statusId 状态编号
     */
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = {Exception.class})
    public void updateStatus(String orderId,Integer statusId){
        this.orderMapper.updateStatus(orderId,statusId);
    }
 
 
3.8 编写Controller类
我们编写的控制器方法一共有二个：
1 向支付宝发送支付请求控制器方法
2 支付完成后，支付宝发送回来的控制器方法
这二个都与支付宝有关。所有这二个方法的代码大部分都是支付宝提前写好的。
3.8.1 向支付宝发送支付请求的控制器方法
/**
 * 支付方法
 * @param orderId 商户订单号，商户网站订单系统中唯一订单号，必填
 * @param orderPrice 付款金额，必填
 * @param orderName 订单名称，必填
 * @param orderAddr 商品描述，可空
 * @param model
 * @return
 */
@RequestMapping("/pay")
public String pay(String orderId, String orderPrice, String orderName, String orderAddr, Model model) {
    // 获得初始化的AlipayClient
    AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
            AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
            AlipayConfig.sign_type);
    // 设置请求参数
    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
    alipayRequest.setReturnUrl(AlipayConfig.return_url);
    alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
    try {
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + orderId + "\"," + "\"total_amount\":\""
                + orderPrice + "\"," + "\"subject\":\"" + orderName + "\"," + "\"body\":\"" + orderAddr + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        // 请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        // 输出 pay页面取出
        model.addAttribute("result", result);
    } catch (Exception e) {
        e.printStackTrace();
    }
    // 这个是渲染到视图中,在pay视图中使用el方式将 result对象数据展示,由result对象进行向阿里支付系统发送构建的请求
    return "order/alipay";
}
 
 
3.8.2 支付完成后，支付宝发送回来的控制器方法
http://localhost:8088/PhoneProj_war_exploded/order/payresult
/**
 * 支付宝回调方法
 * @param request
 * @param model
 * @return
 */
@RequestMapping("/payresult")
public String payResult(HttpServletRequest request, Model model) {
    try {
        /*
         * * 功能：支付宝服务器同步通知页面 日期：2017-03-30 说明：
         * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
         * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。 页面功能说明*************************
         * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
         */
        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        // 验签
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key,
                AlipayConfig.charset, AlipayConfig.sign_type); // 调用SDK验证签名
        // ——请在这里编写您的程序（以下代码仅作参考）——
        if (signVerified) {
            // 商户订单号
            String out_trade_no = new String(
                    request.getParameter("out_trade_no").getBytes("ISO-8859-1")
                    , "UTF-8");
            // 支付宝交易号
            String trade_no = new String(
                    request.getParameter("trade_no").getBytes("ISO-8859-1")
                    , "UTF-8");
            // 付款金额
            String total_amount = new String(
                    request.getParameter("total_amount").getBytes("ISO-8859-1")
                    , "UTF-8");


            // 修改订单号的状态
            this.orderService.updateStatus(out_trade_no, 2);


            request.setAttribute("reuslt", "trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no
                    + "<br/>total_amount:" + total_amount);
        } else {
            // out.println("验签失败");
            request.setAttribute("reuslt", "支付失败");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return "order/success";
}
 
 
3.9 编写jsp页面
3.9.1 编写order/show.jsp页面
向支付的控制器提交参数
<td colspan="2" style="height:50px;">
    <form method="post" action="${pageContext.request.contextPath}/order/pay" name="payForm">
        <input name="orderId" type="hidden" value="${order.orderId}">
        <input name="orderPrice" type="hidden" value="${order.orderPrice}">
        <input name="orderName" type="hidden" value="${order.orderName}">
        <input name="orderAddr" type="hidden" value="${order.orderAddr}">
    </form>
    <a href="javascript:document.payForm.submit();"><img src="images/tijao.png" width="142" height="32" /></a>
</td>
 
3.9.2 编写order/alipay.jsp页面
result的内容是支付宝输出生成的
<body>
${requestScope.result}
</body>
 
3.9.3 编写order/success.jsp页面
<div class="car">
    <div class="cont">
        <div class="chenggong">
            <h3>支付成功</h3>
            <!--zhifu/-->
        </div><!--chenggong/-->
    </div><!--cont/-->
</div><!--car/-->
 

3.10 测试运行
获取sk价格
ajax:
传统请求响应:
客户端发请求-----服务端响应整个儿页面发到客户端。客户端看到页面
ajax发请求:
js向服务端发请求，请求的数据。服务端返回本次请求的数据。页面不刷新
 
分析:选完颜色和内存后，向服务端发送请求：参数商品id、颜色id、内存id，从服务端得到该商品的sku价格
 服务端接口:
 
注意这种做法需要配置消息转换器
<!--注册注解驱动-->
<mvc:annotation-driven>
    <mvc:message-converters>
        <bean class="org.springframework.http.converter.StringHttpMessageConverter">
            <property name="supportedMediaTypes">
                <list>
                    <value>application/json;charset=UTF-8</value>
                </list>
            </property>
        </bean>
        <bean class="com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter">
            <property name="supportedMediaTypes">
                <list>
                    <value>text/html;charset=UTF-8</value>
                    <value>application/json</value>
                </list>
            </property>
            <property name="features">
                <list>
                    <!-- Date的日期转换器 -->
                    <value>WriteDateUseDateFormat</value>
                </list>
            </property>
        </bean>
    </mvc:message-converters>
</mvc:annotation-driven>
服务端进行测试:
方式1:get请求
直接在浏览器url输入请求地址:
http://localhost:8088/ssmphone_war_exploded/cart/details/1/1/3
 
方式2:postman

