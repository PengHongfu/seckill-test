package com.peng.seckill.user.web;

import com.peng.seckill.user.entity.User;
import com.peng.seckill.user.exception.UserException;
import com.peng.seckill.user.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Peng
 * Time: 2017/4/17 16:54
 */
@SessionAttributes(value = {"sessionuser"})
@RequestMapping("/User")
@Controller
public class UserController {


    @Autowired
    private UserService userService;


    /**
     * 跳转到我的信息页面
     *
     * @return
     */
    @RequestMapping(value = "/mymsg", method = RequestMethod.GET)
    public String mymsg(HttpSession session, Model model) {
        User user = (User) session.getAttribute("sessionuser");
        user = userService.selectByPrimaryKey(user.getUid());
        model.addAttribute("sessionuser", user);
        model.addAttribute("usermsg", user);
        return "user/usermsg";
    }

    /**
     * 退出
     * @param sessionStatus
     * @return
     */
    @RequestMapping("/exit")
    public String exit( SessionStatus sessionStatus){
        //删除sessionuser
       sessionStatus.setComplete();
        return "redirect:tologin";
    }

    /**
     * 跳转到页面
     *
     * @param url
     * @return
     */

    @RequestMapping("/sdfsdf/{url}")
    public String testtoshowUser(@PathVariable String url) {

        return "user/" + url;
    }

    /**
     * 跳转到注册页面
     *
     * @return
     */
    @RequestMapping("/toregist")
    public String toregist() {
        return "user/regist";
    }

    /**
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping("/tologin")
    public String tologin(@RequestParam(value = "backseckillId", defaultValue = "0", required = false) long backseckillId,
                          Model model) {
        model.addAttribute("backseckillId", backseckillId);
        return "user/login";
    }

    /**
     * 注册
     *
     * @param user
     * @return
     */
    @RequestMapping("/regist")
    public String regist(@Valid User user, BindingResult bindingResult,
                         Model model) {
        System.out.println("User..." + user.toString());
        if(bindingResult.getErrorCount()>0){
            for (FieldError error : bindingResult.getFieldErrors()) {
                System.out.println(error.getField() + ":" + error.getDefaultMessage());
                model.addAttribute(error.getField(),error.getDefaultMessage());
            }
            return "forward:toregist";
        }else {
            try {
                int i = userService.insertSelective(user);
                if (i > 0) {
                    model.addAttribute("code", "success");
                    model.addAttribute("msg", "注册成功");
                } else {
                    model.addAttribute("code", "error");
                    model.addAttribute("msg", "注册失败");
                }
            } catch (UserException e) {
                model.addAttribute("code", "error");
                model.addAttribute("msg", "注册失败,发生异常了");
                return "msg";
            }

        }
        return "msg";
    }

    /**
     * 登录
     *
     * @param user
     * @return
     */
    @RequestMapping("/login")
    public String login(User user, Model model, @RequestParam(value = "backseckillId", defaultValue = "0") long backseckillId) {

        User returnuser = null;
        try {
            returnuser = userService.selectByNameAndPass(user);
        } catch (UserException e) {
            throw new UserException("登录失败");
        }
        if (returnuser == null) {
            model.addAttribute("loginmsg", "用户名或密码错误");
            model.addAttribute("form", user);
            return "forward:tologin";
        } else {
            model.addAttribute("sessionuser", returnuser);
            System.out.println("sessionuser******************************" + returnuser.toString());
            //获取在商品详情页发送的商品id，登录后直接跳转回该页
            if (backseckillId == 0) {
                return "redirect:../Seckill/main";
            } else {
                return "redirect:../Seckill/" + backseckillId + "/detail";
            }
        }

    }

    /**
     * ajax调用的方法 注册时验证用户名是否相同
     *
     * @param loginname
     * @return
     */
    @RequestMapping(value = "/checkNameExistsMethod1", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map checkNameValidMethod1(@RequestParam(value = "loginname", required = false) String loginname) {
        boolean result = true;
        Map<String, Boolean> map = new HashMap<>();
        if (loginname != null) {
            List<User> userList = userService.selectAll();
            for (User user : userList) {
                if (user.getLoginname().equals(loginname)) {
                    result = false;
                    break;
                }
            }
            map.put("valid", result);
        }
        return map;
    }

    /**
     * ajax调用的方法 登录时验证用户名是否相同
     *
     * @param loginname
     * @return
     */
    @RequestMapping(value = "/checkNameExistsMethod2", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map checkNameValidMethod2(@RequestParam(value = "loginname", required = false) String loginname) {
        boolean result = false;
        Map<String, Boolean> map = new HashMap<>();
        if (loginname != null) {
            List<User> userList = userService.selectAll();
            for (User user : userList) {
                if (user.getLoginname().equals(loginname)) {
                    result = true;
                    break;
                }
            }
            map.put("valid", result);
        }
        return map;
    }

    /**
     * 验证旧密码
     * @return
     */
    @RequestMapping(value = "/checkOldloginpass",
            produces = "application/json;charset=UTF-8",method = RequestMethod.POST)
    @ResponseBody
    public Map checkOldloginpass(@RequestParam("oldloginpass")String oldloginpass,HttpSession session) {
        System.out.println("*************************"+oldloginpass);
        boolean result = false;
        Map<String, Boolean> map = new HashMap<>();
        User sesionuser = (User) session.getAttribute("sessionuser");
        sesionuser = userService.selectByPrimaryKey(sesionuser.getUid());
        if(sesionuser.getLoginpass().equals(oldloginpass.trim())){
            //相等
            result = true;
        }
        map.put("valid", result);
        return map;
    }

    /**
     * 修改密码
     * @param newloginpass
     * @return
     */
    @RequestMapping(value = "/pwd",
            produces = "application/json;charset=UTF-8",method = RequestMethod.PUT)
    @ResponseBody
    public Map pwd(String newloginpass,String uid) {
        Map<String, Boolean> map = new HashMap<>();
        boolean result = true;
        User pwduser = new User();
        pwduser.setUid(uid);
        pwduser.setLoginpass(newloginpass);
        int count =  userService.updateByPrimaryKeySelective(pwduser);
        if(count==0){
           result = false;
        }
        map.put("success", result);
        return map;
    }
    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/mymsg", method = RequestMethod.PUT, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map updatemsg( User user) {
        System.out.println(user.toString());
        Map map = new HashMap();
        boolean result = true;
        int count = userService.updateByPrimaryKeySelective(user);
        if (count == 0) {
            //更新失败
            result = false;
        }
        map.put("success", result);
        return map;
    }
    /**
     * 测试返回json
     *
     * @return
     */
    @RequestMapping(value = "/check", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map returnjson(HttpSession session) {

        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", false);
        return map;
    }
}
