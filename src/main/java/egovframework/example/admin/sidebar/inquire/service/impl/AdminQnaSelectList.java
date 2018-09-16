package egovframework.example.admin.sidebar.inquire.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.datatable.JobqDataTableQnaConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.sidebar.inquire.mapper.AdminQnaMapper;

@Service
public class AdminQnaSelectList extends JobqDataTableSelectTemplate{
	
	@Autowired
	public AdminQnaSelectList(AdminQnaMapper adminQnaMapper){
		super(adminQnaMapper, new JobqDataTableQnaConvertor());
	}
	
}
