package egovframework.example.admin.sidebar.inquire.mapper;

import java.util.List;
import java.util.Map;

import egovframework.example.admin.cmmn.board.BoardDelete;
import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.inquire.domain.AdminFaqVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AdminFaqMapper extends BoardSelect, BoardDelete, BoardSearch{

	public AdminFaqVO getDetail(int no);

	public List<AdminFaqVO> getPrevAndNextPage(List<Integer> prevAndNextPage);

	public int update(Map<String, Object> updateMap);

	public int insert(Map<String, Object> registMap);

	public int getMainData();

	public int updateState(Map<String, Object> faqInfo);

}
