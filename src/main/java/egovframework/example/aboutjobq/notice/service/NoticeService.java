package egovframework.example.aboutjobq.notice.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface NoticeService {

	@SuppressWarnings("rawtypes")
	List<Map> selectNoticeList(NoticePagingVO noticePagingVO) throws Exception;

	EgovMap selectNoticeListCnt(NoticePagingVO noticePagingVO) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectNoticeDetail(String noticeNumber) throws Exception;

}
