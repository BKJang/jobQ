package egovframework.example.company.job.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.company.job.service.CompanyJobService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("companyJobService")
public class CompanyJobServiceImpl extends EgovAbstractServiceImpl implements CompanyJobService {
	
	@Resource(name="companyJobMapper")
	private CompanyJobMapper companyJobMapper;

	@Override
	public List<?> skillList() throws Exception {

		return companyJobMapper.skillList();
	}

	@Override
	public List<?> cmList(String parameter) throws Exception {
		
		return companyJobMapper.cmList(parameter);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectGonggo(Map<String, Object> inputVal) throws Exception {

		return companyJobMapper.selectGonggo(inputVal);
	}

	@Override
	public String selectType(String id) throws Exception {
		
		return companyJobMapper.selectType(id);
	}

	@Override
	public void changeCloseDate(Map<String, Object> map) throws Exception {
		
		companyJobMapper.changeCloseDate(map);
	}

	@Override
	public String selectAppGubnun(String id, String gonggoID) throws Exception {

		return companyJobMapper.selectAppGubnun(id,gonggoID);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectComPicList(String id, String string) throws Exception {

		return companyJobMapper.selectComPicList(id, string);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectMultiPic(String gonggoID) throws Exception {

		return companyJobMapper.selectMultiPic(gonggoID);
	}

	
}
