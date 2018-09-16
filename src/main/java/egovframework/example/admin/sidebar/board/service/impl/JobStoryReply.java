package egovframework.example.admin.sidebar.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.board.domain.JobStoryReplyVO;
import egovframework.example.admin.sidebar.board.mapper.JobStoryMapper;

@Service
public class JobStoryReply {
	@Autowired
	private JobStoryMapper jobStoryMapper;
	
	public boolean insertReply(JobStoryReplyVO replyVO){
		if(jobStoryMapper.insertReply(replyVO) > 0)
			return true;
		
		return false;
	}
	
}
