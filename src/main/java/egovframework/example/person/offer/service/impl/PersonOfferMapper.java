package egovframework.example.person.offer.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.person.offer.service.PersonOfferPagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("personOfferMapper")
public interface PersonOfferMapper {

	@SuppressWarnings("rawtypes")
	List<Map> selectPersonOfferInfo(String id) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectPagingList(PersonOfferPagingVO personOfferPagingVO) throws Exception;

	EgovMap selectPagingListCnt(PersonOfferPagingVO personOfferPagingVO) throws Exception;

	void deletePersonOffer(int offerId) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectCorpInfo(String cId) throws Exception;

	@SuppressWarnings("rawtypes")
	List<Map> selectCorpPic(String cId) throws Exception;
	
}
