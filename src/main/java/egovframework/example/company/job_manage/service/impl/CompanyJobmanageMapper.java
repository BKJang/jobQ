package egovframework.example.company.job_manage.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("companyJobmanageMapper")
public interface CompanyJobmanageMapper {
//	공고 등록
	void insertGonngoData(Map<String, Object> map) throws Exception;
//	공고 내역 변경 3개로 구분
	void updateGonngoData1(Map<String, Object> map)throws Exception;

	void updateGonngoData2(Map<String, Object> map)throws Exception;

	void updateGonngoData3(Map<String, Object> map)throws Exception;

//	담당자 내역 변경
	void changeMember(Map<String, Object> map)throws Exception;
	
//	공고 삭제
	void deleteList(String gonggoNum) throws Exception;

	int ListCount(Map<String, Object> map) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> changePaging(HashMap<String, Object> map) throws Exception;
	
	void gonggoClosing(Map<String, Object> map) throws Exception;
	
	Date selectClosingDate(int gonggoNum)throws Exception;
	
	void insertComPic(Object object, Object object2, String gonggoNum) throws Exception;
	
	String selectGonggoNum(Object object) throws Exception;
	



}
