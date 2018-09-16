package egovframework.example.company.offer.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.service.CmmnPagingVO;
import egovframework.example.company.offer.service.CompanyOfferService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("companyOfferService")
public class CompanyOfferServiceImpl extends EgovAbstractServiceImpl implements CompanyOfferService {
	
	@Resource(name="companyOfferMapper")
	private CompanyOfferMapper companyOfferMapper;
	
	@Override
	public void insertOfferList(Map<String, Object> map) throws Exception {
		
		companyOfferMapper.insertOfferList(map);
	}

	@Override
	public int selectOfferListCount(String id) throws Exception {

		return companyOfferMapper.companyOfferMapper(id);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Map> selectOfferList(String id, CmmnPagingVO paging) throws Exception {
		
		Map<String, Object> selectMap = new HashMap<String, Object>();
		List<Map> map = new ArrayList<Map>();
		int row = (paging.getPageNo() - 1) * paging.getPageSize() + 1;
		List<Object> checkList = new ArrayList<Object>();
		List<Object> reNumberList = new ArrayList<Object>();
		List<Map> careerList = new ArrayList<Map>();
		try {
			
			selectMap.put("id", id);
			selectMap.put("row", row);
			selectMap.put("pageSize", paging.getPageSize());
			
			map = companyOfferMapper.selectOfferList(selectMap);
			int i = 0;
			
			for (Map map2 : map) {
				
				map.get(i).replace("skill", map2.get("skill").toString().replace(",", ", "));
				i++;
			}
			
			
			for (Map numberMap : map) {
				reNumberList.add(numberMap.get("reNumber"));
			}
			
			/*System.out.println(id);
			
			careerList = companyOfferMapper.selectCarrerList(id);
			
			System.out.println(careerList);
//			경력 처리하는 알고리즘
			for (Map careerMap : careerList) {
				
				Date start = (Date) careerMap.get("startdate");
				Date finish = (Date) careerMap.get("finishdate");
				int diff = (int) ((finish.getTime()-start.getTime())/(24 * 60 * 60 * 1000));

			    for (int a = 0; a < reNumberList.size(); a++) {
			    	
			    	if (!checkList.contains(reNumberList.get(a))) {
			    		
			    		if (careerMap.get("reNumber").equals(reNumberList.get(a)) && !map.get(a).containsKey("cDays")) {
			    			map.get(a).put("cDays", diff);
							checkList.add(reNumberList.get(a));
							break;
						}else if (careerMap.get("reNumber").equals(reNumberList.get(a)) && map.get(a).containsKey("cDays")) {
							
							map.get(a).put("cDays", diff + (int)map.get(a).get("cDays"));
							checkList.add(reNumberList.get(a));
							break;
						}
					}else{
						for (int j = 0; j < reNumberList.size(); j++){
							
							if (map.get(a).get("reNumber").equals(map.get(j).get("reNumber"))) {
								map.get(a).put("cDays", map.get(j).get("cDays"));
								break;
							}
						}
						
					}
				}
			}
			*/
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println(map);
		return map;
	}

}
