package com.peng.seckill.seckill.dao.cache;

import com.peng.seckill.seckill.dao.SeckillDao;
import com.peng.seckill.seckill.entity.Seckill;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by Peng
 * Time: 2017/5/1 11:48
 */
@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml" })
public class RedisDaoTest {
    @Resource
    private RedisDao redisDao;
    @Resource
    private SeckillDao seckillDao;

    private long id = 1;

    @Test
    public void testSeckill() throws Exception {
        Seckill seckill = redisDao.getSeckill(id);
        System.out.println("seckill是否为空"+seckill==null);
        if (seckill == null){
            seckill = seckillDao.selectByPrimaryKey(id);
            if (seckill != null){
                String result = redisDao.putSeckill(seckill);
                System.out.println("resutl....."+result);
                seckill = redisDao.getSeckill(id);
                System.out.println(seckill);
            }
        }
    }

}