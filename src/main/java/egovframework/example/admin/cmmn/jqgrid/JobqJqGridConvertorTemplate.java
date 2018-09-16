package egovframework.example.admin.cmmn.jqgrid;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.utils.JsonUtils;

public abstract class JobqJqGridConvertorTemplate {
	
	public final JsonObject convertDataToJqGridJson(int page, List<Map<String, Object>> list, int row, int allListCnt, int allPageCnt) throws Exception{
		JsonObject object = new JsonObject();
		JsonArray rows = new JsonArray();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		object.addProperty("page", page);
		object.addProperty("total", allPageCnt);
		
		storeDataToJsonObject(list, simpleDateFormat, rows);
		object.add("list", rows);
		
		return object;
	}
	
	protected abstract void storeDataToJsonObject(List<Map<String, Object>> list, SimpleDateFormat simpleDateFormat, JsonArray rows);
}
