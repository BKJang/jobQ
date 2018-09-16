package egovframework.example.admin.sidebar.inquire.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.datatable.JobqDataTableFaqConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.sidebar.inquire.mapper.AdminFaqMapper;

@Service
public class AdminFaqSearch extends JobqDataTableSearchTemplate{
	
	@Autowired
	public AdminFaqSearch(AdminFaqMapper adminFaqMapper) {
		super(adminFaqMapper, adminFaqMapper, new JobqDataTableFaqConvertor());
	}
	
	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allData, int countSearchedData) {
		// TODO Auto-generated method stub
		
		return null;
	}

}
