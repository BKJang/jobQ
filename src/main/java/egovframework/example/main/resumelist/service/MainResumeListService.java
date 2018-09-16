package egovframework.example.main.resumelist.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MainResumeListService {

	@SuppressWarnings("rawtypes")
	List<Map> selectResumeSkillInfo() throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectMainResumeInfo() throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonMainInfo(String resumeNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonAcademicInfo(String resumeNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonCareerInfo(String resumeNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonResumeInfo(String resumeNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectNumberOfResume() throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPagingList(PagingVO pagingVO) throws Exception;

	EgovMap selectPagingListCnt(PagingVO pagingVO) throws Exception;

	void updateRead(int appId) throws Exception;

	/*@SuppressWarnings("rawtypes")
	List<Map> selectPersonCareerInfo() throws Exception;*/

}
