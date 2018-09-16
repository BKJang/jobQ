package egovframework.example.admin.cmmn.datatable;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class JobqDataTableOfferConvertor extends JobqDataTableConvertorTemplate {

	@Override
	protected void storeDataToJsonObject(List<Map<String, Object>> list, JsonArray rows, SimpleDateFormat simpleDateFormat) {
		for (Map<String, Object> member : list) {
			JsonObject cell = new JsonObject();
			String offerContent = (String)member.get("CONTENT");
			
			cell.addProperty("no", String.valueOf(member.get("OFFER_NUMBER")));
			cell.addProperty("companyName", String.valueOf(member.get("COMPANY_NAME")));
			cell.addProperty("corpMemberId", (String)member.get("CORP_MEMBER_ID"));
			cell.addProperty("resumeTitle", (String)member.get("RESUME_TITLE"));
			cell.addProperty("offerDate", simpleDateFormat.format((Timestamp)member.get("OFFER_DATE")));
			cell.addProperty("memberId", String.valueOf(member.get("MEMBER_ID")));
			
			if(offerContent.length() < 12)
				cell.addProperty("content", offerContent);
			else
				cell.addProperty("content", offerContent.substring(0, 12).concat("..."));
			
			rows.add(cell);
		}
	}

}
