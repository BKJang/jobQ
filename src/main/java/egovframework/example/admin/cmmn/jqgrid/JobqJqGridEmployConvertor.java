package egovframework.example.admin.cmmn.jqgrid;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class JobqJqGridEmployConvertor extends JobqJqGridConvertorTemplate {

	@Override
	protected void storeDataToJsonObject(List<Map<String, Object>> list, SimpleDateFormat simpleDateFormat, JsonArray rows) {
		for (Map<String, Object> member : list) {
			JsonObject cell = new JsonObject();
			
			if(((String)member.get("ID")).equals("admin"))
				continue;
			
			cell.addProperty("no", String.valueOf(member.get("JOB_NUMBER")));
			cell.addProperty("id", (String)member.get("ID"));
			cell.addProperty("title", (String)member.get("TITLE"));
			cell.addProperty("companyName", (String)member.get("COMPANY_NAME"));
			cell.addProperty("typeEmploy", (String)member.get("TYPE_EMPLOY"));
			cell.addProperty("academic", (String)member.get("ACADEMIC"));
			cell.addProperty("career", (String)member.get("CAREER"));
			cell.addProperty("regDate", simpleDateFormat.format((Timestamp)member.get("DATE_REGI")));
			cell.addProperty("closing", (String)member.get("CLOSING"));
			
			if(((String)member.get("CLOSING")).equals("0"))
				cell.addProperty("closing", "게재중");
			else
				cell.addProperty("closing", "마감");
			
			rows.add(cell);
		}

	}

}
