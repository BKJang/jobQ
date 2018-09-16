package egovframework.example.admin.sidebar.board.mapper;

import java.util.List;

import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.board.domain.JobStoryReplyVO;
import egovframework.example.admin.sidebar.board.domain.JobStoryVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("jobStoryMapper")
public interface JobStoryMapper extends BoardSelect, BoardSearch{
	public JobStoryVO getDetail(int no);

	public List<JobStoryVO> getPrevAndNextPage(List<Integer> prevAndNextPage);

	public void updateHits(int no);

	public int insertReply(JobStoryReplyVO replyVO);

	public int delete(List<String> deleteList);

	public int deleteReply(List<String> deleteList);
}
