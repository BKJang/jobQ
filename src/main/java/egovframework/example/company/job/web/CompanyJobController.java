package egovframework.example.company.job.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.cmmn.service.FileUploadDto;
import egovframework.example.company.job.service.CompanyJobService;

@Controller
public class CompanyJobController {
	
	@Resource(name="companyJobService")
	private CompanyJobService companyJobService;
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "companyJob.jobq")
	public String initCompanyJob(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		
		try {
			
			String id = (String)session.getAttribute("member_id");
			
			List<?> skillList = companyJobService.skillList();
			List<?> cmList = companyJobService.cmList(id);
			List<Map> comPicList = companyJobService.selectComPicList(id, "c");
			
			System.out.println(comPicList);
			model.addAttribute("skillList", skillList);
			model.addAttribute("cmList", cmList);
			model.addAttribute("comPicList", comPicList);
			System.out.println(cmList);
		} catch (Exception e) {

			return "redirect:/main.jobq";
		}
		return "company/job/register.tiles";
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "gonggoEdit.jobq")
	public String gonggoEdit(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		String gonggoID = request.getParameter("gonggoID"); 
		
		try {
			
			Map<String, Object> inputVal = new HashMap<String, Object>();
			inputVal.put("id", id);
			inputVal.put("gonggo", gonggoID);
			
			System.out.println(inputVal);
			
			List<?> skillList = companyJobService.skillList();
			List<Map> editGonggo = companyJobService.selectGonggo(inputVal);
			List<Map> multiPicList = companyJobService.selectMultiPic(gonggoID);
			
			System.out.println(editGonggo);
			System.out.println(multiPicList);
			
			model.addAttribute("editGonggo", editGonggo);
			model.addAttribute("skillList", skillList);
			model.addAttribute("multiPicList", multiPicList);
			
		} catch (Exception e) {

			return "redirect:/main.jobq";
		}
		return "company/job/register.tiles";
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/jobDetail.jobq")
	public String JobDetail(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		
		String gonggoID = request.getParameter("gonggoID");
		String id = (String)session.getAttribute("member_id");
		
		try {
			
			Map<String, Object> inputVal = new HashMap<String, Object>();
			inputVal.put("gonggo", gonggoID);
			
			String member_type = companyJobService.selectType(gonggoID);
			//이미지원했는지 여부 
			String appGubun = companyJobService.selectAppGubnun(id, gonggoID);
			List<Map> multiPicList = companyJobService.selectMultiPic(gonggoID);
			List<Map> selectGonggo = companyJobService.selectGonggo(inputVal);
			member_type = member_type.equals(id) ? "c" : "f";
			
			System.out.println(multiPicList);
			
			model.addAttribute("selectGonggo", selectGonggo);
			model.addAttribute("appGubun", appGubun);
			model.addAttribute("type", member_type);
			model.addAttribute("multiPicList", multiPicList);
			
		} catch (Exception e) {

			return "redirect:/main.jobq";
		}
		return "company/job/detail.tiles";
	}
	
//	디테일에서 아작스로 마감일 변경하기
	@RequestMapping(value = "changeCloseDate.jobq")
	public void changeCloseDate(HttpSession session, HttpServletResponse response, @RequestParam String closeDate, int gonggoNum) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		
		try {

			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("id", id);
			map.put("gonggoNum", gonggoNum);
			map.put("closeDate", closeDate);
			
			companyJobService.changeCloseDate(map);
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("페이징 에러");
		}
	}
	
	
//	ckeditor image upload
	@SuppressWarnings({ "deprecation"})
	@RequestMapping(value = "/images_upload.jobq")
	public String ImagesUpload(HttpServletResponse response,@RequestParam MultipartFile upload, FileUploadDto dto, ModelMap model,HttpServletRequest request) throws Exception {
		
		Date date = new Date();
		int year = date.getYear()+ 1900;
		int month = date.getMonth();
		int day = date.getDay();
		
		String monthStr = "";
		String dayStr = "";
		PrintWriter printWriter = null;
		if (month < 10) {
			monthStr = "0" + month;
		} else {
			monthStr = "" + month;
		}
		if (day < 10) {
			dayStr = "0" + month;
		} else {
			dayStr = "" + month;
		}
		
		response.setCharacterEncoding("utf-8");
		
		String defaultPath = request.getRealPath("/");
		String contextPath = request.getSession().getServletContext().getContextPath();
		String fileUploadPathTail = "images/gonggo_content/ckeditor/" + year + "_" + monthStr + "_" +dayStr;
		String fileUploadPath = defaultPath + "/" + fileUploadPathTail;
		
		try {
			
			MultipartFile file = dto.getUpload();
			
			if (file != null) {
				String fileName = file.getOriginalFilename(); //파일명
				String fileNameExt = fileName.substring( fileName.indexOf(".") + 1); //확장자 뽑기
				
				if (!"".equals(fileName)) {
					File destD = new File(fileUploadPath); //파일을 만들어서
					
					if (!destD.exists()) { //그파일이 존재하지 않으면
						destD.mkdirs();//경로를 만들어주고
					}
					
					File destination = File.createTempFile("ckeditor_",  "." + fileNameExt, destD);//실제로 파일이 만들어지고
					
					file.transferTo(destination);//업로드 한 파일 데이터를 지정한 파일에 저장한다
					
					dto.setNewFilename(destination.getName());
					dto.setImageUrl(contextPath + "/" + fileUploadPathTail + "/" + destination.getName());
					
					String callback = request.getParameter("CKEditorFuncNum");
					 
		            printWriter = response.getWriter();
		 
		            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
		                    + callback
		                    + ",'"
		                    + dto.getImageUrl()
		                    + "','이미지를 업로드 하였습니다.'"
		                    + ")</script>");
		            printWriter.flush();
				}
			}
		} catch(IOException e){
            e.printStackTrace();
		}
		
		return "";
	}
}