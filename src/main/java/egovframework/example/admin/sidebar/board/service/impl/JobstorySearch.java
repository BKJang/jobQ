package egovframework.example.admin.sidebar.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.datatable.JobqDataTableJobStoryConvertor;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.sidebar.board.mapper.JobStoryMapper;

@Service
public class JobstorySearch extends JobqDataTableSearchTemplate{

	@Autowired
	public JobstorySearch(JobStoryMapper jobStoryMapper) {
		super(jobStoryMapper, jobStoryMapper, new JobqDataTableJobStoryConvertor());
	}

	@Override
	protected JsonObject makeTotalCountAndSearchedCount(int allData,
			int countSearchedData) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
