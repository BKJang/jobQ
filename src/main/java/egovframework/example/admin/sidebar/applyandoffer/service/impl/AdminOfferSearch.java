package egovframework.example.admin.sidebar.applyandoffer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.datatable.JobqDataTableOfferConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.sidebar.applyandoffer.dao.AdminOfferMapper;

@Service
public class AdminOfferSearch extends JobqDataTableSearchTemplate{

	@Autowired
	public AdminOfferSearch(AdminOfferMapper adminOfferMapper) {
		super(adminOfferMapper, adminOfferMapper, new JobqDataTableOfferConvertor());
	}

	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allData,
			int countSearchedData) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
