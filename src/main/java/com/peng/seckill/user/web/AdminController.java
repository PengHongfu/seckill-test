package com.peng.seckill.user.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.peng.seckill.category.entity.Category;
import com.peng.seckill.category.service.CategorySevice;
import com.peng.seckill.seckill.entity.Seckill;
import com.peng.seckill.seckill.service.SeckillService;
import com.peng.seckill.seckillorder.entity.SeckillOrder;
import com.peng.seckill.seckillorder.service.SeckillOrderService;
import com.peng.seckill.user.entity.User;
import com.peng.seckill.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * 后台管理 Controller
 *
 * Created by Peng
 * Time: 2017/4/28 13:34
 */
@SessionAttributes(value = {"adminUser"})
@RequestMapping("/Admin")
@Controller
public class AdminController {

    @Autowired
    private SeckillOrderService seckillOrderService;

    @Autowired
    private CategorySevice categorySevice;

    @Autowired
    private SeckillService seckillService;

    @Autowired
    private UserService userService;

    /**
     * 跳转到主页
     * @return
     */
    @RequestMapping("/main")
    public String main(){
        return "back/main";
    }

    /**
     * 跳转到用户列表
     * @return
     */
    @RequestMapping("/userList")
    public String userlist(@RequestParam(value = "currentPage", defaultValue = "1")
                                       Integer currentPage,Model model){
        PageHelper.startPage(currentPage, 9);
        List<User> userList = userService.selectAll();
 /*
        按上面的规则分页后能产生的页数，和每次查询到的记录数
         */
        PageInfo<User> pageInfo = new PageInfo<>(userList);
        /*long total = pageInfo.getTotal();//获取数据库总记录数
        * System.out.println("分页后产生的页数"+pageInfo.getPages());
        System.out.println("分页后的查询到的记录数"+pageInfo.getSize());*/

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", pageInfo.getPages());
        model.addAttribute("userAllList",userList);
        return "back/user/list";
    }

    /**
     * 商品详情页
     * @param currentPage
     * @param model
     * @return
     */
    @RequestMapping("/seckillAlllist")
    public String SeckillList(@RequestParam(value = "currentPage", defaultValue = "1")
                                          Integer currentPage,Model model){
        PageHelper.startPage(currentPage, 9);
        List<HashMap<String,Object>> hashMapList = seckillService.selectAllToHashMap();

        PageInfo<HashMap<String,Object>> pageInfo = new PageInfo<>(hashMapList);
       /* long total = pageInfo.getTotal();//获取数据库总记录数]
        System.out.println(">>>>>>>>"+total);
         System.out.println("分页后产生的页数"+pageInfo.getPages());
        System.out.println("分页后的查询到的记录数"+pageInfo.getSize());*/
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", pageInfo.getPages());
        model.addAttribute("seckillAlllist", hashMapList);

        return "back/seckill/list";
    }

    /**
     * 跳转到商品查询
     * @return
     */
    @RequestMapping("/toseckillSearch")
    public String toseckillSearch(){
        return "back/seckill/search";
    }
    /**
     * 商品模糊查询
     * @param currentPage
     * @param seckillDesc
     * @param sname
     * @param createTime
     * @param startTime
     * @param endTime
     * @param price
     * @param cname
     * @param model
     * @return
     */
    @RequestMapping("/seckillSearch")
    public String seckillFindByLike(@RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage,
                                    String seckillDesc, String sname,String createTime,String startTime,
                                    String endTime, String price, String cname,Model model){
        List<HashMap<String,Object>> hashMapList = null;
        System.out.println("****"+seckillDesc+" "+sname+" "+createTime+" "+startTime+" "+endTime+" "+price+" "+cname
        );
        PageHelper.startPage(currentPage, 9);
        hashMapList = seckillService.selectSeckillListByLike(sname,startTime,
                endTime,createTime,seckillDesc,price,cname);
         /*
        按上面的规则分页后能产生的页数，和每次查询到的记录数
         */
        PageInfo<HashMap<String,Object>> pageInfo = new PageInfo<>(hashMapList);
        /*long total = pageInfo.getTotal();//获取数据库总记录数
        * System.out.println("分页后产生的页数"+pageInfo.getPages());
        System.out.println("分页后的查询到的记录数"+pageInfo.getSize());*/
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", pageInfo.getPages());
        model.addAttribute("seckillAllList", hashMapList);
        if(hashMapList!=null){
            //当有内容查询时，要回显，以便分页查询的下一页有效
            model.addAttribute("sname",sname);
            model.addAttribute("seckillDesc",seckillDesc);
            model.addAttribute("createTime",createTime);
            model.addAttribute("startTime",startTime);
            model.addAttribute("endTime",endTime);
            model.addAttribute("price",price);
            model.addAttribute("cname",cname);
        }
        return "back/seckill/search";
    }

