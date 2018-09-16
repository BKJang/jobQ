package egovframework.example.admin.sidebar.inquire.web;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import egovframework.example.admin.cmmn.board.JobqBoardDelete;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSearchTemplate;
import egovframework.example.admin.cmmn.datatable.JobqDataTableSelectTemplate;
import egovframework.example.admin.cmmn.utils.JsonUtils;
import egovframework.example.admin.sidebar.inquire.mapper.AdminQnaMapper;
import egovframework.example.admin.sidebar.inquire.service.impl.AdminQnaDetail;
import egovframework.example.admin.sidebar.inquire.service.impl.AdminQnaReplyAdd;
import egovframework.example.admin.sidebar.inquire.service.impl.AdminQnaSelectList;

@Controller
@RequestMapping("/admin/inquire/qna/*")
public class QNAController {
	private static final Logger logger = LoggerFactory.getLogger(QNAController.class);
	
	@Resource(name = "adminQnaSelectList")
	private JobqDataTableSelectTemplate jobqDataTableSelectTemplate;
	
	@Autowired
	private AdminQnaSelectList adminQnaSelectList;
	
	@Autowired
	private AdminQnaDetail adminQnaDetail;
	
	@Autowired
	private AdminQnaReplyAdd adminQnaReplyAdd; 
	
	@Autowired
	private AdminQnaMapper adminQnaMapper;
	
	@Autowired
	private JobqBoardDelete jobqBoardDelete;
	
	@Resource(name = "adminQnaSearch")
	private JobqDataTableSearchTemplate jobqDataTableSearchTemplate;
	
	@RequestMapping("/main")
	public String showQNAMainPage(Model model){
		return "inquire/qnaMain-js/qnaMain.admin";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public ResponseEntity<String> getList(@RequestParam("start") int start, @RequestParam("length") int length){
		JsonObject list = null;
		
		try {
			list = jobqDataTableSelectTemplate.getList(start, length);
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>(JsonUtils.convertToJsonString(list), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteQna(@RequestBody String deleteNumbers) throws Exception{
		try {
			boolean isDeleted = jobqBoardDelete.setBoardDelete(adminQnaMapper).delete(JsonUtils.convertFromJson(deleteNumbers, List.class));
			if(isDeleted)
				return new ResponseEntity<String>("SUCCESS", HttpStatus.OK); 
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("true", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("true", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/detail/{no}", method=RequestMethod.GET)
	public ModelAndView updateFAQ(@PathVariable("no")int no){
		ModelAndView modelAndView = null;
		
		try {
			modelAndView = adminQnaDetail.getDetail(no);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/reply", method=RequestMethod.POST, produces = "text/plain; charset=utf-8")
	public ResponseEntity<String> insertQnaReply(@RequestBody String qnaReplyInfo) throws Exception{
		Map<String, Object> qnaReplyMap = JsonUtils.convertFromJson(qnaReplyInfo, Map.class);
		
		try {
			boolean isCreated = adminQnaReplyAdd.insertQnaReply(qnaReplyMap);
			if(isCreated)
				return new ResponseEntity<String>("SUCCESS:" + qnaReplyMap.get("no"), HttpStatus.OK);
		
		} catch (Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<String>("SERVER_ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public String showQNAUpdatePage(@RequestParam Map<String, Integer> mapList){
		
		return "inquire/qnaUpdate-js/qnaUpdate.admin";
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String updateQNA(@RequestParam Map<String, Integer> mapList){
		
		return "inquire/faq-js/faq.admin";
	}
	
	@RequestMapping("/delete")
	public ResponseEntity<String> deleteQNA(@RequestBody String deleteList) throws Exception{
		
		return new ResponseEntity<String>("true", HttpStatus.OK);
	}
	
	@RequestMapping("/reply")
	public String showQNAReplyPage() throws Exception{
		return "inquire/qnaReply-js/qnaReply.admin";
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
