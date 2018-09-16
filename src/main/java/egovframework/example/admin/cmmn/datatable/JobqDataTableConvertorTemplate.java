package egovframework.example.admin.cmmn.datatable;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public abstract class JobqDataTableConvertorTemplate {
	
	public final JsonObject convertDataToJqGridJson(List<Map<String, Object>> list){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		JsonArray rows = new JsonArray();
		JsonObject object = new JsonObject();
		
		storeDataToJsonObject(list, rows, simpleDateFormat);
		object.add("data", rows);
	
		return object;
	}

	protected abstract void storeDataToJsonObject(List<Map<String, Object>> list, JsonArray rows, SimpleDateFormat simpleDateFormat);
}
