package egovframework.example.main.joblist.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainJoblistMapper")
public interface MainJoblistMapper {

	int ListCount() throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> defaultGonggoList(Map<String, Object> map) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectSkillList() throws Exception;

	int ListCountDetail(String guBun)throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectLocationList()throws Exception;

	int ListCountDetail2(Map<String, Object> map) throws Exception;

	
	
}
