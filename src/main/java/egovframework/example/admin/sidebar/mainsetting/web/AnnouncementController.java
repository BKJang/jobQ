package egovframework.example.admin.sidebar.mainsetting.web;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainAnnouncementAdd;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainAnnouncementDelete;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainAnnouncementList;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainAnnouncementSearch;
import egovframework.example.admin.sidebar.mainsetting.service.impl.MainAnnouncementUpdate;

@Controller
@RequestMapping("/admin/mainsetting/announcement")
public class AnnouncementController {
	private static final Logger logger = LoggerFactory.getLogger(AnnouncementController.class);

	@Autowired
	private MainAnnouncementAdd mainAnnouncementAdd;

	@Autowired
	private MainAnnouncementList mainAnnouncementList;
	
	@Autowired
	private MainAnnouncementSearch mainAnnouncementSearch;
	
	@Autowired
	private MainAnnouncementDelete mainAnnouncementDelete;
	
	@Autowired
	private MainAnnouncementUpdate mainAnnouncementUpdate;
	
	@RequestMapping("/main")
	public String showAnnouncementMainPage(Model model){
		return "mainsetting/announcement-js/announcement.admin";
	}

	@RequestMapping(value = "/list", method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	public ResponseEntity<String> showAnnouncementBoardList(@RequestParam("page") int page, @RequestParam("rows") int rows){
		JsonObject list = null;
		
		try {
			list = mainAnnouncementList.getList(page, rows);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.OK);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.DELETE, produces="application/json; charset=UTF-8")
	public ResponseEntity<String> deleteAnnouncements(@RequestBody String deleteNumbers){
		try {
			List<String> deleteList = JsonUtils.convertFromJson(deleteNumbers, List.class);
			
			mainAnnouncementDelete.delete(deleteList);
		} catch (Exception e) {
			e.printStackTrace();
			
			new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method = RequestMethod.PUT, produces="text/plain; charset=UTF-8")
	public ResponseEntity<String> updateAnnouncements(@RequestBody String updateInfo){
		try {
			Map<String, Object> updateList = JsonUtils.convertFromJson(updateInfo, Map.class);
			mainAnnouncementUpdate.update(updateList);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces="application/json; charset=UTF-8")
	public ResponseEntity<String> search(@RequestParam Map<String, Object> searchInfo){
		JsonObject list = null;
		try {
			list = mainAnnouncementSearch.search(searchInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.BAD_REQUEST);
		}

		return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/detail/{no}", method = RequestMethod.GET)
	public String showAnnouncementDetailPage(@PathVariable("no") int no){
		System.out.println(no);
		return "mainsetting/hotAnnouncement-js/hotAnnouncement.admin";
	}
	
}
