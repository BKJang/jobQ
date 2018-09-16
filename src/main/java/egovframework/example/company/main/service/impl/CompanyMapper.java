package egovframework.example.company.main.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("companyMapper")
public interface CompanyMapper {

//	기업에 대한 전반적인 내용 가져오기
	List<?> selectCompanyMainInfo(String id) throws Exception;
//	각각의 갯수 가져오기
	int countGonggoInfo(String id) throws Exception;

	int countApplyInfo(String id) throws Exception;

	int countOfferInfo(String id) throws Exception;

//	로고 사진 업데이트
	void updateLogoPic(String id,String savePath) throws Exception;
//	1대1문의 내역 가져오기
	List<Integer> selectCompanyQnaList(String id) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectCGpic(String id, String guBun)throws Exception;
	
	//이 아이디의 사진의 갯수
	int selectPicCount(Object object, Object object2) throws Exception;
	
	//공간이 없을 경우
	void insertNewPic(Object object, Object object2, Object object3)throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPicIdList(Object object, Object object2) throws Exception;
	
	//기존공간에 추가
	void updateNewPic(Object object, Object object2, Object object3) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPicList(String id, String string) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectGonggoPic(String gonggoNum)throws Exception;
	
	void updateNewGongoPic(String gonggoNum, Object object, Object object2) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectGonggoPicIdList(String gonggoNum) throws Exception;
	
	void insertNewGonggoPic(Object object, String gonggoNum, Object object2,
			Object object3) throws Exception;
}
