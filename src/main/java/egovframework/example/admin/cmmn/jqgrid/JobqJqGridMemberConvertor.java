package egovframework.example.admin.cmmn.jqgrid;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


public class JobqJqGridMemberConvertor extends JobqJqGridConvertorTemplate{

	@Override
	protected void storeDataToJsonObject(List<Map<String, Object>> list, SimpleDateFormat simpleDateFormat, JsonArray rows) {
		for (Map<String, Object> member : list) {
			JsonObject cell = new JsonObject();
			
			if(((String)member.get("ID")).equals("admin"))
				continue;
			
			cell.addProperty("name", (String)member.get("NAME"));
			cell.addProperty("id", (String)member.get("ID"));
			cell.addProperty("email", (String)member.get("EMAIL"));
			// cell.addProperty("type", (String)member.get("TYPE"));
			cell.addProperty("regDate", simpleDateFormat.format((Timestamp)member.get("DATE_JOIN")));
			
			if(((String)member.get("TYPE")).equals("p"))
				cell.addProperty("type", "일반");
			else
				cell.addProperty("type", "기업");
			
			if(((String)member.get("PHONE")) == null)
				cell.addProperty("phone", "미입력");
			else
				cell.addProperty("phone", (String)member.get("PHONE"));	
				
			if(member.containsKey("DATE_MODI"))
				cell.addProperty("updateDate", simpleDateFormat.format((Timestamp)member.get("DATE_MODI")));
			else
				cell.addProperty("updateDate", "미정");
				
			rows.add(cell);
		}
	}

}
