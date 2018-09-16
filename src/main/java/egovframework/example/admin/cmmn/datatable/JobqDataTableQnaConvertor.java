package egovframework.example.admin.cmmn.datatable;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class JobqDataTableQnaConvertor extends JobqDataTableConvertorTemplate {

	@Override
	protected void storeDataToJsonObject(List<Map<String, Object>> list, JsonArray rows, SimpleDateFormat simpleDateFormat) {
		for (Map<String, Object> member : list) {
			JsonObject cell = new JsonObject();
			
			cell.addProperty("no", String.valueOf(member.get("Q_NUMBER")));
			cell.addProperty("id", (String)member.get("ID"));
			cell.addProperty("content", (String)member.get("CONTENT"));
			cell.addProperty("title", (String)member.get("TITLE"));
			cell.addProperty("replyState", (String)member.get("RE_STATE"));
			cell.addProperty("regDate", simpleDateFormat.format((Timestamp)member.get("DATE_REGI")));
			
			if(((Timestamp)member.get("DATE_MODI")).equals((Timestamp)member.get("DATE_REGI")))
				cell.addProperty("updateDate", "미정");
			else
				cell.addProperty("updateDate", simpleDateFormat.format((Timestamp)member.get("DATE_MODI")));
				
			rows.add(cell);
		}
		
	}

}
