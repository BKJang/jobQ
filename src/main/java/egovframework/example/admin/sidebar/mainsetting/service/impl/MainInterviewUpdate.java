package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.mainsetting.dao.MainInterviewMapper;

@Service
public class MainInterviewUpdate {
	@Autowired
	private MainInterviewMapper mainInterviewMapper;
	
	public ResponseEntity<String> update(Map<String, String> updateInfo){
		if(mainInterviewMapper.update(updateInfo) > 0)
			return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		
		return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
	}
}
