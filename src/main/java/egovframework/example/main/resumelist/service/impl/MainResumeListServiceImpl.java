package egovframework.example.main.resumelist.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.main.resumelist.service.MainResumeListService;
import egovframework.example.main.resumelist.service.PagingVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("mainResumeListService")
public class MainResumeListServiceImpl extends EgovAbstractServiceImpl implements MainResumeListService {
	
	@Resource(name="mainResumeListMapper")
	private MainResumeListMapper mainResumeListMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectResumeSkillInfo() throws Exception {
		
		return mainResumeListMapper.selectResumeSkillInfo();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectMainResumeInfo() throws Exception {

		return mainResumeListMapper.selectMainResumeInfo();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonMainInfo(String resumeNumber) throws Exception {
		
		return mainResumeListMapper.selectPersonMainInfo(resumeNumber);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonAcademicInfo(String resumeNumber)
			throws Exception {

		return mainResumeListMapper.selectPersonAcademicInfo(resumeNumber);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonCareerInfo(String resumeNumber)
			throws Exception {

		return mainResumeListMapper.selectPersonCareerInfo(resumeNumber);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonResumeInfo(String resumeNumber)
			throws Exception {

		return mainResumeListMapper.selectPersonResumeInfo(resumeNumber);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectNumberOfResume() throws Exception {
		
		return mainResumeListMapper.selectNumberOfResume();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPagingList(PagingVO pagingVO) throws Exception {

		return mainResumeListMapper.selectPagingList(pagingVO);
	}

	@Override
	public EgovMap selectPagingListCnt(PagingVO pagingVO) throws Exception {

		return mainResumeListMapper.selectPagingListCnt(pagingVO);
	}

	@Override
	public void updateRead(int appId) throws Exception {
		
		mainResumeListMapper.updateRead(appId);
	}

	/*@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonCareerInfo() throws Exception {

		return mainResumeListMapper.selectPersonCareerInfo();
	}*/
}
