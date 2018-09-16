package egovframework.example.admin.sidebar.board.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.board.JobqBoardDelete;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.board.mapper.AdminNoticeMapper;
import egovframework.example.admin.sidebar.board.service.impl.AdminNoticeAdd;
import egovframework.example.admin.sidebar.board.service.impl.AdminNoticeDetail;
import egovframework.example.admin.sidebar.board.service.impl.AdminNoticeSelectList;
import egovframework.example.admin.sidebar.board.service.impl.AdminNoticeUpdate;

@Controller
@RequestMapping("/admin/board/notice/*")
public class AdminNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(AdminNoticeController.class);
	
	private JobqDataTableSelectTemplate jobqDataTableSelectTemplate;
	
	@Autowired
	private AdminNoticeMapper adminNoticeMapper;
	
	@Autowired
	private AdminNoticeSelectList adminNoticeSelectList;
	
	@Autowired
	private JobqBoardDelete jobqBoardDelete;
	
	@Autowired
	private AdminNoticeDetail adminNoticeDetail;
	
	@Autowired
	private AdminNoticeUpdate adminNoticeUpdate;
	
	@Autowired
	private AdminNoticeAdd adminNoticeAdd; 
	
	@Resource(name = "adminNoticeSearch")
	private JobqDataTableSearchTemplate jobqDataTableSearchTemplate;
	
	@RequestMapping("/main")
	public String showNoticePage(Model model) throws Exception{
		return "board/notice-js/notice.admin";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> getList(@RequestParam("start") int start, @RequestParam("length") int length){
		JsonObject list = null;
		jobqDataTableSelectTemplate = adminNoticeSelectList;
		
		try {
			list = jobqDataTableSelectTemplate.getList(start, length);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteNotice(@RequestBody String deleteNumbers) throws Exception{
		try {
			boolean isDeleted = jobqBoardDelete.setBoardDelete(adminNoticeMapper).delete(JsonUtils.convertFromJson(deleteNumbers, List.class));
			if(isDeleted)
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK); 
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("true", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("true", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/list", method=RequestMethod.PUT, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> updateNotice(@RequestBody String updateInfo) throws Exception{
		Map<String, Object> updateMap = JsonUtils.convertFromJson(updateInfo, Map.class);
		
		try {
			boolean isUpdated = adminNoticeUpdate.update(updateMap);
			if(isUpdated)
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/detail/{no}", method = RequestMethod.GET)
	public ModelAndView showDetailNoticePage(@PathVariable("no")int no, Model model) throws Exception{
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = adminNoticeDetail.getDetail(no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/addpage", method=RequestMethod.GET)
	public String showAddNoticePage(Model model) throws Exception{
		return "board/noticeAdd-js/noticeAdd.admin";
	}
	
	@RequestMapping(value = "/addpage", method=RequestMethod.POST)
	public ResponseEntity<String> addNotice(@RequestBody String registInfo) throws Exception{
		Map<String, Object> registMap = JsonUtils.convertFromJson(registInfo, Map.class);
		
		try {
			boolean isCreated = adminNoticeAdd.insert(registMap);
			if(isCreated)
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> search(@RequestParam Map<String, Object> searchInfo){
		JsonObject searchedList = null;
		
		try {
			searchedList = jobqDataTableSearchTemplate.search(searchInfo);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(searchedList), HttpStatus.OK);
	}
}
