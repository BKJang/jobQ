package egovframework.example.admin.sidebar.employ.mapper;

import java.util.List;

import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.employ.domain.AdminEmployVO;
import egovframework.example.admin.sidebar.resume.domain.AdminResumeMainDatas;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AdminEmployMapper extends BoardSelect, BoardSearch{

	public AdminEmployVO getDetail(int no);

	public int add(AdminEmployVO employVO);

	public List<AdminResumeMainDatas> getEmployMainData();

	public List<String> getSkills();
	
}
