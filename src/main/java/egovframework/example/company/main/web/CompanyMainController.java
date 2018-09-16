package egovframework.example.company.main.web;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.web.firewall.FirewalledRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.company.main.service.CompanyService;

@Controller
public class CompanyMainController {
	
	@Resource(name="companyService")
	private CompanyService companyService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "companyMain.jobq")
	public <map> String initCompanyMain(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
		
		try {
			
			String id = (String)session.getAttribute("member_id");
			
			List<?> comMainList = companyService.selectCompanyMainInfo(id);
//			공고, 지원자, 면접제의 수 통합하기
			List<Integer> allCount = companyService.countAllInfo(id);
			//1대1문의 내역 가져오기
			List<Integer> qnaList = companyService.selectCompanyQnaList(id);
			//사진내역 가져오자
			List<Map> picList = companyService.selectPicList(id, "c");
			
			System.out.println(picList);
			
			model.addAttribute("comMainList", comMainList);
			model.addAttribute("allCount", allCount);
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("picList", picList);
		} catch (Exception e) {
			
			return "redirect:/main.jobq";
		}
		
		return "company/main/main.tiles";
	}

	@RequestMapping(value = "/logo_upload.jobq")
	public void ImagesUpload(HttpServletResponse response, HttpSession session, MultipartHttpServletRequest multi) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root + "images/company/" + id + "/";
        File dir = new File(path);
        PrintWriter result = null;
        String checkFile = "";
        
//      폴더가 없으면 폴더를 생성
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        try {
        	
	        MultipartFile mFile = multi.getFile("fileUp");
	        String fileName = mFile.getOriginalFilename();
	        String newFileName = "Logo_" + System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
	        String savePath = path + newFileName;
	        checkFile = fileName.substring(fileName.lastIndexOf(".")+1);
	        path = "images/company/" + id + "/" + newFileName;
	        
	        System.out.println(checkFile.toLowerCase().equals("jpg"));
	        if (!(checkFile.toLowerCase().equals("jpg")) && !(checkFile.toLowerCase().equals("png"))  && !checkFile.toLowerCase().equals("jpeg") 
	    			&& !checkFile.toLowerCase().equals("gif") && !checkFile.toLowerCase().equals("bmp") 
	    			&& !checkFile.toLowerCase().equals("tiff")) {
				throw new Exception();
			}
//		사진업데이트
	        companyService.updateLogoPic(id , path);
	        
//      업데이트가 되면 바로 적용을 위한 result
	        result = response.getWriter();
			result.write(JsonUtil.ListToJson(path));
       
            mFile.transferTo(new File(savePath));
        } catch (Exception e) {
        	
        	System.out.println("예외던짐?");
            e.printStackTrace();
        }
	}
	
//	사진 바꾸는 창띄우기 
	@SuppressWarnings({"rawtypes"})
	@RequestMapping(value = "changePic.jobq")
	public <map> String changePic(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
		
		List<Map> picList = new ArrayList<Map>();
		
		try {
			
			String id = (String)session.getAttribute("member_id");
			String guBun = request.getParameter("guBun");
			String gonggoNum = request.getParameter("gonggoNum");
			char check =  guBun.charAt(0)=='c' ? 't' : 'f';
			
			if (check == 't') {
				System.out.println("기존사진");
				picList = companyService.selectCGpic(id, guBun);
			}else{
				System.out.println("여기여기");
				picList = companyService.selectGonggoPic(gonggoNum);
			}
			
			model.addAttribute("picList", picList);
			model.addAttribute("guBun", guBun);
		} catch (Exception e) {
			
			System.out.println("예외?");
			return "company/main/changePicPage.tiles3";
		}
		
		return "company/main/changePicPage.tiles3";
	}
	
	@RequestMapping(value = "/multi_pic_upload.jobq")
	public void MultiImagesUpload(HttpServletResponse response, HttpSession session, MultipartHttpServletRequest multi) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root + "images/company/" + id + "/";
        File dir = new File(path);
        PrintWriter result = null;
        String checkFile = "";
        
//      폴더가 없으면 폴더를 생성
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        try {
        	System.out.println("여기 실행?");
        	
	        MultipartFile mFile = multi.getFile("fileUp");
	        String fileName = mFile.getOriginalFilename();
	        String newFileName = "Logo_" + System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
	        String savePath = path + newFileName;
	        checkFile = fileName.substring(fileName.lastIndexOf(".")+1);
	        path = "images/company/" + id + "/" + newFileName;
	        
	      
	        if (!(checkFile.toLowerCase().equals("jpg")) && !(checkFile.toLowerCase().equals("png"))  && !checkFile.toLowerCase().equals("jpeg") 
	    			&& !checkFile.toLowerCase().equals("bmp") 
	    			&& !checkFile.toLowerCase().equals("tiff")) {
				throw new Exception();
			}
	        
//      업데이트가 되면 바로 적용을 위한 result
	        result = response.getWriter();
			result.write(JsonUtil.ListToJson(path));
       
            mFile.transferTo(new File(savePath));
        } catch (Exception e) {
        	
        	System.out.println("예외던짐?");
            e.printStackTrace();
        }
	}
	
	/* 멀티 사진 저장하가 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "insertMultiPic.jobq")
	public <map> String insertMultiPic(ModelMap model, HttpSession session,@RequestParam Map map) throws Exception {
		
		try {
			
			String id = (String)session.getAttribute("member_id");
			map.put("id", id);
			System.out.println(map);
			companyService.insertMultiPic(map);
			
			model.addAttribute("checkSave", "save");
		} catch (Exception e) {
			
			System.out.println("예외?");
			return "redirect:/login.jobq";
		}
		
		return "company/main/changePicPage.tiles3";
	}
	
}

