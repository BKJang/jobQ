package egovframework.example.person.resume.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("personResumeMapper")
public interface PersonResumeMapper {

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonMainInfo(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonResumeInfo(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonCareerInfo(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonAcademicInfo(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectResumeAreaInfo() throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectResumeSkillInfo() throws Exception;

	void insertResumeInfo(Map<String, Object> map) throws Exception;

	void deleteResumeInfo(String resumeNumber) throws Exception;

	void closeResumeInfo(String resumeNumber) throws Exception;

	void openResumeInfo(String resumeNumber) throws Exception;

	void insertAcademicInfo(Object object, Object object2, Object object3,
			Object object4, Object object5) throws Exception;

	void insertCareerInfo(Object object, Object object2, Object object3,
			Object object4, Object object5) throws Exception;

	void deleteAcademicInfo(String resumeNumber) throws Exception;

	void deleteCareerInfo(String resumeNumber) throws Exception;

}
