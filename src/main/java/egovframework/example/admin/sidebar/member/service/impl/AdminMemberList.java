package egovframework.example.admin.sidebar.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridMemberConvertor;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSelectTemplate;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminMemberList extends JobqJqGridSelectTemplate{
	
	@Autowired
	public AdminMemberList(AdminMemberMapper adminMemberMapper) {
		super(adminMemberMapper, new JobqJqGridMemberConvertor());
	}

	@Override
	protected JsonObject makeTotalCount(int allMembers) {
		JsonObject object = new JsonObject();
		
		object.addProperty("allMembers", allMembers);
		
		return object;
	}
}
