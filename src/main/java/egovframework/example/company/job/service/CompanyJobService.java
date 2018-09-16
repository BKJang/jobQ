package egovframework.example.company.job.service;

import java.util.List;
import java.util.Map;


public interface CompanyJobService {

	List<?> skillList() throws Exception;

	List<?> cmList(String parameter) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectGonggo(Map<String, Object> inputVal) throws Exception;

	String selectType(String id) throws Exception;
//	마감일 변경 아작스
	void changeCloseDate(Map<String, Object> map) throws Exception;

	String selectAppGubnun(String id, String gonggoID) throws Exception;

	List<Map> selectComPicList(String id, String string) throws Exception;

	List<Map> selectMultiPic(String gonggoID) throws Exception;

}
