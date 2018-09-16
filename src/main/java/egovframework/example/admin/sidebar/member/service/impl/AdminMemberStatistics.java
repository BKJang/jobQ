package egovframework.example.admin.sidebar.member.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.member.domain.AdminCompanyMemberVO;
import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberStatisticsMapper;

@Service
public class AdminMemberStatistics {
	@Autowired
	private AdminMemberStatisticsMapper adminMemberStatisticsMapper;
	
	public List<Map<String, Object>> makeMemberChart(){
		List<Map<String, Object>> charts = new ArrayList<Map<String, Object>>();
		List<AdminMemberVO> members = adminMemberStatisticsMapper.getGeneralMembers();
		List<AdminMemberVO> companyMembers = adminMemberStatisticsMapper.getCompanyMebers();
		
		charts.add(getChartByAge(members));
		charts.add(getChartByMemberType(members, companyMembers));
		charts.add(getChartBySex(members));
		charts.add(getChartByEmploy(members));
		
		return charts;
	}
	
	private Map<String, Object> getChartByAge(List<AdminMemberVO> members){
		for (AdminMemberVO member : members) 
			member.getAgeByBirth();
		
		return groupAge(members);
	}
	
	private Map<String, Object> groupAge(List<AdminMemberVO> members){
		double[] ages = new double[]{0, 0, 0, 0, 0};
		
		for (AdminMemberVO member : members) {
			int age = member.getAge();
			if(age >= 20 && age < 30){
				ages[0]++;
			}else if(age >= 30 && age < 39){
				ages[1]++;
			}else if(age >= 40 && age < 49){
				ages[2]++;
			}else if(age >= 50 && age < 59){
				ages[3]++;
			}else if(age >= 60){
				ages[4]++;
			}
		}
		
		return percentAge(ages);
	}
	
	private Map<String, Object> percentAge(double[] ages){
		Map<String, Object> ageGroup = new HashMap<String, Object>();
		int generalMemberCount = adminMemberStatisticsMapper.countGeneralMembers();

		ageGroup.put("twenty", Math.round(( ages[0] / generalMemberCount ) * 100));
		ageGroup.put("thirty", Math.round(( ages[1] / generalMemberCount ) * 100));
		ageGroup.put("forty", Math.round(( ages[2] / generalMemberCount ) * 100));
		ageGroup.put("fifty", Math.round(( ages[3] / generalMemberCount ) * 100));
		ageGroup.put("sixty", Math.round(( ages[4] / generalMemberCount ) * 100));
		
		return ageGroup;
	}
	
	private Map<String, Object> getChartBySex(List<AdminMemberVO> members){
		Map<String, Object> sexChartDatas = new HashMap<String, Object>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM");
		
		for (AdminMemberVO member : members) {
			String date = simpleDateFormat.format(member.getRegDate());
			if(member.getSex().equals("0")){
				if(sexChartDatas.containsKey("m-" + date))
					sexChartDatas.put("m-" + date, (int)sexChartDatas.get("m-" + date) + 1);
				else
					sexChartDatas.put("m-" + date, 0);
			}else{
				if(sexChartDatas.containsKey("w-" + date))
					sexChartDatas.put("w-" + date, (int)sexChartDatas.get("w-" + date) + 1);
				else
					sexChartDatas.put("w-" + date, 0);
			}
		}
		
		return sexChartDatas;
	}
	
	
	private Map<String, Object> getChartByMemberType(List<AdminMemberVO> members, List<AdminMemberVO> companyMembers){
		Map<String, Object> memberChartDatas = new HashMap<String, Object>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM");
		
		for (AdminMemberVO companyMember : companyMembers) {
			String date = simpleDateFormat.format(companyMember.getRegDate());
			if(memberChartDatas.containsKey("c-" + date))
				memberChartDatas.put("c-" + date, (int)memberChartDatas.get("c-" + date) + 1);
			else
				memberChartDatas.put("c-" + date, 0);
		}
		
		for (AdminMemberVO member : members) {
			String date = simpleDateFormat.format(member.getRegDate());
			if(memberChartDatas.containsKey("g-" + date))
				memberChartDatas.put("g-" + date, (int)memberChartDatas.get("g-" + date) + 1);
			else
				memberChartDatas.put("g-" + date, 0);
		}
		
		return memberChartDatas;
	}
	
	private Map<String, Object> getChartByEmploy(List<AdminMemberVO> members){
		Map<String, Object> employChartDatas = new HashMap<String, Object>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM");
		
		for (AdminMemberVO member : members) {
			String date = simpleDateFormat.format(member.getRegDate());
			if(employChartDatas.containsKey(date))
				employChartDatas.put(date, (int)employChartDatas.get(date) + 1);
			else
				employChartDatas.put(date, 0);
		}
		
		return employChartDatas;
	}
	
}
