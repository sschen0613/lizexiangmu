package com.yr.lize.interceptor;

import com.yr.lize.pojo.SystemStaff;
import com.yr.lize.system.service.ISystemStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 过滤用户登录, 进行验证
 * 
 * HandlerInterceptor接口 SpringMVC的拦截器
 * 
 */
public class StaffInterceptor implements HandlerInterceptor{

    @Autowired
    private ISystemStaffService systemStaffService;

	@Override
	/**
	 * 请求执行完时调用
	 */
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	/**
	 * 返回视图时, 调用该方法
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	/**
	 * 需要被拦截的请求Contoller执行之前, 执行该方法
	 * 
	 * 当该方法返回false时, 请求被拦截, 
	 * 当该方法返回true时, 请求放行.
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("用户登录验证");
		
		// 过滤用户登录
		// 判断用户是否已经登录
		HttpSession session = request.getSession();

		//判断此次请求是否为消息请求
        String dingStaffid = request.getParameter("dingStaffid");
        if (dingStaffid != null && !"".equals(dingStaffid)){
            SystemStaff systemStaff = systemStaffService.selectStaffByDingdingStaffId(dingStaffid);
            if (systemStaff != null){
                session.setAttribute("systemStaff",systemStaff);
            }else {
                return false;
            }
        }

        SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");

		// 用户已经登录
		if (staff != null) {
			// 放行
			return true;
		} else {
			// 用户没有登录
			// 跳转到登录页面, 重定向到登录页面
			response.sendRedirect( "../login.jsp");
		}
		
		return false;
	}

}
