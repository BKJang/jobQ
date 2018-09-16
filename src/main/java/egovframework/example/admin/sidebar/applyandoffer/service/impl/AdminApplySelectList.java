package egovframework.example.admin.sidebar.applyandoffer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.datatable.JobqDataTableApplyConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.sidebar.applyandoffer.dao.AdminApplyMapper;

@Service
public class AdminApplySelectList extends JobqDataTableSelectTemplate{
	
	@Autowired
	public AdminApplySelectList(AdminApplyMapper adminApplyMapper) {
		super(adminApplyMapper, new JobqDataTableApplyConvertor());
	}
}
