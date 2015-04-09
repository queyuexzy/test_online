package com.test_online.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Set;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ser.FilterProvider;
import org.codehaus.jackson.map.ser.impl.SimpleBeanPropertyFilter;
import org.codehaus.jackson.map.ser.impl.SimpleFilterProvider;
import org.codehaus.jackson.type.TypeReference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.test_online.exception.ExceptionHelper;

/**
 * jackjson一些转换方法
 * @author zhangying
 * @date   2015年3月16日 上午10:25:17
 */
public class JackJson {
	public static Logger logger = LoggerFactory.getLogger(JackJson.class);
	/** 格式化时间的string */
	private static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

	/**
	 * jackjson把json字符串转换为Java对象的实现方法
	 * @Title: fromJsonToObject
	 * @data:2015年3月16日上午10:25:25
	 * @author:zhangying
	 * @param json
	 * @param typeReference
	 * @return T
	 */
	public static <T> T fromJsonToObject(String json, TypeReference<T> typeReference) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.readValue(json, typeReference);
		} catch (JsonParseException e) {
			logger.error(ExceptionHelper.getStackTrace(e));
		} catch (JsonMappingException e) {
			logger.error(ExceptionHelper.getStackTrace(e));
		} catch (IOException e) {
			logger.error(ExceptionHelper.getStackTrace(e));
		}
		return null;
	}

	/**
	 * json转换为java对象
	 * @Title: fromJsonToObject
	 * @data:2015年3月16日上午10:25:32
	 * @author:zhangying
	 * @param json
	 * @param valueType
	 * @return T
	 */
	public static <T> T fromJsonToObject(String json, Class<T> valueType) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.readValue(json, valueType);
		} catch (JsonParseException e) {
			logger.error("JsonParseException: ", e);
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException: ", e);
		} catch (IOException e) {
			logger.error("IOException: ", e);
		}
		return null;
	}

	/**
	 * java对象转换为json字符串
	 * @Title: fromObjectToJson
	 * @data:2015年3月16日上午10:25:36
	 * @author:zhangying
	 * @param object
	 * @return String
	 */
	public static String fromObjectToJson(Object object) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(object);
		} catch (JsonGenerationException e) {
			logger.error("JsonGenerationException: ", e);
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException: ", e);
		} catch (IOException e) {
			logger.error("IOException: ", e);
		}
		return null;
	}

	/**
	 * java对象转换为json字符串
	 * @Title: fromObjectToJson
	 * @data:2015年3月16日上午10:25:52
	 * @author:zhangying
	 * @param object
	 * @param filterName
	 * @param properties
	 * @return String
	 */
	@SuppressWarnings("deprecation")
	public static String fromObjectToJson(Object object, String filterName, Set<String> properties) {
		ObjectMapper mapper = new ObjectMapper();
		FilterProvider filters = new SimpleFilterProvider().addFilter(filterName,
				SimpleBeanPropertyFilter.serializeAllExcept(properties));
		try {
			return mapper.filteredWriter(filters).writeValueAsString(object);
		} catch (JsonGenerationException e) {
			logger.error("JsonGenerationException: ", e);
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException: ", e);
		} catch (IOException e) {
			logger.error("IOException: ", e);
		}
		return null;
	}

	/**
	 * java对象转换为json字符串
	 * @Title: fromObjectToJson
	 * @data:2015年3月16日上午10:26:00
	 * @author:zhangying
	 * @param object
	 * @param filterName
	 * @param property
	 * @return String
	 */
	@SuppressWarnings("deprecation")
	public static String fromObjectToJson(Object object, String filterName, String property) {
		ObjectMapper mapper = new ObjectMapper();
		FilterProvider filters = new SimpleFilterProvider().addFilter(filterName,
				SimpleBeanPropertyFilter.serializeAllExcept(property));
		try {
			return mapper.filteredWriter(filters).writeValueAsString(object);
		} catch (JsonGenerationException e) {
			logger.error("JsonGenerationException: ", e);
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException: ", e);
		} catch (IOException e) {
			logger.error("IOException: ", e);
		}
		return null;
	}

	/**
	 * java对象(包含日期字段或属性)转换为json字符串
	 * @Title: fromObjectHasDateToJson
	 * @data:2015年3月16日上午10:26:07
	 * @author:zhangying
	 * @param object
	 * @return String
	 */
	public static String fromObjectHasDateToJson(Object object) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.getSerializationConfig().withDateFormat(new SimpleDateFormat(DATE_TIME_FORMAT));
		try {
			return mapper.writeValueAsString(object);
		} catch (JsonGenerationException e) {
			logger.error("JsonGenerationException: ", e);
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException: ", e);
		} catch (IOException e) {
			logger.error("IOException: ", e);
		}
		return null;
	}

	/**
	 * java对象(包含日期字段或属性)转换为json字符串
	 * @Title: fromObjectHasDateToJson
	 * @data:2015年3月16日上午10:26:13
	 * @author:zhangying
	 * @param object
	 * @param dateTimeFormatString
	 * @return String
	 */
	public static String fromObjectHasDateToJson(Object object, String dateTimeFormatString) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.getSerializationConfig().withDateFormat(new SimpleDateFormat(dateTimeFormatString));
		try {
			return mapper.writeValueAsString(object);
		} catch (JsonGenerationException e) {
			logger.error("JsonGenerationException: ", e);
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException: ", e);
		} catch (IOException e) {
			logger.error("IOException: ", e);
		}
		return null;
	}
}
