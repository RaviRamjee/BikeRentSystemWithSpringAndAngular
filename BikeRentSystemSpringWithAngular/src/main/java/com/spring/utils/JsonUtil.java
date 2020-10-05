package com.spring.utils;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.spring.user.User;

public class JsonUtil {

	Gson gson = new Gson();

	public <T> T jsonToObject(Class<T> t, String json) throws Exception {

		return gson.fromJson(json, t);
	}

	public <T>  String objectToJson(T t) throws Exception {

				
		return gson.toJson(t);
	}

}
