package egovframework.example.admin.sidebar.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.datatable.JobqDataTableNoticeConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.sidebar.board.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeSearch extends JobqDataTableSearchTemplate{

	@Autowired
	public AdminNoticeSearch(AdminNoticeMapper adminNoticeMapper) {
		super(adminNoticeMapper, adminNoticeMapper, new JobqDataTableNoticeConvertor());
	}

	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allData,
			int countSearchedData) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
