package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.mainsetting.dao.MainLogoMapper;

@Service
public class MainLogoDelete {
	@Autowired
	private MainLogoMapper mainLogoMapper;
	private final String DEFAULT_LOGO_DIR_PATH = "C:\\jobq_logo_file";
	
	public boolean deleteLogo(String logoPath) throws Exception{
		// 원본파일은 썸네일 파일에 "s_"를 제거한 파일명이 된다.
		String originalLogoPath = logoPath.replace("s_", "");
		
		// 일단 new File()을 통해서 스트림을 생성해야 한다.
		// new File()의 역활은 일단 스트림의 생성이다.
		// 여기서 new File()의 인자가 스트림을 생성하는 대상이 된다.
		// 그리고 나서 운영체제마다 파일 구분자가 다르고 웹 브라우저는 '/'로 파일 경로를 인식하기 때문에 자바의 File.separatorChar를 이용해서 파일 구분자를 변경한다.
		// 그리고 연결된 스트림의 파일을 delete()함수를 통해서 삭제한다.
		boolean isOriginalDeleted = new File(DEFAULT_LOGO_DIR_PATH + originalLogoPath.replace('/', File.separatorChar)).delete();
		boolean isThumbDeleted = new File(DEFAULT_LOGO_DIR_PATH + logoPath.replace('/', File.separatorChar)).delete();
		
		if(isThumbDeleted && isOriginalDeleted){
			if(mainLogoMapper.deleteLogo(logoPath) > 0){
				return true;
			}
			
			return false;
		}
		
		return false;
	}
}
