package egovframework.example.company.main.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.company.main.service.CompanyService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("companyService")
public class CompanyServiceImpl extends EgovAbstractServiceImpl implements CompanyService {
	
	@Resource(name="companyMapper")
	private CompanyMapper companyMapper;

	@Override
	public List<?> selectCompanyMainInfo(String id) throws Exception {

		return companyMapper.selectCompanyMainInfo(id);
	}

	@Override
	public void updateLogoPic(String id, String savePath) throws Exception {
		
		companyMapper.updateLogoPic(id,savePath);
	}

	@Override
	public List<Integer> countAllInfo(String id) throws Exception {
			
			List<Integer> countList = new ArrayList<Integer>();
			countList.add(companyMapper.countGonggoInfo(id));
			countList.add(companyMapper.countApplyInfo(id));
			countList.add(companyMapper.countOfferInfo(id));
			
		return countList;
	}

	@Override
	public List<Integer> selectCompanyQnaList(String id) throws Exception {

		return companyMapper.selectCompanyQnaList(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectCGpic(String id, String guBun) throws Exception {

		return companyMapper.selectCGpic(id, guBun);
	}

//	여러 사진 데이터 넣기
	@SuppressWarnings({ "rawtypes"})
	@Override
	public void insertMultiPic(Map map) throws Exception {
		
		String guBun = (String) map.get("guBun");
		String gonggoNum = (String) map.get("gonggoNum");
		
		try {
			System.out.println(gonggoNum);
			
			
			if (guBun.equals("c")) {
				
				List<Map> picIdList = companyMapper.selectPicIdList(map.get("id"), guBun);
				
				if (picIdList.size() >= 5) {
					for (int j = 1; j <= 5; j++) {
						companyMapper.updateNewPic(picIdList.get(j-1).get("cgpicId"), map.get("pic_" + j), guBun);
					}
				}else{
					for (int i = 1; i <= 5; i++) {
						companyMapper.insertNewPic(map.get("id"), map.get("pic_" + i), map.get("guBun"));
					}
				}
			} else {
				List<Map> gonggoPicIdList = companyMapper.selectGonggoPicIdList(gonggoNum);
				if (gonggoPicIdList.size() >= 5) {
					for (int i = 1; i <= 5; i++) {
						companyMapper.updateNewGongoPic(gonggoNum, map.get("pic_" + i), gonggoPicIdList.get(i-1).get("cgpicId"));
					}
				}else{
					for (int i = 1; i <= 5; i++) {
						System.out.println(map.get("guBun"));
						companyMapper.insertNewGonggoPic(map.get("id"), gonggoNum, map.get("pic_" + i), map.get("guBun"));
					}
				}
				
			}
			
		}catch (Exception e) {

			e.printStackTrace();
		}
		
	}
//	메인에서 회사처 사진들 가져오기
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPicList(String id, String string) throws Exception {

		return companyMapper.selectPicList(id, string);
	}

	@Override
	public void updateMultiPic(String id, String path, String guBun)
			throws Exception {
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectGonggoPic(String gonggoNum) throws Exception {
		
		return companyMapper.selectGonggoPic(gonggoNum);
	}

}
