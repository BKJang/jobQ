package egovframework.example.company.job_manage.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.company.job_manage.service.CompanyJobmanageService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("companyJobmanageService")
public class CompanyJobmanageImpl extends EgovAbstractServiceImpl implements CompanyJobmanageService {

	@Resource(name = "companyJobmanageMapper")
	private CompanyJobmanageMapper companyJobmanageMapper;

	@Override
	public int ListCount(String id, String FCGuBun) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("id", id);
		if (FCGuBun.equals("a")) {
			map.put("FCGuBun", "2");
		} else if (FCGuBun.equals("i")) {
			map.put("FCGuBun", "0");
		} else {
			map.put("FCGuBun", "1");
		}
		System.out.println("List 넘버" + map);
		return companyJobmanageMapper.ListCount(map);
	}

	@Override
	public void gonggoClosing(int gonggoNum, String changeNum) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
        String today = format.format(date);

		map.put("gonggoNum", gonggoNum);
		map.put("closing", changeNum);
		try {
			if (changeNum.equals("0")) {
				
				Date  closingdate = companyJobmanageMapper.selectClosingDate(gonggoNum);
				
				String closingDate = format.format(closingdate);
				
				
				if (closingDate.compareTo(today) >= 0) {
					companyJobmanageMapper.gonggoClosing(map);
				}else{
					System.out.println("예외던짐");
					throw new Exception();
				}
			}else{
				companyJobmanageMapper.gonggoClosing(map);
			}
		} catch (Exception e) {

			throw e;
		}
		
	}

	
	@Override
	public void insertGonngoData(HashMap<String, Object> map) throws Exception {

		map.put("closing", "0");
		if (map.get("cmCkeck") != null) {

			companyJobmanageMapper.changeMember(map);
		}
		
		/*String gonggoNum = companyJobmanageMapper.selectGonggoNum(map.get("id"));
		
		System.out.println(gonggoNum);*/
		/*for (int i = 1; i <= 6; i++) {
			System.out.println(map.get("submitPic_" + i));
			System.out.println(map.get("id"));
			companyJobmanageMapper.insertComPic(map.get("submitPic_" + i), map.get("id"));
			
		}*/
		companyJobmanageMapper.insertGonngoData(map);
	}

	@Override
	public void updateGonngoData(Map<String, Object> map) throws Exception {

		System.out.println(map.get("cmCkeck"));
		
//		담당자 내역 변경하기
		if (map.get("cmCkeck") != null) {

			companyJobmanageMapper.changeMember(map);
		};

		companyJobmanageMapper.updateGonngoData1(map);
		companyJobmanageMapper.updateGonngoData2(map);
		companyJobmanageMapper.updateGonngoData3(map);
	}

	@Override
	public void deleteList(String[] checkList) throws Exception {


		for (String gonggoNum : checkList) {

			companyJobmanageMapper.deleteList(gonggoNum);
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> defaultGonggoList(int pageNum, int pageSize, String fCGuBun, String id) throws Exception {
		
		
		int row = (((pageNum - 1) * pageSize) + 1);
		
		try {

			HashMap<String, Object> map2 = new HashMap<String, Object>();

			map2.put("row", row);
			map2.put("pageSize", pageSize);
			map2.put("id", id);

			if (fCGuBun.equals("a")) {
				map2.put("fCGuBun", '2');
			} else if (fCGuBun.equals("i")) {
				map2.put("fCGuBun", '0');
			} else {
				map2.put("fCGuBun", '1');
			}
			
			//실제로 값을 받아오는 부분
			List<Map> list = companyJobmanageMapper.changePaging(map2);

			return list;

		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void insertComMultiPic(HashMap<String, Object> map) throws Exception {
		
		
		String gonggoNum = companyJobmanageMapper.selectGonggoNum(map.get("id"));
		
		System.out.println(gonggoNum);
		for (int i = 1; i <= 5; i++) {
			System.out.println(map.get("submitPic_" + i));
			System.out.println(map.get("id"));
			companyJobmanageMapper.insertComPic(map.get("submitPic_" + i), map.get("id"), gonggoNum);
			
		}
	}
}
