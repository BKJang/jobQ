package egovframework.example.company.applicants.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.company.applicants.service.CompanyApplicantsService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("companyApplicantsService")
public class CompanyApplicantsImpl extends EgovAbstractServiceImpl implements CompanyApplicantsService{
	
	@Resource(name="companyApplicantsMapper")
	private CompanyApplicantsMapper companyApplicantsMapper;

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectGonggoList(Map<String, Object> map) throws Exception{
		
		return companyApplicantsMapper.selectGonggoList(map);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectAllGonggo(Map<String, Object> selectMap)
			throws Exception {

		return companyApplicantsMapper.selectAllGonggo(selectMap);
	}

	@SuppressWarnings({ "rawtypes", "unchecked"})
	@Override
	public List<Map> selectAppList(Map<String, Object> appMap) throws Exception {
		
		int pageNum = (int)appMap.get("pageNum");
		int pageSize = (int)appMap.get("pageSize");
		int row = (pageNum - 1) * pageSize + 1;
		List<Map> list = new ArrayList<Map>();
		List<Object> reNumberList = new ArrayList<Object>();
		List<Object> checkList = new ArrayList<Object>();
		
		
		try {
			appMap.put("row", row);
			
			list = companyApplicantsMapper.selectAppList(appMap);
			
			for (Map numberMap : list) {
				reNumberList.add(numberMap.get("reNumber"));
			}
			
			
			List<Map> careerList = companyApplicantsMapper.selectCarrerList(appMap.get("gonggoNum"));
			
			System.out.println(careerList);
//			경력 처리하는 알고리즘??
			for (Map careerMap : careerList) {
				
				Date start = (Date) careerMap.get("startdate");
				Date finish = (Date) careerMap.get("finishdate");
				int diff = (int) ((finish.getTime()-start.getTime())/(24 * 60 * 60 * 1000));

			    for (int i = 0; i < reNumberList.size(); i++) {
			    	
			    	if (!checkList.contains(reNumberList.get(i))) {
			    		
			    		if (careerMap.get("reNumber").equals(reNumberList.get(i)) && !list.get(i).containsKey("cDays")) {
							list.get(i).put("cDays", diff);
							checkList.add(reNumberList.get(i));
							break;
						}else if (careerMap.get("reNumber").equals(reNumberList.get(i)) && list.get(i).containsKey("cDays")) {
							
							list.get(i).put("cDays", diff + (int)list.get(i).get("cDays"));
							checkList.add(reNumberList.get(i));
							break;
						}
					}else{
						for (int j = 0; j < reNumberList.size(); j++){
							
							if (list.get(i).get("reNumber").equals(list.get(j).get("reNumber"))) {
								list.get(i).put("cDays", list.get(j).get("cDays"));
								break;
							}
						}
						
					}
				}
			}
			
			
			for (int a = 0; a < list.size(); a++) {
				
				Map acaMap = companyApplicantsMapper.selectAcademicList(list.get(a).get("reNumber"));

				list.get(a).put("lastAca", String.valueOf(acaMap.get("name")) + " " +  String.valueOf(acaMap.get("state")));
			}
			
			
		} catch (Exception e) {
			e.getStackTrace();
		}
		System.out.println(list);
		return list;
	}

	@Override
	public void changeState(Map<String, Object> map) throws Exception {
		
		companyApplicantsMapper.changeState(map);
	}
	
//	@Override
//	public int selectGonggoCount(Map<String, Object> appMap)
//			throws Exception {
//
//		return companyApplicantsMapper.selectGonggoCount(appMap);
//	}

	@Override
	public int selectIngGonggoCount(Map<String, Object> appMap) throws Exception {

		return companyApplicantsMapper.selectIngGonggoCount(appMap);
	}

	@Override
	public int selectEndGonggoCount(Map<String, Object> appMap) throws Exception {
		
		return companyApplicantsMapper.selectEndGonggoCount(appMap);
	}

	@Override
	public int selectGonggoCount(int gonggoNum, int i, String id) throws Exception {
		// TODO Auto-generated method stub
		return companyApplicantsMapper.selectGonggoCount(gonggoNum, i, id);
	}

	@Override
	public int selectGonggoCount(Map<String, Object> appMap) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


}
