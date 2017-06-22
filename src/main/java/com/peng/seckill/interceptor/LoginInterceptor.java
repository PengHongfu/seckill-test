package com.peng.seckill.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 * Created by Peng
 * Time: 2017/4/25 20:38
 */
public class LoginInterceptor implements HandlerInterceptor {


    /**
     * 该方法在目标请求方法之前被调用
     * return true 则继续调用后续的拦截器和目标方法
     * return false 当前和后续的拦截器都不会执行
     * 可以考虑做权限，日志，事务等 ，乱码处理
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        if(httpServletRequest.getSession()
                .getAttribute("sessionuser")==null){
            //没有登录
            System.out.println("******************************sessionuser为空，必须登录");
            httpServletResponse.sendRedirect("/User/tologin");
            return  false;
        }
        return  true;
    }
    /**
     * 调用目标方法之后，在DispatchServlet返回渲染视图之前
     * 可以对请求域中的属性和视图作出修改 这里可以操作ModelAndView
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }
    /**
     * 渲染视图之后被调用，返回了视图 ，主要用于释放资源
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
