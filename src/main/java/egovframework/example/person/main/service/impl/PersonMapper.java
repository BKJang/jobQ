package egovframework.example.person.main.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.person.main.service.PersonVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("personMapper")
public interface PersonMapper {

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonMainInfo(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectOfferCount(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectApplicationCount(String id) throws Exception;

	void imageUpload(String id, String path) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonQnA(String id) throws Exception;

	void deleteMainImage(String id) throws Exception;

}
