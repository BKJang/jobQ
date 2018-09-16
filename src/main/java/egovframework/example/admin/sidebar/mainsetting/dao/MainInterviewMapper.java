package egovframework.example.admin.sidebar.mainsetting.dao;

import java.util.List;
import java.util.Map;

import egovframework.example.admin.sidebar.mainsetting.domain.InterviewVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainInterviewMapper {
	public List<InterviewVO> getList(Map<String, Integer> listInfo);

	public int countAllList();
	
	public int deleteInterviews(List<String> deleteList);
	
	public List<InterviewVO> selectInterviewDetail(int no);
	
	public List<InterviewVO> selectPrePageAndNextPage(Map<String, Integer> preNextPageInfo);

	public int countSearchedInterviews(Map<String, Object> searchInfo);

	public List<InterviewVO> searchInterviews(Map<String, Object> searchInfo);

	public int add(Map<String, Object> interviewMap);

	public Map<String, String> selectUpdatePageInfo(int no);

	public int update(Map<String, String> updateInfo);
}
