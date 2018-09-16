package egovframework.example.company.applicants.service;

import java.util.List;
import java.util.Map;


public interface CompanyApplicantsService {

	@SuppressWarnings("rawtypes")
	List<Map> selectAllGonggo(Map<String, Object> selectMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectAppList(Map<String, Object> appMap) throws Exception;
	
	
	//--------------------------
	@SuppressWarnings("rawtypes")
	List<Map> selectGonggoList(Map<String, Object> map) throws Exception;

	
	
//	합격여부 처리
	void changeState(Map<String, Object> map) throws Exception;

	int selectIngGonggoCount(Map<String, Object> appMap) throws Exception;

	int selectEndGonggoCount(Map<String, Object> appMap) throws Exception;

//	공고에 지원자수를 세는
	int selectGonggoCount(int gonggoNum, int i, String id)throws Exception;
	
	int selectGonggoCount(Map<String, Object> appMap) throws Exception;



}
