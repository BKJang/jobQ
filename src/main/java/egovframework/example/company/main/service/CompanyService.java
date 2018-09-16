package egovframework.example.company.main.service;

import java.util.List;
import java.util.Map;

public interface CompanyService {

//	메인페인지 컨트롤러
	List<?> selectCompanyMainInfo(String id)throws Exception;
//	로고 업데이트
	void updateLogoPic(String id, String savePath2) throws Exception;
	
	List<Integer> countAllInfo(String id) throws Exception;
//	나의 문의 내역
	List<Integer> selectCompanyQnaList(String id)throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectCGpic(String id, String guBun) throws Exception;
	
	void updateMultiPic(String id, String path, String guBun) throws Exception;
	
	@SuppressWarnings("rawtypes")
	void insertMultiPic(Map map)throws Exception;
	
	List<Map> selectPicList(String id, String string)throws Exception;
	
	List<Map> selectGonggoPic(String gonggoNum) throws Exception;
}
