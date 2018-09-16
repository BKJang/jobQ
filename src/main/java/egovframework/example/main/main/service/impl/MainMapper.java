package egovframework.example.main.main.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {

	List<?> selectMainContents()throws Exception;

	List<?> selectMainTip() throws Exception;

	List<?> selectMainContents2() throws Exception;

	List<?> selectNotice() throws Exception;

	List<?> selectFaq()  throws Exception;

	List<?> selectStory()  throws Exception;

}
