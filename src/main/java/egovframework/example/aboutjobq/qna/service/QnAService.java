package egovframework.example.aboutjobq.qna.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface QnAService {

	@SuppressWarnings("rawtypes")
	List<Map> selectQnADetail(String qnaNumber) throws Exception;

	void deleteQnADetail(String qnaNumber) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPagingList(QnAPagingVO qnaPagingVO) throws Exception;

	EgovMap selectPagingListCnt(QnAPagingVO qnaPagingVO) throws Exception;

	void registerQ(Map<String, String> map) throws Exception;

	void modifyQ(Map<String, String> map) throws Exception;

}
