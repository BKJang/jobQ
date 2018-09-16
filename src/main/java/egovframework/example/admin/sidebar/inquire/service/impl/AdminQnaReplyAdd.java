package egovframework.example.admin.sidebar.inquire.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.inquire.mapper.AdminQnaMapper;

@Service
public class AdminQnaReplyAdd {
	@Autowired
	private AdminQnaMapper adminQnaMapper;
	
	public boolean insertQnaReply(Map<String, Object> qnaReplyMap){
		if(adminQnaMapper.insertQnaReply(qnaReplyMap) > 0){
			if(updateQnaReplyState(Integer.parseInt((String)qnaReplyMap.get("no"))))
				return true;
		}
		
		return false;
	}
	
	private boolean updateQnaReplyState(int no){
		if(adminQnaMapper.updateQnaReplyState(no) > 0)
			return true;
		
		return false;
	}
}