    /**
     * 跳转到添加/修改商品页面
     * @return
     */
    @RequestMapping("/toAddSeckill")
    public String toAddSeckill(@RequestParam(value = "seckillId",required = false,defaultValue = "0")long seckillId,
                                Model model){
        Seckill seckill ;
        if(seckillId!=0){
            //是编辑商品
             seckill = seckillService.selectByPrimaryKey(seckillId);
            model.addAttribute("editSeckill",seckill);
        }
       List<Category> categoryList = categorySevice.findAllCategory();
       model.addAttribute("categorySort",categoryList);
        return "back/seckill/add";
    }
    /**
     * 添加/修改商品页面
     * @return
     */
    @RequestMapping("/AddSeckill")
    public String AddSeckill(@RequestParam("file") MultipartFile file,String price,String numbers,String startTime,String seckillDesc,
                             String endTime, String cid,Model model,String sname,HttpServletRequest request){
        Seckill seckill = null;
       /* System.out.println(price+"  "+endTime);
        System.out.println("file.getContentType():"+file.getContentType());
        System.out.println("file.getName():"+file.getName());
        System.out.println("file.getOriginalFilename():"+file.getOriginalFilename());*/
        String fileType = file.getContentType();
        //重命名图片
        String fileName = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        if(fileType.equals("image/jpeg")){
            fileName =   fileName.concat(".jpg");
        } else if (fileType.equals("image/png")){
            fileName = fileName.concat(".png");
        } else if(fileType.equals("image/bmp")){
            fileName =  fileName.concat(".bmp");
        } else if(fileType.equals("image/gif")){
            fileName = fileName.concat(".gif");
        } else fileName = fileName.concat(".jpg");

        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
                String filePath = request.getSession().getServletContext().getRealPath("/") + "image/"
                        + fileName;
                if(!new File(filePath).exists())   {
                    new File(filePath).mkdirs();
                }
                // 转存文件
                file.transferTo(new File(filePath));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        seckill = toSeckill(price,numbers,startTime,seckillDesc,endTime,cid,sname);
        seckill.setImage(fileName);
        /**
         * 保存Secckill
         */
        int count = seckillService.insertSelective(seckill);
        if(count==0){
            model.addAttribute("addError","添加错误");
            return "back/seckill/add";
        }
        return "redirect:seckillAlllist";
    }
    /**
     * 删除商品
     * @param seckill_id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deleteSeckill/{seckillId}",method = RequestMethod.DELETE)
    public boolean deleteSeckill(@PathVariable("seckillId")long seckill_id){
        try {
            seckillService.deleteByPrimaryKey(seckill_id);
        }catch (RuntimeException e){
            return false;
        }
        return true;
    }
    /**
     * 转换为Seckill
     * @param price
     * @param numbers
     * @param startTime
     * @param seckillDesc
     * @param endTime
     * @param cid
     * @param sname
     * @return
     */
    private static  Seckill toSeckill(String price,String numbers,String startTime,String seckillDesc,
                              String endTime, String cid,String sname){
        Seckill seckill = new Seckill();

        BigDecimal bd=new BigDecimal(price);
        seckill.setPrice(bd);
        seckill.setNumbers(Integer.parseInt(numbers));
        seckill.setSname(sname);

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            seckill.setStartTime(format.parse(startTime));
            seckill.setEndTime(format.parse(endTime));
        } catch (ParseException e) {
            System.out.println("日期解析异常");
            e.printStackTrace();
        }
        seckill.setSeckillDesc(seckillDesc);
        seckill.setCid(Long.parseLong(cid));
        return seckill;
    }
    /**
     * 测试保存图片
     * @return
     */
    @RequestMapping(value = "/uploadImg",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public boolean uploadImg(@RequestParam("file") MultipartFile file,HttpServletRequest request){
       /* String basePath = System.getProperty("test.webapp");
        *//*D:\idea-project\seckill-test01\target\seckill-test01-1.0-SNAPSHOT\*//*
        System.out.println("**************"+basePath);*/
       /* System.out.println("file.getContentType():"+file.getContentType());
        System.out.println("file.getName():"+file.getName());
        System.out.println("file.getOriginalFilename():"+file.getOriginalFilename());
*/
        String fileType = file.getContentType();
        //重命名图片
        String fileName = UUID.randomUUID().toString().replace("-", "").toUpperCase();
        if(fileType.equals("image/jpeg")){
            fileName =   fileName.concat(".jpg");
        } else if (fileType.equals("image/png")){
            fileName = fileName.concat(".png");
        } else if(fileType.equals("image/bmp")){
            fileName =  fileName.concat(".bmp");
        } else if(fileType.equals("image/gif")){
            fileName = fileName.concat(".gif");
        } else fileName = fileName.concat(".jpg");

        System.out.println("fineName....."+fileName);
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
              /* String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"
                        + fileName;*/
               String filePath ="C:/Users/Peng/Desktop/image/"+"upload/"+fileName;
                if(!new File(filePath).exists())   {
                    new File(filePath).mkdirs();
                }
                // 转存文件
                file.transferTo(new File(filePath));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    /**
     * 订单列表页
     * @param model
     * @return
     */
    @RequestMapping("/orderAlllist")
    public  String  OrderList(@RequestParam(value = "currentPage", defaultValue = "1")
                                          Integer currentPage,Model model){

        PageHelper.startPage(currentPage, 10);
        List<SeckillOrder> orderAllList = seckillOrderService.findAllOrderByAdmin();
         /*
        按上面的规则分页后能产生的页数，和每次查询到的记录数
         */
        PageInfo<SeckillOrder> pageInfo = new PageInfo<>(orderAllList);
        /*long total = pageInfo.getTotal();//获取数据库总记录数
        * System.out.println("分页后产生的页数"+pageInfo.getPages());
        System.out.println("分页后的查询到的记录数"+pageInfo.getSize());*/
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", pageInfo.getPages());
        model.addAttribute("orderAllList", orderAllList);
        return "back/order/list";
    }

    /**
     * 跳转到订单查询页面
     * @return
     */
    @RequestMapping("/toorderSearch")
    public String orderSearch(){
        return "back/order/search";
    }
    /**
     * 订单模糊查询
     * @param orderId
     * @param sname
     * @param loginname
     * @param createTime
     * @param model
     * @return
     */
    @RequestMapping("/orderSearch")
    public String OrderFindByLike(@RequestParam(value = "currentPage", defaultValue = "1")
                                              Integer currentPage,String orderId,String sname,String loginname
            ,String createTime,Model model){
        List<SeckillOrder> list = null;
        //System.out.println(orderId+" "+sname+" "+loginname+" "+createTime);
        /*不输入搜索条件时不搜索*/
            PageHelper.startPage(currentPage, 10);
            list = seckillOrderService.orderFindByLike(orderId,sname,loginname,createTime);

         /*
        按上面的规则分页后能产生的页数，和每次查询到的记录数
         */
        PageInfo<SeckillOrder> pageInfo = new PageInfo<>(list);
        /*long total = pageInfo.getTotal();//获取数据库总记录数
        * System.out.println("分页后产生的页数"+pageInfo.getPages());
        System.out.println("分页后的查询到的记录数"+pageInfo.getSize());*/
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", pageInfo.getPages());
        model.addAttribute("orderAllList", list);
        if(list!=null){
            model.addAttribute("orderId",orderId);
            model.addAttribute("sname",sname);
            model.addAttribute("loginname",loginname);
            model.addAttribute("createTime",createTime);
        }
        return "back/order/search";
    }

    /**
     * 查询所有分类
     * @param model
     * @return
     */
    @RequestMapping("/categoryAllList")
    public String findAllCategory(@RequestParam(value = "currentPage", defaultValue = "1")
                                              Integer currentPage,Model model){
        PageHelper.startPage(currentPage, 10);
        List<Category> categoryList = categorySevice.findAllCategory();

        PageInfo<Category> pageInfo = new PageInfo<>(categoryList);
        /*long total = pageInfo.getTotal();//获取数据库总记录数
        * System.out.println("分页后产生的页数"+pageInfo.getPages());
        System.out.println("分页后的查询到的记录数"+pageInfo.getSize());*/
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", pageInfo.getPages());
        model.addAttribute("categoryAllList",categoryList);

        return "back/category/list";
    }

    /**
     * 跳转到添加/修改分类页面
     * @return
     */
    @RequestMapping("/toaddCategory")
    public String toAddCategory(@RequestParam(value = "cid",required = false,defaultValue = "0")long cid,
    Model model){
        Category category ;
        if(cid!=0){
            //是编辑商品
             category = categorySevice.selectByPrimaryKey(cid);
             model.addAttribute("editCategory",category);
        }
        return "back/category/add";
    }

    /**
     * 添加分类
     * @param category
     * @param model
     * @return
     */
    @RequestMapping("/editCategory")
    public String addCategory(Category category,Model model){

        if(category.getCid()==null){
             categorySevice.addCategory(category);
        }else{
            categorySevice.updateByPrimaryKeySelective(category);
        }
        return "redirect:categoryAllList";
    }


    /**
     * 删除分类,只有当该分类没有商品时
     * @param cid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteCategory/{cid}",method = RequestMethod.DELETE)
    public boolean deleteCategory(@PathVariable("cid")long cid){
        try {
            categorySevice.deleteByPrimaryKey(cid);
        }catch (RuntimeException e){
            return false;
        }
        return true;
    }
    /**
     * * Rest风格的URL
     * 以CRUD为例
     * 新增：/order POST
     * 修改：/order/1 PUT 		update?id=1
     * 获取：/order/1 GET		get?id=1
     * 删除：/order/1 DELETE		delete?id=1
     */
    /**
     * 更改订单状态 返回json数据
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/order/{orderId}/{state}", method = RequestMethod.PUT )
    @ResponseBody
    public boolean UpdateOrderState(@PathVariable String orderId, @PathVariable int state) {
        int count = seckillOrderService.updateStateByorderId(orderId, state);
        if (count == 0) {
            return false;
        }
        return true;
    }
}
