package com.peng.seckill.user;

import com.peng.seckill.seckill.dao.SeckillDao;
import com.peng.seckill.seckill.dto.CurrentTime;
import com.peng.seckill.seckill.entity.Seckill;
import com.peng.seckill.seckill.service.SeckillService;
import com.peng.seckill.seckillorder.entity.SeckillOrder;
import com.peng.seckill.seckillorder.service.SeckillOrderService;
import com.peng.seckill.user.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.Reader;
import java.util.*;

/**
 * Created by Peng
 * Time: 2017/4/17 16:22
 */

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml" })
public class TestMybatis {

    @Autowired
    private SeckillOrderService seckillOrderService;

    @Autowired
    private SeckillDao seckillDao;
    @Autowired
    private SeckillService seckillService;
    /**
     * 测试查询
     * @throws IOException
     */
   /* @Test
    public void testfindById() throws IOException {
        Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
        //通过配置信息构建一个SqlSessionFactory
        SqlSessionFactory sqlSessionFactory =new SqlSessionFactoryBuilder().build(reader);
        //通过SqlSessionFactory打开一个数据库会话
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            User user = sqlSession.selectOne("selectByPrimaryKey", "01");
            System.out.println(user.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            sqlSession.close();
        }

    }*/
   @Test
    public void testFindByuid(){
       List<SeckillOrder> list = seckillOrderService.findByUserId("keke");
       for (SeckillOrder seckillOrder :list){
           System.out.println(seckillOrder.toString());
       }
   }
    @Test
    public void testFindByuidAndSeckillId(){
       SeckillOrder seckillOrder = seckillOrderService.findByUserIdAndSeckillId("keke",1L);
       System.out.println(seckillOrder.toString());

    }
    @Test
    public void testInsert(){
        int  i = seckillOrderService.insert(UUID.randomUUID().toString().replace("-", "").toUpperCase(),2L,"50E6525FCF0148ECA611C6400586237A");
        System.out.println(i);
        List<SeckillOrder> list = seckillOrderService.findByUserId("50E6525FCF0148ECA611C6400586237A");
        for (SeckillOrder seckillOrder :list){
            System.out.println(seckillOrder.toString());
        }
    }
    @Test
    public void testreduceNumber(){
        Long nowtime = CurrentTime.getNetworkTime();
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(nowtime);
        int i = seckillDao.reduceNumbers(5L,c.getTime());
        System.out.println(i);
    }

    /**
     * 测试模糊查询
     */
    @Test
    public void testLike(){
        String sname = null;
       List<Seckill> list = seckillDao.selectLikeBySname(sname);
       for(Seckill seckill1 :list){
           System.out.println(seckill1);
       }
    }
    @Test
    public void testfind(){
       long id =1;
       Seckill seckill = seckillDao.selectByPrimaryKey(id);
        System.out.println(seckill);
    }
    /**
     * 测试模糊查询
     */
    @Test
    public void testLike2(){
        List<SeckillOrder> list = seckillOrderService.orderFindByLike(null,null,null,"2017");
        for(SeckillOrder s :list){
            System.out.println(s);
        }
    }

    /**
     * 测试hashmap查询
     */
    @Test
    public void testLike3(){
        List<HashMap<String,Object>> hashMapList = seckillDao.selectAllToHashMap();
        for(HashMap hashMap :hashMapList){
            Iterator iterator = hashMap.entrySet().iterator();
            while (iterator.hasNext()){
                Map.Entry entry = (Map.Entry) iterator.next();
                Object key = entry.getKey();
                Object value = entry.getValue();
                System.out.println(key + ":" + value);
            }
        }
    }

    /**
     * 测试hashmap查询
     */
    @Test
    public void testLike4(){
        List<HashMap<String,Object>> hashMapList2 = seckillDao.selectSeckillListByLike(null,null,
                null,null,null,null,null);
        List<HashMap<String,Object>> hashMapList3 = seckillService.selectSeckillListByLike(null,null,
                null,null,null,null,null);
        for(HashMap hashMap :hashMapList2){
            Iterator iterator = hashMap.entrySet().iterator();
            while (iterator.hasNext()){
                Map.Entry entry = (Map.Entry) iterator.next();
                Object key = entry.getKey();
                Object value = entry.getValue();
                System.out.println(key + ":" + value);
            }
        }
    }

    @Test
    public void testLike6(){
        String basePath = System.getProperty("test.webapp");
        System.out.println("*******************************************"+basePath);
    }
}
