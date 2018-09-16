package egovframework.example.admin.cmmn.utils;

import com.google.gson.Gson;

public class JsonUtils {
	private static Gson gson;
	static{
		gson = new Gson();
	}
	
	public static String convertToJsonString(Object object){
		return gson.toJson(object);
	}
	
	public static <T> T convertFromJson(String json, Class<T> type){
		return gson.fromJson(json, type);
	}
}
