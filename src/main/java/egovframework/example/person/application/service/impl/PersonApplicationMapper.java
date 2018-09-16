package egovframework.example.person.application.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.person.application.service.PersonApplicationPagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("personApplicationMapper")
public interface PersonApplicationMapper {

	void insertAppList(Map<String, Object> map) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectAppList(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPagingList(
			PersonApplicationPagingVO personApplicationPagingVO) throws Exception;

	EgovMap selectPagingListCnt(
			PersonApplicationPagingVO personApplicationPagingVO) throws Exception;

	void cancelApplication(String appId) throws Exception;

	void deleteApplication(String appId) throws Exception;



}
