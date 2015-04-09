package com.test_online_filter;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.test_online.base.BaseAction;
import com.test_online.exception.ExceptionUtil;
import com.test_online.global.GlobalConstants;
import com.test_online.module.UserBean;
import com.test_online.util.AjaxResponse;
import com.test_online.util.CommonSendMeg;
import com.test_online.util.JackJson;

@Controller
@Scope("prototype")
/*
 * 判断用户session信息的拦截器
 */
public class LoginFilter extends BaseAction implements Interceptor {
	private static final long serialVersionUID = -7910829141441069810L;
	private static Logger logger = LoggerFactory.getLogger(LoginFilter.class);

	@Override
	public void destroy() {
		logger.info("LoginFilter destroy");
	}

	@Override
	public void init() {
		logger.info("LoginFilter start");
	}

<<<<<<< HEAD
	/*
	 * 判断用户是否已经登录 如果session失效，需重新登录 若为ajax请求，session -5 失效时写回页面 值 -1 || null 为异常
	 * (non-Javadoc)
	 * @see com.opensymphony.xwork2.interceptor.Interceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 * @param arg0
	 * @return
	 * @throws Exception
	 * @date: 2015年4月9日下午2:09:49
	 * @author: zhangying
=======
	/**
	 * 判断用户是否已经登录 如果session失效，需重新登录 若为ajax请求，session -5 失效时写回页面 值 -1 || null 为异常
	 * 
	 * @author zhl
	 * @date 2011-8-31上午11:00:33
	 * 
	 * @param arg0
	 * @return
	 * @throws Exception
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		try {
			// 从session中取出用户信息，如果为null，跳转到login.jsp，不为null，继续执行方法
			
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String requestURI = request.getRequestURI();
			
			if(requestURI.endsWith("login")){
				return arg0.invoke();
			}
			
			UserBean userBean = getCurrentUser();
			
			if(requestURI.endsWith("login") && userBean != null){
				if(userBean.getTeamStatus() == 0){
					return TOADMIN;
				}else if(userBean.getTeamStatus() == 1){
					return TOTEACHER;
				}else{
					return TOSTUDENT;
				}
			}
			if(requestURI.endsWith("register") && userBean == null){
				return arg0.invoke();
			}
			
			if(requestURI.endsWith("idIfExist") && userBean == null){
				return arg0.invoke();
			}
			
			if (userBean == null) {
				ServletActionContext.getRequest().getSession().invalidate();
				if (GlobalConstants.FLAG_REQUEST_TYPE_AJAX
						.equals(getFromRequestParameter(GlobalConstants.KEY_REQUEST_TYPE))) {
					// 如果ajax请求，返回未登录错误
					CommonSendMeg.writeMsg(JackJson
							.fromObjectToJson(new AjaxResponse(
									AjaxResponse.AJAX_CODE_NO_LOGIN)));
					return null;
				} else {
					// 如果session失效 则转到login.jsp
					putToSession(GlobalConstants.KEY_ERROR_INFO,
							AjaxResponse.AJAX_CODE_NO_LOGIN.getMessage());
					return LOGOUT;
				}
			} else {
				return arg0.invoke();
			}
		} catch (Exception e) {
			logger.error(ExceptionUtil.getStackTrace(e));
			e.printStackTrace();
			return ERROR;
		}
	}
}
