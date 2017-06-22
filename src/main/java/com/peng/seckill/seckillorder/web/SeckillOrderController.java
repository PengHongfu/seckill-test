package com.peng.seckill.seckillorder.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.peng.seckill.seckillorder.entity.SeckillOrder;
import com.peng.seckill.seckillorder.service.SeckillOrderService;
import com.peng.seckill.user.entity.User;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

/**
 * Created by Peng
 * Time: 2017/4/22 21:41
 */
@RequestMapping("/Order")
@Controller
public class SeckillOrderController {

    @Autowired
    private SeckillOrderService seckillOrderService;


    @RequestMapping("/list")
    public String myOrders(@RequestParam(value = "currentPage", defaultValue = "1")
                                   Integer currentPage, Model model, HttpSession session) {
        /*
        获取当前用户
         */
        User user = (User) session.getAttribute("sessionuser");
        String uid = user.getUid();
        /*
        分页
         */
        PageHelper.startPage(currentPage, 10);
        List<SeckillOrder> orderList = seckillOrderService.findByUserId(uid);

        /*
        按上面的规则分页后能产生的页数，和每次查询到的记录数
         */
        PageInfo<SeckillOrder> pageInfo = new PageInfo<>(orderList);
        /*long total = pageInfo.getTotal();//获取数据库总记录数
        * System.out.println("分页后产生的页数"+pageInfo.getPages());
        System.out.println("分页后的查询到的记录数"+pageInfo.getSize());*/
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", pageInfo.getPages());
        model.addAttribute("orderList", orderList);

        return "order/list";
    }

    /**
     * 准备支付
     * @param orderId
     * @param model
     * @return
     */
    @RequestMapping("/topay/{orderId}")
    public String toPay(@PathVariable String orderId,Model model){
        SeckillOrder seckillOrder = seckillOrderService.findBySeckillOrderId(orderId);
        System.out.println(seckillOrder);
        model.addAttribute("payOrder",seckillOrder);
        return "order/pay";
    }

    /**
     * 支付方法
     * @param yh
     * @param address
     * @param phone
     * @return
     */
    @RequestMapping("/pay")
    public String pay(String yh,String address,String phone,String orderId,String payprice) throws IOException {
        System.out.println(yh+"***"+address+"**"+phone);
        Properties props = new Properties();
        props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
        /*
		 * 1. 准备13个参数
		 */
        String p0_Cmd = "Buy";//业务类型，固定值Buy
        String p1_MerId = props.getProperty("p1_MerId");//商号编码，在易宝的唯一标识
        String p2_Order = orderId;//订单编码
        String p3_Amt = "0.01";//支付金额
        System.out.println("支付金额:"+payprice);
        String p4_Cur = "CNY";//交易币种，固定值CNY
        String p5_Pid = "";//商品名称
        String p6_Pcat = "";//商品种类
        String p7_Pdesc = "";//商品描述
        String p8_Url = props.getProperty("p8_Url");//在支付成功后，易宝会访问这个地址。
        String p9_SAF = "";//送货地址
        String pa_MP = "";//扩展信息
        String pd_FrpId = yh;//支付通道
        String pr_NeedResponse = "1";//应答机制，固定值1

        /*
		 * 2. 计算hmac
		 * 需要13个参数
		 * 需要keyValue
		 * 需要加密算法
		 */
        String keyValue = props.getProperty("keyValue");
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
                p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                pd_FrpId, pr_NeedResponse, keyValue);

		/*
		 * 3. 重定向到易宝的支付网关
		 */
        StringBuilder sb = new StringBuilder("https://www.yeepay.com/app-merchant-proxy/node");
        sb.append("?").append("p0_Cmd=").append(p0_Cmd);
        sb.append("&").append("p1_MerId=").append(p1_MerId);
        sb.append("&").append("p2_Order=").append(p2_Order);
        sb.append("&").append("p3_Amt=").append(p3_Amt);
        sb.append("&").append("p4_Cur=").append(p4_Cur);
        sb.append("&").append("p5_Pid=").append(p5_Pid);
        sb.append("&").append("p6_Pcat=").append(p6_Pcat);
        sb.append("&").append("p7_Pdesc=").append(p7_Pdesc);
        sb.append("&").append("p8_Url=").append(p8_Url);
        sb.append("&").append("p9_SAF=").append(p9_SAF);
        sb.append("&").append("pa_MP=").append(pa_MP);
        sb.append("&").append("pd_FrpId=").append(pd_FrpId);
        sb.append("&").append("pr_NeedResponse=").append(pr_NeedResponse);
        sb.append("&").append("hmac=").append(hmac);

