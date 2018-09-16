package egovframework.example.main.joblist.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.main.joblist.service.MainJoblistService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mainJoblistService")
public class MainJoblistImpl extends EgovAbstractServiceImpl implements MainJoblistService {

	@Resource(name = "mainJoblistMapper")
	private MainJoblistMapper mainJoblistMapper;

	@Override
	public int ListCount() throws Exception {
		
		return mainJoblistMapper.ListCount();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> defaultGonggoList(int pageNo, int pageSize, String area, String skillList) throws Exception {
		
		int row = (((pageNo - 1) * pageSize) + 1);
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map> list = new ArrayList<Map>();
		String[] skills = skillList.split(",");
		
		try {
			
			map.put("row", row);
			map.put("pageSize", pageSize);
			map.put("area", area);
			map.put("skillList",skills);
			
			list = mainJoblistMapper.defaultGonggoList(map);
			System.out.println(list);
			
		} catch (Exception e) {
		
		
		}
		return list;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectSkillList() throws Exception {

		return mainJoblistMapper.selectSkillList();
	}

	@Override
	public int ListCount(String guBun, String skillList) throws Exception {

		String[] skills = skillList.split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		int count = 0;
		
		try {
			
			map.put("guBun", guBun);
			map.put("skillList", skills);
			count = mainJoblistMapper.ListCountDetail2(map);
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		return count;
	}

	@SuppressWarnings({ "rawtypes"})
	@Override
	public List<Map> selectLocationList() throws Exception {

		List<Map> localList = mainJoblistMapper.selectLocationList();
		
		return  localList;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectLocationCount() throws Exception {
		List<Map> localList = mainJoblistMapper.selectLocationList();
		HashMap<String, Object> count = new HashMap<String, Object>(); 
		
		List<Map> countList = new ArrayList<Map>();
		
		for (Map list : localList) {
			
			count.put((String) list.get("area"), mainJoblistMapper.ListCountDetail((String)list.get("area")));
		}
		countList.add(count);
		
		return countList;
	}
}
