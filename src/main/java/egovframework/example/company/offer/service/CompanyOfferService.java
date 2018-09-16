package egovframework.example.company.offer.service;

import java.util.List;
import java.util.Map;

import egovframework.example.cmmn.service.CmmnPagingVO;

public interface CompanyOfferService {

	void insertOfferList(Map<String, Object> map) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectOfferList(String id, CmmnPagingVO paging) throws Exception;

	int selectOfferListCount(String id) throws Exception;

}
