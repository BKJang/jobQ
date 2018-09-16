package egovframework.example.admin.sidebar.mainsetting.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.cmmn.utils.JobqImageFileUplaodUtils;
import egovframework.example.admin.sidebar.mainsetting.dao.MainLogoMapper;

@Service
public class MainLogoInsert {
	@Autowired
	private MainLogoMapper mainLogoMapper;
	
	public String insertLogo(String imgFileName, byte[] imgFileData) throws Exception{
		JobqImageFileUplaodUtils jobqImageFileUplaodUtils = new JobqImageFileUplaodUtils();
		String uploadedLogoFullPath = jobqImageFileUplaodUtils.uploadImageFile(imgFileName, imgFileData);
		
		mainLogoMapper.updateMainLogo();	// 메인 로고 전체 N로 바꾸기
		mainLogoMapper.insertLogo(uploadedLogoFullPath);	// 새 메인 로고 등록시 Y로 등록
		
		return uploadedLogoFullPath;
	}
}
