package egovframework.example.admin.cmmn.jqgrid;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class JobqJqGridResumeConvertor extends JobqJqGridConvertorTemplate {

	@Override
	protected void storeDataToJsonObject(List<Map<String, Object>> list, SimpleDateFormat simpleDateFormat, JsonArray rows) {
		for (Map<String, Object> member : list) {
			JsonObject cell = new JsonObject();
			
			cell.addProperty("no", String.valueOf(member.get("RE_NUMBER")));
			cell.addProperty("id", (String)member.get("ID"));
			cell.addProperty("title", ((String)member.get("TITLE")));
			cell.addProperty("area", (String)member.get("AREA"));
			cell.addProperty("salary", (String)member.get("SALARYHOPE") + "만원");
			cell.addProperty("skill", (String)member.get("SKILL"));
			cell.addProperty("public", (String)member.get("OPEN"));
			cell.addProperty("regDate", simpleDateFormat.format((Timestamp)member.get("DATE_REGI")));
			
			if(((String)member.get("OPEN")).equals("Y"))
				cell.addProperty("public", "공개");
			else
				cell.addProperty("public", "비공개");
			
			
			if(member.containsKey("DATE_MODI"))
				cell.addProperty("updateDate", simpleDateFormat.format((Timestamp)member.get("DATE_MODI")));
			else
				cell.addProperty("updateDate", "미정");
				
			rows.add(cell);
		}
	}

}
