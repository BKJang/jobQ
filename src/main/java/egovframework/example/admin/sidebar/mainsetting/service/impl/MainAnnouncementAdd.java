package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public class MainAnnouncementAdd {
	/*
	 * DAO에 updateHotAnnocement와  updateSpecialAnnocement을 사용해서 추가하자.
	 * */
	
	public void addMainAnnocement(String type, Map<String, Integer> announcementList){
		if(isHotAnnouncement(type))
			updateHotAnnocementState(announcementList);
		
		updateSpecialAnnocementState(announcementList);
	}
	
	private boolean isHotAnnouncement(String type){
		if(type.equals("hot"))
			return true;
		
		return false;
	}
	
	private void updateHotAnnocementState(Map<String, Integer> announcementList){
		
	}
	
	private void updateSpecialAnnocementState(Map<String, Integer> announcementList){

	}
}
