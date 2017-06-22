package com.peng.seckill.seckill.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.peng.seckill.seckill.dto.CurrentTime;
import com.peng.seckill.seckill.dto.Exposer;
import com.peng.seckill.seckill.dto.AjaxSeckillResult;
import com.peng.seckill.seckill.dto.SeckillExecution;
import com.peng.seckill.seckill.entity.Seckill;
import com.peng.seckill.seckill.enums.SeckillStateEnum;
import com.peng.seckill.seckill.exception.RepeatKillException;
import com.peng.seckill.seckill.exception.SeckillCloseException;
import com.peng.seckill.seckill.service.SeckillService;
import com.peng.seckill.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Peng
 * Time: 2017/4/19 23:36
 */
@RequestMapping("/Seckill")
@Controller
public class SeckillController {
    @Autowired
    private SeckillService seckillService;

    /**
     * 配置404 500等错误页
     * @return
     */
    @RequestMapping(value = "/error")
    public String errorPage() {

        return "error";
    }

    /**
     *跳转到首页
     */
    @RequestMapping("/main")
    public String  mainPage(Model model){
      List<Seckill> seckillList =seckillService.selectByNewTime();
        List<Seckill> seckillnumber =seckillService.selectLargeNumbers();
      model.addAttribute("fourseckill",seckillList);
        model.addAttribute("fiveseckill",seckillnumber);
      return "main";
    }


    /**
     * 商品列表页
     * @param currentPage
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String findAll(@RequestParam(value ="currentPage",defaultValue ="1")
                                      Integer currentPage, Model model){
        /*System.out.println("当前页码.........."+currentPage);*/

        PageHelper.startPage(currentPage,8);
        List<Seckill> list = seckillService.selectAll();
        /*for(Seckill seckill:list){
            System.out.println(seckill.toString());
        }*/

        PageInfo<Seckill> pageInfo = new PageInfo<>(list);
        long total = pageInfo.getTotal();//获取记录总数

        /*System.out.println("分页后产生的页数"+pageInfo.getPages());
        System.out.println("每次分页后的查询到的记录数"+pageInfo.getSize());
        System.out.println("记录总数:"+total);*/

        model.addAttribute("currentPage",currentPage);
        model.addAttribute("totalPages",pageInfo.getPages());
        model.addAttribute("seckillList",list);
        return "list";
    }

    /**
     * 搜索
     * @param sname
     * @return
     */
    @RequestMapping("/search")
    public String Search(@RequestParam(value ="currentPage",defaultValue ="1")
                                     Integer currentPage, Model model,String sname){
        PageHelper.startPage(currentPage,8);
        List<Seckill> list = seckillService.selectLikeBySname(sname);
        PageInfo<Seckill> pageInfo = new PageInfo<>(list);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("totalPages",pageInfo.getPages());
        model.addAttribute("seckillList",list);
        return "list";
    }

    /**
     * 按分类cid查询商品
     * @param currentPage
     * @param model
     * @param cid
     * @return
     */
    @RequestMapping("/category/{cid}")
    public String sortByCategory(@RequestParam(value ="currentPage",defaultValue ="1")
                                 Integer currentPage, Model model,@PathVariable long cid){
        PageHelper.startPage(currentPage,8);
        List<Seckill> list = seckillService.selectByCategory(cid);
        PageInfo<Seckill> pageInfo = new PageInfo<>(list);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("totalPages",pageInfo.getPages());
        model.addAttribute("seckillList",list);
        return "list";
    }
    /**
     * 商品详细
     * @param seckillId
     * @param model
     * @return
     */
    @RequestMapping(value="/{seckillId}/detail",method = RequestMethod.GET)
    public String findDetail(@PathVariable("seckillId") Long seckillId,Model model){
        if(seckillId==null){
            return "redirect:/Seckill/list";
        }
        Seckill seckill = seckillService.selectByPrimaryKey(seckillId);
        if(seckill==null){
            return "redirect:/Seckill/list";
        }
        model.addAttribute("seckill",seckill);
        return "detail";
    }

    /**
     * ajax暴露秒杀地址
     * @param seckillId
     * @return
     */
    @RequestMapping(value="/{seckillId}/exposer",method =RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxSeckillResult<Exposer> exposer(@PathVariable("seckillId") Long seckillId){
        AjaxSeckillResult<Exposer> result;
        try {
            Exposer exposer=seckillService.exportSeckillUrl(seckillId);
            result=new AjaxSeckillResult<Exposer>(true,exposer);
        }catch (Exception e){
            result=new AjaxSeckillResult<Exposer>(false,e.getMessage());
        }
        return result;
    }

    /**
     * 执行秒杀操作，返回json数据到detail.js
     * @param seckillId
     * @param md5
     * @param session
     * @return
     */
    @RequestMapping(value="/{seckillId}/{md5}/execution",method = RequestMethod.POST,
            produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public AjaxSeckillResult<SeckillExecution> execute(@PathVariable("seckillId") Long seckillId,
              @PathVariable("md5") String md5,HttpSession session){
            User user = (User) session.getAttribute("sessionuser");
            if(user==null){
                return new AjaxSeckillResult<SeckillExecution>(false,"未注册或获取用户名失败");
            }
            String uid = user.getUid();
            try{
                SeckillExecution execution = seckillService.executeSeckill(seckillId,uid,md5);
                return new AjaxSeckillResult<SeckillExecution>(true,execution);


            }catch (RepeatKillException e1){
                SeckillExecution execution=new SeckillExecution(seckillId,uid, SeckillStateEnum.REPEAT_KILL);
                return new AjaxSeckillResult<SeckillExecution>(true,execution);
            }catch (SeckillCloseException e2){
                SeckillExecution execution=new SeckillExecution(seckillId,uid, SeckillStateEnum.END);
                return new AjaxSeckillResult<SeckillExecution>(true,execution);
            }
            catch (Exception e){
                SeckillExecution execution=new SeckillExecution(seckillId,uid, SeckillStateEnum.INNER_ERROR);
                return new AjaxSeckillResult<SeckillExecution>(true,execution);
            }
    }
    /**
     * ajax返回网络当前时间
     * @return
     */
    @RequestMapping(value="/time/now",method = RequestMethod.GET)
    @ResponseBody
    public AjaxSeckillResult<Long> time(){
        //String webUrl4 = "http://www.ntsc.ac.cn";// 中国科学院国家授时中心
        //System.out.println(getNetworkTime(webUrl4) + " [中国科学院国家授时中心]");
        return new AjaxSeckillResult<Long>(true, CurrentTime.getNetworkTime());
    }
    @RequestMapping("/getsession")
    public void testsession(HttpServletRequest request,HttpSession session,@ModelAttribute("sessionuser")User user3){
       User user = (User) request.getSession().getAttribute("sessionuser");
        if(user==null){
            System.out.println(" request获取失败");
        }
        else {
            System.out.println("request 获取"+user.toString());
        }
        User user2 = (User) session.getAttribute("sessionuser");
        if(user2==null){
            System.out.println("session 获取失败");
        }
        else {
            System.out.println("session 获取"+user2.toString());
        }
        if(user3==null){
            System.out.println("ModelAttribute获取失败");
        }
        else {
            System.out.println("ModelAttribute 获取"+user3.toString());
        }
    }
}
