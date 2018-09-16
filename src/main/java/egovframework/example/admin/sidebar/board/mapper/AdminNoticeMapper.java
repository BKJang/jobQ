package egovframework.example.admin.sidebar.board.mapper;

import java.util.List;
import java.util.Map;

import egovframework.example.admin.cmmn.board.BoardDelete;
import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.board.domain.AdminNoticeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AdminNoticeMapper extends BoardSelect, BoardDelete, BoardSearch{

	public AdminNoticeVO getDetail(int no);

	public List<AdminNoticeVO> getPrevAndNextPage(List<Integer> prevAndNextPage);

	public int update(Map<String, Object> updateMap);

	public int insert(Map<String, Object> registMap);
	
}
