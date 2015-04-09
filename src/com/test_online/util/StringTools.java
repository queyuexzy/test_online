package com.test_online.util;

public class StringTools {
	public static String toTrim(String str) {
		if (str == null)
			return "";
		if (str.trim().equalsIgnoreCase("null")) {
			return "";
		}
		return str.trim();
	}
}