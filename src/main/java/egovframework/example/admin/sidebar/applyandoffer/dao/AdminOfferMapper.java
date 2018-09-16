package egovframework.example.admin.sidebar.applyandoffer.dao;

import java.util.Map;

import egovframework.example.admin.cmmn.board.BoardSearch;
import egovframework.example.admin.cmmn.board.BoardSelect;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AdminOfferMapper extends BoardSelect, BoardSearch{

	public Map<String, String> getDetail(int no);

}
