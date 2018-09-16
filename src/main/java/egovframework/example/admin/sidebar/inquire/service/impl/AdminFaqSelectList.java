package egovframework.example.admin.sidebar.inquire.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.datatable.JobqDataTableFaqConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.sidebar.inquire.mapper.AdminFaqMapper;

@Service
public class AdminFaqSelectList extends JobqDataTableSelectTemplate{
	
	@Autowired
	public AdminFaqSelectList(AdminFaqMapper adminFaqMapper) {
		super(adminFaqMapper, new JobqDataTableFaqConvertor());
	}
}
