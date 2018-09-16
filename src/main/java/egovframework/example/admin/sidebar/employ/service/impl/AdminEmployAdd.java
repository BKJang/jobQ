package egovframework.example.admin.sidebar.employ.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.employ.domain.AdminEmployVO;
import egovframework.example.admin.sidebar.employ.mapper.AdminEmployMapper;

@Service
public class AdminEmployAdd {
	@Autowired
	private AdminEmployMapper adminEmployMapper;
	
	public boolean add(AdminEmployVO employVO){
		System.out.println(employVO);
		/*if(adminEmployMapper.add(employVO) > 0)
			return true;*/
		
		return false;
	}
}
