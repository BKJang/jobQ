package egovframework.example.main.joblist.service;

import java.util.List;
import java.util.Map;

public interface MainJoblistService {

	int ListCount() throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> defaultGonggoList(int pageNo, int pageSize, String area, String skillList) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectSkillList() throws Exception;

	int ListCount(String guBun, String skillList) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectLocationList()throws Exception;

	@SuppressWarnings("rawtypes")
	java.util.List<Map> selectLocationCount() throws Exception;
	
}