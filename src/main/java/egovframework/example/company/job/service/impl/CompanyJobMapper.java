package egovframework.example.company.job.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("companyJobMapper")
public interface CompanyJobMapper {

	List<?> skillList()throws Exception;

	List<?> cmList(String parameter) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectGonggo(Map<String, Object> inputVal) throws Exception;

	String selectType(String id) throws Exception;

	void changeCloseDate(Map<String, Object> map) throws Exception;

	String selectAppGubnun(String id, String gonggoID) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectComPicList(String id, String string) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectMultiPic(String gonggoID) throws Exception;
}
