package egovframework.example.admin.sidebar.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.datatable.JobqDataTableNoticeConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.sidebar.board.mapper.AdminNoticeMapper;

@Service
public class AdminNoticeSelectList extends JobqDataTableSelectTemplate{
	
	@Autowired
	public AdminNoticeSelectList(AdminNoticeMapper adminNoticeMapper) {
		super(adminNoticeMapper, new JobqDataTableNoticeConvertor());
	}
}
