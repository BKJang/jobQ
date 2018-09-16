package egovframework.example.admin.sidebar.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.jqgrid.JobqJqGridMemberConvertor;
import egovframework.example.admin.cmmn.jqgrid.JobqJqGridSearchTemplate;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

@Service
public class AdminMemberSearch extends JobqJqGridSearchTemplate{
	
	@Autowired
	public AdminMemberSearch(AdminMemberMapper adminMemberMapper) {
		super(adminMemberMapper, adminMemberMapper, new JobqJqGridMemberConvertor());
	}
	
	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allMembers, int countSearchedMembers){
		JsonObject object = new JsonObject();
		
		object.addProperty("allMembers", allMembers);
		object.addProperty("countSearchedMembers", countSearchedMembers);
		
		return object;
	}
}
