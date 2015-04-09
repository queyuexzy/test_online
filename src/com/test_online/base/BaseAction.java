package com.test_online.base;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.test_online.global.GlobalConstants;
import com.test_online.module.UserBean;
import com.test_online.util.AjaxResponse;
import com.test_online.util.JackJson;

/**
 * 最基本action 其他aciton 需时他的子类
<<<<<<< HEAD
 * @author zhangying
 * @date   2015年4月9日 下午3:06:51
=======
 * 
 * @author zhl
 * @date 20112011-8-24下午02:30:06
 * 
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
 */
public abstract class BaseAction extends ActionSupport implements
		ServletResponseAware {

	private static final long serialVersionUID = 8961759601977025276L;

	protected HttpServletResponse response;

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;

	}

	protected Logger logger = LoggerFactory.getLogger(BaseAction.class);
	/*
	 * 跳转到教师界面
	 */
	protected final static String TOTEACHER = "toTeacher";

	/*
	 * 跳转到学生界面
	 */
	protected final static String TOSTUDENT = "toStudent";
	
	/*
	 * 跳转到管理员界面
	 */
	protected final static String TOADMIN = "toAdmin";

	/*
	 * 退出系统
	 */
	protected final static String LOGOUT = "logout";

	/*
	 * 没有权限页面
	 */
	protected final static String NOPRIVILEGE = "noPrivilege";
	
	/*
	 * 登录名或密码错误
	 */
	protected final static String NO_OR_PASSWORD_ERROR = "noOrPasswordError";
	
	/*
	 * 登录名、密码验证成功
	 */
	protected final static String SUCCESS = "success";
	
	/*
	 * 登陆名、密码格式不正确
	 */
	protected final static String ILLEGAL_PARAM = "illegalParam";
	

	/**
	 * 放入context数据
<<<<<<< HEAD
	 * @Title: putToContext
	 * @data:2015年4月9日下午3:07:05
	 * @author:zhangying
	 * @param key
	 * @param value void
=======
	 * 
	 * @author zhl
	 * @date 20112011-8-24下午02:20:42
	 * 
	 * @param key
	 * @param value
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected void putToContext(String key, Object value) {
		ActionContext.getContext().put(key, value);
	}

	/**
<<<<<<< HEAD
	 *  从context中取数据
	 * @Title: getFromContext
	 * @data:2015年4月9日下午3:07:13
	 * @author:zhangying
	 * @param key
	 * @return Object
=======
	 * 从context中取数据
	 * 
	 * @author zhl
	 * @date 20112011-8-24下午02:28:42
	 * 
	 * @param key
	 * @return
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected Object getFromContext(String key) {
		return ActionContext.getContext().get(key);
	}

	/**
	 * 放入session数据
<<<<<<< HEAD
	 * @Title: putToSession
	 * @data:2015年4月9日下午3:07:21
	 * @author:zhangying
	 * @param key
	 * @param value void
=======
	 * 
	 * @author zhl
	 * @date 20112011-8-24下午02:20:56
	 * 
	 * @param key
	 * @param value
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected void putToSession(String key, Object value) {
		ServletActionContext.getRequest().getSession().setAttribute(key, value);
	}

	/**
	 * 从session中取数据
<<<<<<< HEAD
	 * @Title: getFromSession
	 * @data:2015年4月9日下午3:07:30
	 * @author:zhangying
	 * @param key
	 * @return Object
=======
	 * 
	 * @author zhl
	 * @date 20112011-8-24下午02:26:22
	 * 
	 * @param key
	 * @return
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected static Object getFromSession(String key) {
		return ServletActionContext.getRequest().getSession().getAttribute(key);
	}

	/**
	 * Invalidate the session.
<<<<<<< HEAD
	 * @Title: invalidateSession
	 * @data:2015年4月9日下午3:07:40
	 * @author:zhangying void
=======
	 * 
	 * @author Luo Yinzhuo
	 * @date 2014年8月25日 下午2:37:57
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected static void invalidateSession() {
		ServletActionContext.getRequest().getSession().invalidate();
	}

	/**
	 * 从request Attribute中取数据
<<<<<<< HEAD
	 * @Title: getFromRequstAttribute
	 * @data:2015年4月9日下午3:07:52
	 * @author:zhangying
	 * @param key
	 * @return Object
=======
	 * 
	 * @author zhl
	 * @date 20112011-8-24下午04:00:17
	 * 
	 * @param key
	 * @return
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected Object getFromRequstAttribute(String key) {
		return ServletActionContext.getRequest().getAttribute(key);
	}

	/**
	 * 从request Parameter中取数据
<<<<<<< HEAD
	 * @Title: getFromRequestParameter
	 * @data:2015年4月9日下午3:08:05
	 * @author:zhangying
	 * @param key
	 * @return String
=======
	 * 
	 * @author zhl
	 * @date 20112011-8-25下午09:33:11
	 * 
	 * @param key
	 * @return
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected String getFromRequestParameter(String key) {
		return ServletActionContext.getRequest().getParameter(key);
	}

	/**
<<<<<<< HEAD
	 * downloadFile
	 * @Title: downloadFile
	 * @data:2015年4月9日下午3:08:17
	 * @author:zhangying
	 * @param filePath
	 * @throws Exception void
=======
	 * 
	 * @Title: downloadFile
	 * @author zhaoxin1
	 * @Description: 下载文件
	 * @date 2014年9月25日 上午10:30:38
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected void downloadFile(String filePath) throws Exception {
		File f = new File(filePath);
		if (!f.exists()) {
			response.sendError(404, "File not found!");
			return;
		}
		BufferedInputStream br = new BufferedInputStream(new FileInputStream(f));
		byte[] buf = new byte[1024];
		int len = 0;
		response.reset();
		response.setContentType("application/x-msdownload");
		response.setHeader("Content-Disposition",
				"attachment; filename=" + f.getName());
		OutputStream out = response.getOutputStream();
		while ((len = br.read(buf)) > 0)
			out.write(buf, 0, len);
		br.close();
		out.close();
	}

	/** The validate function prefix. */
	protected static final String VALIDATE_PREFIX = "validate";

	/**
	 * Extract the specified parameters in the request.
	 * 
	 * @param keys
	 *            The specified parameter keys.
	 * @return The request parameter.
	 * @throws RequestParameterException
	 *             If any error occurs.
<<<<<<< HEAD
	 * @author zhangying
=======
	 * @author Luo Yinzhuo
	 * @date 2015年2月10日 下午3:06:56
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	protected RequestParameter extractParameter(String[] keys)
			throws RequestParameterException {
		final RequestParameter param = new RequestParameter();
		for (String key : keys) {
			final String value = getFromRequestParameter(key);
			final String methodName = VALIDATE_PREFIX.concat(
					key.substring(0, 1).toUpperCase()).concat(key.substring(1));

			try {
				Method validate = this.getClass().getMethod(methodName,
						String.class);
				if (Boolean.TRUE.equals(validate.invoke(this, value))) {
					param.put(key, value);
				} else {
					final AjaxResponse ajaxResponse = new AjaxResponse(
							AjaxResponse.AJAX_CODE_ILLEGAL_PARAM);
					ajaxResponse.setData(String.format("参数错误！ key:%s value:%s",
							key, (value != null ? value : "null")));
					throw new RequestParameterException(
							JackJson.fromObjectToJson(ajaxResponse));
				}
			} catch (NoSuchMethodException e) {
				final AjaxResponse ajaxResponse = new AjaxResponse(
						AjaxResponse.AJAX_CODE_MISSING_VALIDATE_FUNCTION);
				ajaxResponse.setData(String.format("缺少验证函数！ key:%s", key));
				throw new RequestParameterException(
						JackJson.fromObjectToJson(ajaxResponse));
			} catch (SecurityException e) {
				final AjaxResponse ajaxResponse = new AjaxResponse(
						AjaxResponse.AJAX_CODE_ACCESS_VALIDATE_FUNCTION_FAILED);
				ajaxResponse.setData(String.format("无法访问验证函数！ key:%s", key));
				throw new RequestParameterException(
						JackJson.fromObjectToJson(ajaxResponse));
			} catch (IllegalAccessException e) {
				final AjaxResponse ajaxResponse = new AjaxResponse(
						AjaxResponse.AJAX_CODE_ACCESS_VALIDATE_FUNCTION_FAILED);
				ajaxResponse.setData(String.format("无法访问验证函数！ key:%s", key));
				throw new RequestParameterException(
						JackJson.fromObjectToJson(ajaxResponse));
			} catch (IllegalArgumentException e) {
				final AjaxResponse ajaxResponse = new AjaxResponse(
						AjaxResponse.AJAX_CODE_ILLEGAL_PARAM);
				ajaxResponse.setData(String.format("参数错误！ key:%s value:%s",
						key, (value != null ? value : "null")));
				throw new RequestParameterException(
						JackJson.fromObjectToJson(ajaxResponse));
			} catch (InvocationTargetException e) {
				final AjaxResponse ajaxResponse = new AjaxResponse(
						AjaxResponse.AJAX_CODE_ACCESS_VALIDATE_FUNCTION_FAILED);
				ajaxResponse.setData(String.format("无法访问验证函数！ key:%s", key));
				throw new RequestParameterException(
						JackJson.fromObjectToJson(ajaxResponse));
			}
		}
		return param;
	}

	/**
	 * A wrapper class to wrap the parameter in the request.
<<<<<<< HEAD
	 * @author zhangying
	 * @date   2015年4月9日 下午3:08:51
=======
	 * 
	 * @author Luo Yinzhuo
	 * @date 2015年2月10日 下午3:55:41
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 */
	public class RequestParameter {
		/** The parameter map. */
		private final Map<String, String> parameterMap = new HashMap<String, String>();

		/**
		 * Get the specified key's parameter.
		 * 
		 * @param key
		 *            The parameter key.
		 * @return The parameter.
		 * @throws RequestParameterException
		 *             If the parameter doesn't exist.
<<<<<<< HEAD
		 * @author zhangying
=======
		 * @author Luo Yinzhuo
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
		 * @date 2015年2月10日 下午3:56:23
		 */
		public String get(String key) throws RequestParameterException {
			if (parameterMap.containsKey(key)) {
				return parameterMap.get(key);
			} else {
				final AjaxResponse ajaxResponse = new AjaxResponse(
						AjaxResponse.AJAX_CODE_MISSING_PARAMETER);
				ajaxResponse.setData(String.format("缺少参数！ key:%s", key));
				throw new RequestParameterException(
						JackJson.fromObjectToJson(ajaxResponse));
			}
		}

		/**
		 * Put a key-parameter pair.
		 * 
		 * @param key
		 *            The key.
		 * @param value
		 *            The parameter.
<<<<<<< HEAD
		 * @author zhangying
=======
		 * @author Luo Yinzhuo
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
		 * @date 2015年2月10日 下午3:57:11
		 */
		void put(String key, String value) {
			parameterMap.put(key, value);
		}
	}

	/**
	 * The exception occurs during extraction request parameters.
	 * 
<<<<<<< HEAD
	 * @author zhangying
=======
	 * @author Luo Yinzhuo
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 * @date 2015年2月10日 下午3:30:59
	 */
	public static class RequestParameterException extends Exception {
		private static final long serialVersionUID = 4333335657286971633L;

		public RequestParameterException(String message) {
			super(message);
		}
	}

	/**
	 * Validate the flexiGrid query json.
	 * 
	 * @param flexiGridQuery
	 *            The flexiGrid query json.
	 * @return True if valid, otherwise false.
<<<<<<< HEAD
	 * @author zhangying
=======
	 * @author Luo Yinzhuo
>>>>>>> 374cef2ba616611f64614598117dc654ed31c2d8
	 * @date 2015年2月10日 下午3:00:25
	 */
	public boolean validateQuery_json(String flexiGridQuery) {
		return flexiGridQuery != null && flexiGridQuery.length() > 0;
	}
	
	public UserBean getCurrentUser(){
	
		Object user = ServletActionContext.getRequest().getSession().getAttribute(GlobalConstants.CURRENT_USER);
		
		if(user != null && user instanceof UserBean){
			return (UserBean) user;
		}
		return null;
	}
	
	public void removeUserFromSession(){
		ServletActionContext.getRequest().getSession().removeAttribute(GlobalConstants.CURRENT_USER);
	}
}
