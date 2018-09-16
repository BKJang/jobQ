package egovframework.example.admin.main.mapper;

import java.util.List;
import java.util.Map;

public interface AdminMainNotice {
	public List<Map<String, String>> getMembers();
	
	public List<Map<String, String>> getEmploys();
	
	public List<Map<String, String>> getResumes();
	
	public List<Map<String, String>> getQnas();
	
	public List<Map<String, String>> getBoards();
	
	public List<Map<String, String>> getApplyAndOffers();
}	
