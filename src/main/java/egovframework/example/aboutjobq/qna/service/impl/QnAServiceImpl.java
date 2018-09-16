package egovframework.example.aboutjobq.qna.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.aboutjobq.qna.service.QnAPagingVO;
import egovframework.example.aboutjobq.qna.service.QnAService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("qnaService")
public class QnAServiceImpl extends EgovAbstractServiceImpl implements QnAService {
	
	@Resource(name="qnaMapper")
	private QnAMapper qnaMapper;
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectQnADetail(String qnaNumber) throws Exception {
		
		return qnaMapper.selectQnADetail(qnaNumber);
	}

	@Override
	public void deleteQnADetail(String qnaNumber) throws Exception {

		qnaMapper.deleteQnADetail(qnaNumber);
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPagingList(QnAPagingVO qnaPagingVO) throws Exception {

		return qnaMapper.selectPagingList(qnaPagingVO);
	}

	@Override
	public EgovMap selectPagingListCnt(QnAPagingVO qnaPagingVO)
			throws Exception {

		return qnaMapper.selectPagingListCnt(qnaPagingVO);
	}

	@Override
	public void registerQ(Map<String, String> map) throws Exception {

		qnaMapper.registerQ(map);
		
	}

	@Override
	public void modifyQ(Map<String, String> map) throws Exception {

		qnaMapper.modifyQ(map);
		
	}

}
