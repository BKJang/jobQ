package egovframework.example.company.job_manage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface CompanyJobmanageService {

	int ListCount(String id, String string) throws Exception;

	void insertGonngoData(HashMap<String, Object> map) throws Exception;


	void updateGonngoData(Map<String, Object> map) throws Exception;

	void gonggoClosing(int gonggoNum, String changeNum) throws Exception;

	void deleteList(String[] checkList) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> defaultGonggoList(int pageNo, int pageSize, String fCGuBun, String id) throws Exception;

	void insertComMultiPic(HashMap<String, Object> map)throws Exception;
}
