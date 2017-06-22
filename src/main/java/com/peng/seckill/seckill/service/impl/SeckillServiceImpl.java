package com.peng.seckill.seckill.service.impl;

import com.peng.seckill.seckill.dao.SeckillDao;
import com.peng.seckill.seckill.dao.cache.RedisDao;
import com.peng.seckill.seckill.dto.CurrentTime;
import com.peng.seckill.seckill.dto.Exposer;
import com.peng.seckill.seckill.dto.SeckillExecution;
import com.peng.seckill.seckill.entity.Seckill;
import com.peng.seckill.seckill.enums.SeckillStateEnum;
import com.peng.seckill.seckill.exception.RepeatKillException;
import com.peng.seckill.seckill.exception.SeckillCloseException;
import com.peng.seckill.seckill.exception.SeckillException;
import com.peng.seckill.seckill.service.SeckillService;
import com.peng.seckill.seckillorder.entity.SeckillOrder;
import com.peng.seckill.seckillorder.service.SeckillOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.*;

/**
 * Created by Peng
 * Time: 2017/4/20 10:37
 */

@Service("seckillService")
public class SeckillServiceImpl implements SeckillService {

    // 加入一个混淆字符串(秒杀接口)的salt，为了我避免用户猜出我们的md5值，值任意给，越复杂越好
    private final String salt = "Happy_life-*_*";

    @Autowired
    private SeckillDao seckillDao;
    @Autowired
    private SeckillOrderService seckillOrderService;
    @Autowired
    private RedisDao redisDao;
    @Override
    public int insertSelective(Seckill record) {
        return seckillDao.insertSelective(record);
    }

    @Override
    public List<Seckill> selectAll() {
        return seckillDao.selectAll();
    }

    @Override
    public Seckill selectByPrimaryKey(Long seckillId) {
        return seckillDao.selectByPrimaryKey(seckillId);
    }

    @Override
    public Exposer exportSeckillUrl(long seckillId) {
        //1.访问redis
        Seckill seckill = redisDao.getSeckill(seckillId);
        //缓存优化；超时的基础上维护一致性
        if(seckill == null){
            //2.访问数据库
            seckill = seckillDao.selectByPrimaryKey(seckillId);
            if (seckill == null) {
                return new Exposer(false, seckillId);
            }else{
                //3.放入redis
                redisDao.putSeckill(seckill);
            }
        }
        //进一步验证商品的时间是否可以秒杀了
        //秒杀未开启
        Date startTime = seckill.getStartTime();
        Date endTime = seckill.getEndTime();
        //网络当前时间
        long nowTime = CurrentTime.getNetworkTime();
        if (startTime.getTime() > nowTime || endTime.getTime() < nowTime) {
            return new Exposer(false, seckillId, nowTime, startTime.getTime(), endTime.getTime());
        }
        //秒杀开启,返回秒杀商品的id、用给接口加密的md5

        String md5 = getMD5(seckillId);
        return new Exposer(true, md5, seckillId);
    }

    /**
     * // 秒杀是否成功，成功:减库存，增加明细；失败:抛出异常，事务回滚
     * @param seckillId
     * @param uid
     * @param md5
     * @return
     * @throws SeckillException
     * @throws RepeatKillException
     * @throws SeckillCloseException
     */
    @Transactional
    @Override
    public SeckillExecution executeSeckill(long seckillId, String uid, String md5)
            throws SeckillException, RepeatKillException, SeckillCloseException {
        if (md5 == null || !md5.equals(getMD5(seckillId))) {
            throw new SeckillException("秒杀商品数据被篡改");// 秒杀数据被重写了
        }
        // 执行秒杀逻辑:减库存+添加秒杀订单
        //网络当前时间
        long nowTime = CurrentTime.getNetworkTime();
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(nowTime);
        try{
            //查看是否重复秒杀，根据uid和seckillid查询
            SeckillOrder isRepeat = seckillOrderService.findByUserIdAndSeckillId(uid,seckillId);
            if(isRepeat!=null){
                throw new RepeatKillException("商品重复秒杀了");
            }else{
                //添加秒杀订单信息
                seckillOrderService.insert(UUID.randomUUID().toString().replace("-", "").toUpperCase(),seckillId,uid);
                //减库存
                int updateCount =  seckillDao.reduceNumbers(seckillId,c.getTime());
                if(updateCount <=0){
                    //没有更新库存记录，说明秒杀结束，回滚
                    throw new SeckillCloseException("秒杀已经结束");
                }else{
                    //秒杀成功，得到成功插入的明细计入，并返回成功秒杀的信息
                    SeckillOrder seckillOrder = seckillOrderService.findByUserIdAndSeckillId(uid,seckillId);
                    return  new SeckillExecution(seckillId,uid, SeckillStateEnum.SUCCESS,seckillOrder);
                }
            }


        } catch (SeckillCloseException e1) {
            throw e1;
        } catch (RepeatKillException e2) {
            throw e2;
        } catch (Exception e) {
           e.printStackTrace();
            // 所以编译期异常转化为运行期异常
            throw new SeckillException("系统内部异常:" + e.getMessage());
        }
    }

    @Override
    public SeckillExecution executeSeckillProcedure(long seckillId, String uid, String md5) {
        return null;
    }

    /**
     * 模糊查询
     * @param sname
     * @return
     */
    @Override
    public List<Seckill> selectLikeBySname(String sname) {
        return seckillDao.selectLikeBySname(sname);
    }
    /**
     * 按商品分类查询
     * @param cid
     * @return
     */
    @Override
    public List<Seckill> selectByCategory(long cid) {
        return seckillDao.selectByCategory(cid);
    }
    /**
     * 查询最新的4个商品
     * @return
     */
    @Override
    public List<Seckill> selectByNewTime() {
        return seckillDao.selectByNewTime();
    }
    /**
     * 查询库存最多
     * @return
     */
    @Override
    public List<Seckill> selectLargeNumbers() {
        return seckillDao.selectLargeNumbers();
    }
    /**
     * 返回hashmap类型的值商品列表
     * @return
     */
    @Override
    public List<HashMap<String, Object>> selectAllToHashMap() {
        return seckillDao.selectAllToHashMap();
    }
    /**
     * 模糊查询商品列表返回hashmap类型的值
     *
     * @return
     */
    @Override
    public List<HashMap<String, Object>> selectSeckillListByLike(String sname, String startTime, String endTime, String createTime, String seckillDesc, String price, String cname) {
        return seckillDao.selectSeckillListByLike(sname,startTime,endTime,createTime,seckillDesc,price,cname);
    }

    @Override
    public int deleteByPrimaryKey(long seckillid) {
        return seckillDao.deleteByPrimaryKey(seckillid);
    }

    //生成一个唯一的md5码
    private String getMD5(long seckillId) {
        String base = seckillId + "/" + salt;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

}
