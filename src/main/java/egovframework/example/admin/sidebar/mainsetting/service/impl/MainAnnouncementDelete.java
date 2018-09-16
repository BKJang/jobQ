package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.mainsetting.dao.MainAnnouncementMapper;

@Service
public class MainAnnouncementDelete {
	@Autowired
	private MainAnnouncementMapper mainAnnouncementMapper;
	
	public void delete(List<String> list){
		mainAnnouncementMapper.deleteAnnouncements(list);
	}
}
