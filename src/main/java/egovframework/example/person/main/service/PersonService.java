package egovframework.example.person.main.service;

import java.util.List;
import java.util.Map;

public interface PersonService {

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
