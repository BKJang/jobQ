package egovframework.example.company.applicants.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("companyApplicantsMapper")
public interface CompanyApplicantsMapper {

	@SuppressWarnings("rawtypes")
	List<Map> selectAllGonggo(Map<String, Object> selectMap) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectAppList(Map<String, Object> appMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectGonggoList(Map<String, Object> map) throws Exception;

	//int selectGonggoCount(Map<String, Object> appMap) throws Exception;

	void changeState(Map<String, Object> map)throws Exception;

	int selectIngGonggoCount(Map<String, Object> appMap)throws Exception;

	int selectEndGonggoCount(Map<String, Object> appMap)throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectCarrerList(Object object) throws Exception;

	@SuppressWarnings("rawtypes")
	Map selectAcademicList(Object object) throws Exception;

	int selectGonggoCount(int gonggoNum, int i, String id) throws Exception;

}
