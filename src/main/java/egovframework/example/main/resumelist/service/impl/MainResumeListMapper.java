package egovframework.example.main.resumelist.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.main.resumelist.service.PagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mainResumeListMapper")
public interface MainResumeListMapper {

	@SuppressWarnings("rawtypes")
	public List<Map> selectResumeSkillInfo() throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectMainResumeInfo() throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectPersonMainInfo(String resumeNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectPersonResumeInfo(String resumeNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectPersonCareerInfo(String resumeNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectPersonAcademicInfo(String resumeNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectNumberOfResume() throws Exception;

	public EgovMap selectPagingListCnt(PagingVO pagingVO) throws Exception;

	@SuppressWarnings("rawtypes")
	public List<Map> selectPagingList(PagingVO pagingVO) throws Exception;

	public void updateRead(int appId) throws Exception;

	/*@SuppressWarnings("rawtypes")
	public List<Map> selectPersonCareerInfo() throws Exception;*/
}
