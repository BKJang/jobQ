package egovframework.example.admin.cmmn.datatable;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class JobqDataTableApplyConvertor extends JobqDataTableConvertorTemplate {

	@Override
	protected void storeDataToJsonObject(List<Map<String, Object>> list, JsonArray rows, SimpleDateFormat simpleDateFormat) {
		for (Map<String, Object> apply : list) {
			JsonObject cell = new JsonObject();
			
			cell.addProperty("no", String.valueOf(apply.get("APPLY_NUMBER")));
			cell.addProperty("companyName", (String)apply.get("COMPANY_NAME"));
			cell.addProperty("title", (String)apply.get("JOB_TITLE"));
			cell.addProperty("resumeNumber", String.valueOf(apply.get("RESUME_NUMBER")));
			cell.addProperty("id", (String)apply.get("MEMBER_ID"));
			cell.addProperty("email", String.valueOf(apply.get("MEMBER_EMAIL")));
			cell.addProperty("regDate", simpleDateFormat.format((Timestamp)apply.get("DATE_APPLY")));
			
			processData(cell, apply);
			rows.add(cell);
		}
	}
	
	private void processData(JsonObject cell, Map<String, Object> apply){
		String isSuccess = String.valueOf(apply.get("IS_SUCCESS"));
		
		if(String.valueOf(apply.get("READ")).equals("0"))
			cell.addProperty("read", "미열람");
		else
			cell.addProperty("read", "열람");
		
		if(isSuccess.equals("0"))
			cell.addProperty("isSuccess", "미정");
		else if(isSuccess.equals("1"))
			cell.addProperty("isSuccess", "합격");
		else
			cell.addProperty("isSuccess", "불합격");
	}

}
