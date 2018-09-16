package egovframework.example.login.join.service;

import java.util.List;
import java.util.Map;

import egovframework.example.login.join.web.MembersVO;

public interface JoinService {



	String overlapTest(String member_id) throws Exception;

	void insertPMember(MembersVO vo) throws Exception;

	void insertCMember(MembersVO vo) throws Exception;

	List<Map> selectEditPerson(Map<String, Object> inputVal) throws Exception;

	void updatePerson(Map<String, Object> map)  throws Exception;

	List<Map> selectEditCompany(Map<String, Object> inputVal) throws Exception;

	void updateCompany(Map<String, Object> map) throws Exception;

	void update2Company(Map<String, Object> map) throws Exception;

}
