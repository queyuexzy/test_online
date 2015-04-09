/*  
 * @(#) FlexigridFilter.java Create on 2012-2-6 上午9:45:08   
 *   
 * Copyright 2012 by xl.   
 */

package com.test_online.flexigrid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.test_online.flexigrid.bean.Addparams;
import com.test_online.flexigrid.bean.FlexiGrid;

/**
 * 
 * @author zhanghongliang
 * @date 2012-2-6
 */
public class FlexigridFilter {
	public static Map<String, Object> parseFlexigrid(FlexiGrid flexiGrid) {
		Map<String, Object> params = new HashMap<String, Object>();
		List<Addparams> addparams = flexiGrid.getAddparams();
		if (addparams != null && addparams.size() > 0) {
			for (Addparams tmpAdd : addparams) {
				if (StringUtils.isNotBlank(tmpAdd.getName()) && tmpAdd.getValue() != null && StringUtils.isNotBlank(tmpAdd.getValue().toString())) {
					params.put(tmpAdd.getName().trim(), tmpAdd.getValue());
				}
			}
		}

		params.put("pageNow", flexiGrid.getPage());
		params.put("pageSize", flexiGrid.getPagesize());

		if (StringUtils.isNotBlank(flexiGrid.getSortname()) && StringUtils.isNotBlank(flexiGrid.getSortorder())) {
			params.put("_order_by", flexiGrid.getSortname() + " " + flexiGrid.getSortorder());
		}

		return params;
	}
}
