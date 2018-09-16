package egovframework.example.admin.cmmn.utils;

import java.text.SimpleDateFormat;
import java.util.List;

import org.antlr.grammar.v3.ANTLRParser.defaultNodeOption_return;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import egovframework.example.admin.sidebar.mainsetting.domain.AnnouncementVO;
import egovframework.example.admin.sidebar.mainsetting.domain.InterviewVO;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;

public class JobqJsonUtils {
	
	public JsonObject jqGridWithAnnouncementJsonObject(int page, List<AnnouncementVO> list, int row, int allAnnouncements, int allPages){
		JsonObject object = new JsonObject();
		JsonArray rows = new JsonArray();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		object.addProperty("page", page);
		object.addProperty("total", allPages);
		object.addProperty("userData", allAnnouncements);
		
		for (AnnouncementVO announcementVO : list) {
			JsonObject cell = new JsonObject();
			
			cell.addProperty("no", announcementVO.getNo());
			cell.addProperty("id", announcementVO.getId());
			cell.addProperty("title", announcementVO.getTitle());
			cell.addProperty("companyName", announcementVO.getCompanyName());
			cell.addProperty("state", announcementVO.getState());
			cell.addProperty("regDate", simpleDateFormat.format(announcementVO.getRegDate()));
			cell.addProperty("updateDate", simpleDateFormat.format(announcementVO.getRegDate()));
			
			rows.add(cell);
		}
		
		object.add("list", rows);
		
		return object;
	}
	
	public JsonObject jqGridWithInterviewJsonObject(int page, List<InterviewVO> list, int row, int allInterviews, int allPages){
		JsonObject object = new JsonObject();
		JsonArray rows = new JsonArray();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		object.addProperty("page", page);
		object.addProperty("total", allPages);
		object.addProperty("userData", allInterviews);
		
		for (InterviewVO interviewVO : list) {
			JsonObject cell = new JsonObject();
			String content = interviewVO.getContent();
					
			cell.addProperty("no", interviewVO.getNo());
			cell.addProperty("use", interviewVO.getUse());
			cell.addProperty("regDate", simpleDateFormat.format(interviewVO.getRegDate()));
				
			if(content.length() < 17)
				cell.addProperty("content", interviewVO.getContent());
			else
				cell.addProperty("content", interviewVO.getContent().substring(0, 17).concat("..."));
			
			if (interviewVO.getUse() == 'Y') {
				cell.addProperty("use", "사용중");
			}else{
				cell.addProperty("use", "사용 않함");
			}
			
			if(interviewVO.getUpdateDate() == null){
				cell.addProperty("updateDate", "미정");
			}else{
				cell.addProperty("updateDate", simpleDateFormat.format(interviewVO.getUpdateDate()));
			}
			
			rows.add(cell);
		}
		
		object.add("list", rows);
		
		return object;
	}
	
	public JsonObject jqGridWithMemberJsonObject(int page, List<AdminMemberVO> list, int row, int allMembers, int allPages){
		JsonObject object = new JsonObject();
		JsonArray rows = new JsonArray();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		object.addProperty("page", page);
		object.addProperty("total", allPages);
		object.addProperty("userData", allMembers);
		
		for (AdminMemberVO adminMemberVO : list) {
			JsonObject cell = new JsonObject();
			
			/*cell.addProperty("name", adminMemberVO.getName());
			cell.addProperty("id", adminMemberVO.getId());
			cell.addProperty("phone", adminMemberVO.getPhone());
			cell.addProperty("email", adminMemberVO.getEmail());
			cell.addProperty("type", adminMemberVO.getType());
			cell.addProperty("regDate", simpleDateFormat.format(adminMemberVO.getRegDate()));
			cell.addProperty("updateDate", simpleDateFormat.format(adminMemberVO.getRegDate()));*/
			
			rows.add(cell);
		}
		
		object.add("list", rows);
		
		return object;
	}
	
	
}
