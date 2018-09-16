package egovframework.example.admin.sidebar.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.datatable.JobqDataTableJobStoryConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.sidebar.board.mapper.JobStoryMapper;

@Service
public class JobStorySelectList extends JobqDataTableSelectTemplate{
	
	@Autowired
	public JobStorySelectList(JobStoryMapper jobStoryMapper){
		super(jobStoryMapper, new JobqDataTableJobStoryConvertor());
	}
}
