package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.mainsetting.dao.MainAnnouncementMapper;

@Service
public class MainAnnouncementUpdate {
	@Autowired
	private MainAnnouncementMapper mainAnnouncementMapper;
	
	public void update(Map<String, Object> updateList){
		mainAnnouncementMapper.updateAnnouncements(updateList);
	}
}
