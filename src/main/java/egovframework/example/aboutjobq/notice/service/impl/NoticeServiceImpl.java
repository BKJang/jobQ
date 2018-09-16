package egovframework.example.aboutjobq.notice.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.aboutjobq.notice.service.NoticePagingVO;
import egovframework.example.aboutjobq.notice.service.NoticeService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("noticeService")
public class NoticeServiceImpl extends EgovAbstractServiceImpl implements NoticeService {
	
	@Resource(name = "noticeMapper")
	private NoticeMapper noticeMapper;
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectNoticeList(NoticePagingVO noticePagingVO)
			throws Exception {

		return noticeMapper.selectNoticeList(noticePagingVO);
	}

	@Override
	public EgovMap selectNoticeListCnt(NoticePagingVO noticePagingVO)
			throws Exception {

		return noticeMapper.selectNoticeListCnt(noticePagingVO);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectNoticeDetail(String noticeNumber) throws Exception {
		
		return noticeMapper.selectNoticeDetail(noticeNumber);
	}

}
