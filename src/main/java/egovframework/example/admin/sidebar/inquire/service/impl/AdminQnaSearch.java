package egovframework.example.admin.sidebar.inquire.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.datatable.JobqDataTableQnaConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.sidebar.inquire.mapper.AdminQnaMapper;

@Service
public class AdminQnaSearch extends JobqDataTableSearchTemplate{
	
	@Autowired
	public AdminQnaSearch(AdminQnaMapper adminQnaMapper) {
		super(adminQnaMapper, adminQnaMapper, new JobqDataTableQnaConvertor());
	}

	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allData,
			int countSearchedData) {
		// TODO Auto-generated method stub
		return null;
	}
}
