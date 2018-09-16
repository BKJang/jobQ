package egovframework.example.company.offer.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("companyOfferMapper")
public interface CompanyOfferMapper {

	void insertOfferList(Map<String, Object> map) throws Exception;

	int companyOfferMapper(String id)throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectOfferList(Map<String, Object> selectMap) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectCarrerList(String id) throws Exception;
}
