package egovframework.example.aboutjobq.faq.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;



@Mapper("faqMapper")
public interface FaqMapper {

	List<?> selectFaqList()  throws Exception;

	List<?> selectFaqList1()  throws Exception;

	List<?> selectFaqList2()  throws Exception;

	List<?> selectFaqList3()  throws Exception;

}
