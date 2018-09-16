package egovframework.example.login.join.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.login.join.web.MembersVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;



@Mapper
public interface JoinMapper {

	String overlapTest(String member_id) throws Exception;



	void insertPMember(MembersVO vo) throws Exception;



	void insertCMember(MembersVO vo) throws Exception;



	List<Map> selectEditPerson(Map<String, Object> inputVal) throws Exception;



	

	void updatePerson(Map<String, Object> map) throws Exception;



	List<Map> selectEditCompany(Map<String, Object> inputVal) throws Exception;



	void updateCompany(Map<String, Object> map) throws Exception;



	void update2Company(Map<String, Object> map) throws Exception;



}
