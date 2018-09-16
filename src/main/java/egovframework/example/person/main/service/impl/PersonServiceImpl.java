package egovframework.example.person.main.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.person.main.service.PersonService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("personService")
public class PersonServiceImpl extends EgovAbstractServiceImpl implements PersonService {
	
	@Resource(name="personMapper")
	private PersonMapper personMapper;
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonMainInfo(String id) throws Exception {
		
		return personMapper.selectPersonMainInfo(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectOfferCount(String id) throws Exception {
		
		return personMapper.selectOfferCount(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectApplicationCount(String id) throws Exception {
		
		return personMapper.selectApplicationCount(id);
	}

	@Override
	public void imageUpload(String id, String path) throws Exception {

		personMapper.imageUpload(id, path);
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonQnA(String id) throws Exception {
		// TODO Auto-generated method stub
		return personMapper.selectPersonQnA(id);
	}

	@Override
	public void deleteMainImage(String id) throws Exception {

		personMapper.deleteMainImage(id);
		
	}

}
