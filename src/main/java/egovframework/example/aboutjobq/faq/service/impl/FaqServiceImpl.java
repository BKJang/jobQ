package egovframework.example.aboutjobq.faq.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.aboutjobq.faq.service.FaqService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("faqService")
public class FaqServiceImpl extends EgovAbstractServiceImpl implements FaqService {
	
	@Resource(name="faqMapper")
	private FaqMapper faqMapper;

	@Override
	public List<?> selectFaqList() throws Exception {
		// TODO Auto-generated method stub
		return faqMapper.selectFaqList();
	}

	@Override
	public List<?> selectFaqList1() throws Exception {
		// TODO Auto-generated method stub
		return faqMapper.selectFaqList1();
	}

	@Override
	public List<?> selectFaqList2() throws Exception {
		// TODO Auto-generated method stub
		return faqMapper.selectFaqList2();
	}

	@Override
	public List<?> selectFaqList3() throws Exception {
		// TODO Auto-generated method stub
		return faqMapper.selectFaqList3();
	}

	}
