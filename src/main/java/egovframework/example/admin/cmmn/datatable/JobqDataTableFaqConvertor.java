package egovframework.example.admin.cmmn.datatable;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class JobqDataTableFaqConvertor extends JobqDataTableConvertorTemplate {

	@Override
	protected void storeDataToJsonObject(List<Map<String, Object>> list, JsonArray rows, SimpleDateFormat simpleDateFormat) {
		for (Map<String, Object> faq : list) {
			JsonObject cell = new JsonObject();
			
			cell.addProperty("no", String.valueOf(faq.get("number")));
			cell.addProperty("subject", String.valueOf(faq.get("SUBJECT")));
			cell.addProperty("content", (String)faq.get("CONTENT"));
			cell.addProperty("title", (String)faq.get("TITLE"));
			cell.addProperty("regDate", simpleDateFormat.format((Timestamp)faq.get("DATE_REGI")));
			
			if(String.valueOf(faq.get("PUBLIC")).equals("Y"))
				cell.addProperty("public", "게재중");
			else
				cell.addProperty("public", "미게재");
			
			if(faq.containsKey("DATE_MODI"))
				cell.addProperty("updateDate", simpleDateFormat.format((Timestamp)faq.get("DATE_MODI")));
			else
				cell.addProperty("updateDate", "미정");
				
			rows.add(cell);
		}

	}

}
