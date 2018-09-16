package egovframework.example.admin.sidebar.resume.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridResumeConvertor;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSelectTemplate;
import egovframework.example.admin.sidebar.resume.dao.AdminResumeMapper;

@Service
public class AdminResumeSelectList extends JobqJqGridSelectTemplate{

	@Autowired
	public AdminResumeSelectList(AdminResumeMapper adminResumeMapper){
		super(adminResumeMapper, new JobqJqGridResumeConvertor());
	}
	
	@Override
	protected JsonObject makeTotalCount(int allDataCnt) {
		JsonObject object = new JsonObject();
		
		object.addProperty("allResumes", allDataCnt);
		
		return object;
	}

}
