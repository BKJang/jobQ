package egovframework.example.login.join.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.login.join.service.JoinService;
import egovframework.example.login.join.web.MembersVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("joinService")
public class JoinImpl extends EgovAbstractServiceImpl implements JoinService {
	
	@Resource(name="joinMapper")
	private JoinMapper joinMapper;

	@Override
	public void insertPMember(MembersVO vo) throws Exception {
		
		joinMapper.insertPMember(vo);
		
		System.out.println(vo.getMember_sex());
		
	}


	@Override
	public void insertCMember(MembersVO vo) throws Exception {
		
		System.out.println(vo);

		joinMapper.insertCMember(vo);
		
	}
	
	@Override
	public String overlapTest(String member_id) throws Exception {

		return joinMapper.overlapTest(member_id);
	}


	@Override
	public List<Map> selectEditPerson(Map<String, Object> inputVal)
			throws Exception {
		// TODO Auto-generated method stub
		return joinMapper.selectEditPerson(inputVal);
	}


	@Override
	public void updatePerson(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinMapper.updatePerson(map);
		
	}


	@Override
	public List<Map> selectEditCompany(Map<String, Object> inputVal)
			throws Exception {
		// TODO Auto-generated method stub
		return joinMapper.selectEditCompany(inputVal);
	}


	@Override
	public void updateCompany(Map<String, Object> map) throws Exception {
		joinMapper.updateCompany(map);
		
	}


	@Override
	public void update2Company(Map<String, Object> map) throws Exception {
		joinMapper.update2Company(map);
		
	}

}
