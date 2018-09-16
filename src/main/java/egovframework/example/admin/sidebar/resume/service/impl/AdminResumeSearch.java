package egovframework.example.admin.sidebar.resume.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridResumeConvertor;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSearchTemplate;
import egovframework.example.admin.sidebar.resume.dao.AdminResumeMapper;

@Service
public class AdminResumeSearch extends JobqJqGridSearchTemplate{

	@Autowired
	public AdminResumeSearch(AdminResumeMapper adminResumeMapper) {
		super(adminResumeMapper, adminResumeMapper, new JobqJqGridResumeConvertor());
	}
	
	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allData, int countSearchedData) {
		JsonObject object = new JsonObject();
		
		object.addProperty("allResumes", allData);
		object.addProperty("countSearchedResumes", countSearchedData);
		
		return object;
	}

}
