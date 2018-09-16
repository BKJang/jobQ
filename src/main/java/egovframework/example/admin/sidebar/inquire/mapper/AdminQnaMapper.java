package egovframework.example.admin.sidebar.inquire.mapper;

import java.util.List;
import java.util.Map;

import egovframework.example.admin.cmmn.board.BoardDelete;
import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.inquire.domain.AdminQnaVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AdminQnaMapper extends BoardSelect, BoardDelete, BoardSearch{

	public AdminQnaVO getDetail(int no);

	public List<AdminQnaVO> getPrevAndNextPage(List<Integer> prevAndNextPage);

	public int insertQnaReply(Map<String, Object> qnaReplyMap);

	public int updateQnaReplyState(int no);

}
