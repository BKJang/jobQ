package egovframework.example.person.offer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.person.offer.service.PersonOfferPagingVO;
import egovframework.example.person.offer.service.PersonOfferService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("personOfferService")
public class PersonOfferServiceImpl extends EgovAbstractServiceImpl implements PersonOfferService {
	
	@Resource(name="personOfferMapper")
	private PersonOfferMapper personOfferMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonOfferInfo(String id) throws Exception {

		return personOfferMapper.selectPersonOfferInfo(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPagingList(PersonOfferPagingVO personOfferPagingVO)
			throws Exception {

		return personOfferMapper.selectPagingList(personOfferPagingVO);
	}

	@Override
	public EgovMap selectPagingListCnt(PersonOfferPagingVO personOfferPagingVO)
			throws Exception {
		
		return personOfferMapper.selectPagingListCnt(personOfferPagingVO);

	}

	@Override
	public void deletePersonOffer(int offerId) throws Exception {

		personOfferMapper.deletePersonOffer(offerId);
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectCorpInfo(String cId) throws Exception {
		
		return personOfferMapper.selectCorpInfo(cId);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectCorpPic(String cId) throws Exception {
		
		return personOfferMapper.selectCorpPic(cId);
	}

}
