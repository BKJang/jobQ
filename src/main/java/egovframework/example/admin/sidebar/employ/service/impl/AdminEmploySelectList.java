package egovframework.example.admin.sidebar.employ.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridEmployConvertor;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSelectTemplate;
import egovframework.example.admin.sidebar.employ.mapper.AdminEmployMapper;

@Service
public class AdminEmploySelectList extends JobqJqGridSelectTemplate{
	
	@Autowired
	public AdminEmploySelectList(AdminEmployMapper adminEmployMapper) {
		super(adminEmployMapper, new JobqJqGridEmployConvertor());
	}

	@Override
	protected JsonObject makeTotalCount(int allEmploys) {
		JsonObject object = new JsonObject();
		
		object.addProperty("allEmploys", allEmploys);
		
		return object;
	}
}
