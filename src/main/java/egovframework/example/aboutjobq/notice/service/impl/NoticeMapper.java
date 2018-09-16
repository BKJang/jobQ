package egovframework.example.aboutjobq.notice.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.aboutjobq.notice.service.NoticePagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("noticeMapper")
public interface NoticeMapper {

	@SuppressWarnings("rawtypes")
	List<Map> selectNoticeList(NoticePagingVO noticePagingVO) throws Exception;

	EgovMap selectNoticeListCnt(NoticePagingVO noticePagingVO) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectNoticeDetail(String noticeNumber) throws Exception;

}
