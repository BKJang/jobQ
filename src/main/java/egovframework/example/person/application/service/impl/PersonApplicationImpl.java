package egovframework.example.person.application.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.person.application.service.PersonApplicationPagingVO;
import egovframework.example.person.application.service.PersonApplicationService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("personApplicationService")
public class PersonApplicationImpl extends EgovAbstractServiceImpl implements PersonApplicationService {
	
	@Resource(name="personApplicationMapper")
	private PersonApplicationMapper personApplicationMapper;

	@Override
	public void insertAppList(Map<String, Object> map) throws Exception {

		personApplicationMapper.insertAppList(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectAppList(String id) throws Exception {

		return personApplicationMapper.selectAppList(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPagingList(
			PersonApplicationPagingVO personApplicationPagingVO)
			throws Exception {

		return personApplicationMapper.selectPagingList(personApplicationPagingVO);
	}

	@Override
	public EgovMap selectPagingListCnt(
			PersonApplicationPagingVO personApplicationPagingVO)
			throws Exception {

		return personApplicationMapper.selectPagingListCnt(personApplicationPagingVO);
	}

	@Override
	public void cancelApplication(String appId) throws Exception {

		String[] arr = appId.split(",");
		
		for(int i=0; i<arr.length; i++){
			appId = arr[i];
			personApplicationMapper.cancelApplication(appId);
		}		
	}

	@Override
	public void deleteApplication(String appId) throws Exception {

		String[] arr = appId.split(",");
		
		for(int i=0; i<arr.length; i++){
			appId = arr[i];
			personApplicationMapper.deleteApplication(appId);
		}	
		
	}
}
