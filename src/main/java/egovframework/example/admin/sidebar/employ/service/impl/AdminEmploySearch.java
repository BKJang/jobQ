package egovframework.example.admin.sidebar.employ.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridEmployConvertor;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSearchTemplate;
import egovframework.example.admin.sidebar.employ.mapper.AdminEmployMapper;

@Service
public class AdminEmploySearch extends JobqJqGridSearchTemplate{
	
	@Autowired
	public AdminEmploySearch(AdminEmployMapper adminEmployMapper) {
		super(adminEmployMapper, adminEmployMapper, new JobqJqGridEmployConvertor());
	}

	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allData, int countSearchedData) {
		JsonObject object = new JsonObject();
		
		object.addProperty("allEmploys", allData);
		object.addProperty("countSearchedEmploys", countSearchedData);
		
		return object;
	}

}
