package egovframework.example.admin.sidebar.member.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.member.service.impl.AdminMemberStatistics;

@Controller
@RequestMapping("/admin/member/statistics/chart")
public class MemberStatisticsController {
	@Autowired
	private AdminMemberStatistics adminMemberStatistics;  
	
	@RequestMapping("/main")
	public String showmMemberChartPage(){
		return "member/memberStatistics-js/memberStatistics.admin";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> getChartList(){
		List<Map<String, Object>> charts = null;
		try {
			charts = adminMemberStatistics.makeMemberChart();
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(charts), HttpStatus.OK);
	}
	
}
