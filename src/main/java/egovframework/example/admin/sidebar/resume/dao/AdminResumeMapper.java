package egovframework.example.admin.sidebar.resume.dao;

import java.util.List;

import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.example.admin.sidebar.resume.domain.AdminResumeMainDatas;
import egovframework.example.admin.sidebar.resume.domain.AdminResumeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AdminResumeMapper extends BoardSelect, BoardSearch{

	public AdminResumeVO getDetail(int no);

	public List<AdminResumeMainDatas> getResumeMainData();

	public int delete(List<String> deleteList);
}