        //resp.sendRedirect(sb.toString());
        return "redirect:"+sb.toString();
    }
    /**
     *
     *  回馈方法
     * 当支付成功时，易宝会访问这里
     * 用两种方法访问：
     * 1. 引导用户的浏览器重定向(如果用户关闭了浏览器，就不能访问这里了)
     * 2. 易宝的服务器会使用点对点通讯的方法访问这个方法。（必须回馈success，不然易宝服务器会一直调用这个方法）
     *返回的字符串
     * chrome://coba/content/container.xhtml?
     * url=http://localhost:8080/Order/back?p1_MerId=10001126856&r0_Cmd
     * =Buy&r1_Code=1&r2_TrxId=618363844562182G&r3_Amt=0.01&r4_Cur=RMB&r5_Pid=&r6_Order=8A3DB79A30DE41A3BB3A1EECE4507591&r7_Uid=&r8_MP=&r9_BType=1&ru_Trxtime=20170427171448&ro_BankOrderId=5092857799170427&rb_BankId=POST-NET&rp_PayDate=20170427171448&rq_CardNo=&rq_SourceFee=0.0&rq_TargetFee=0.0&hmac=e5a3faa697aa6e2263d23db6db22fce0
     */
    @RequestMapping("/back")
    public String back(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& back方法执行......");
        /*
		 * 1. 获取12个参数
		 */
        String p1_MerId = req.getParameter("p1_MerId");
        String r0_Cmd = req.getParameter("r0_Cmd");
        String r1_Code = req.getParameter("r1_Code");
        String r2_TrxId = req.getParameter("r2_TrxId");
        String r3_Amt = req.getParameter("r3_Amt");
        String r4_Cur = req.getParameter("r4_Cur");
        String r5_Pid = req.getParameter("r5_Pid");
        String r6_Order = req.getParameter("r6_Order");
        String r7_Uid = req.getParameter("r7_Uid");
        String r8_MP = req.getParameter("r8_MP");
        String r9_BType = req.getParameter("r9_BType");
        String hmac = req.getParameter("hmac");
		/*
		 * 2. 获取keyValue
		 */
        Properties props = new Properties();
        props.load(this.getClass().getClassLoader().getResourceAsStream("payment.properties"));
        String keyValue = props.getProperty("keyValue");
        /*
		 * 3. 调用PaymentUtil的校验方法来校验调用者的身份
		 *   >如果校验失败：保存错误信息，转发到msg.jsp
		 *   >如果校验通过：
		 *     * 判断访问的方法是重定向还是点对点，如果要是重定向
		 *     修改订单状态，保存成功信息，转发到msg.jsp
		 *     * 如果是点对点：修改订单状态，返回success
		 */
        boolean bool = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId,
                r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType,
                keyValue);
        if(!bool) {
            System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& 校验失败......");
            req.setAttribute("code", "error");
            req.setAttribute("msg", "无效的签名，支付失败！（你不是好人）");
            return "msg";
        }
        if(r1_Code.equals("1")) {
            //修改订单状态
            seckillOrderService.updateStateByorderId(r6_Order, 1);
            System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& 修改订单状态......");
            if(r9_BType.equals("1")) {
                req.setAttribute("code", "success");
                req.setAttribute("msg", "恭喜，支付成功！");
                return "msg";
            } else if(r9_BType.equals("2")) {
                resp.getWriter().print("success");
            }
        }
        return null;
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
    @RequestMapping(value = "/order/{orderId}/{state}", method = RequestMethod.PUT)
    @ResponseBody
    public boolean updateorderState(@PathVariable String orderId, @PathVariable int state) {
        int count = seckillOrderService.updateStateByorderId(orderId, state);
        if (count == 0) {
            return false;
        }
        return true;
    }
}
