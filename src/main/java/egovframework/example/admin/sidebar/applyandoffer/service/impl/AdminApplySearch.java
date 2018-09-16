package egovframework.example.admin.sidebar.applyandoffer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.datatable.JobqDataTableApplyConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.sidebar.applyandoffer.dao.AdminApplyMapper;

@Service
public class AdminApplySearch extends JobqDataTableSearchTemplate{

	@Autowired
	public AdminApplySearch(AdminApplyMapper adminApplyMapper) {
		super(adminApplyMapper, adminApplyMapper, new JobqDataTableApplyConvertor());
	}

	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allData,
			int countSearchedData) {
		// TODO Auto-generated method stub
		return null;
	}

}
