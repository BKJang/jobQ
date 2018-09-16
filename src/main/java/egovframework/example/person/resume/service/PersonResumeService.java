package egovframework.example.person.resume.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface PersonResumeService {

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonMainInfo(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonResumeInfo(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonCarrerInfo(String id)throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonAcademicInfo(String id)throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectResumeAreaInfo() throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectResumeSkillInfo() throws Exception;

	void insertResumeInfo(Map<String, Object> map) throws Exception;

	void deleteResumeInfo(String resumeNumber) throws Exception;

	void closeResumeInfo(String resumeNumber) throws Exception;

	void openResumeInfo(String resumeNumber) throws Exception;

	void insertAcademicInfo(HashMap<String, Object> academicMap) throws Exception;

	void insertCareerInfo(HashMap<String, Object> careerMap) throws Exception;

	void deleteAcademicInfo(String resumeNumber) throws Exception;

	void deleteCareerInfo(String resumeNumber) throws Exception;


}
