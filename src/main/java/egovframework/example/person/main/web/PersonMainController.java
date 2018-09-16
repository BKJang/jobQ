package egovframework.example.person.main.web;

import java.io.File;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.person.main.service.PersonService;


@Controller
public class PersonMainController {
	
	@Resource(name="personService")
	private PersonService personService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "personMain.jobq")
	public String initPersonMain(HttpSession session, ModelMap model) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		
		
			List<Map> personMainList = personService.selectPersonMainInfo(id);
			List<Map> countOfOffer = personService.selectOfferCount(id);
			List<Map> countOfApplication = personService.selectApplicationCount(id);
			List<Map> personQnAList = personService.selectPersonQnA(id);
			
			model.addAttribute("countOfOffer", countOfOffer);
			model.addAttribute("personMainList", personMainList);
			model.addAttribute("countOfApplication", countOfApplication);
			model.addAttribute("personQnAList", personQnAList);
			//System.out.println(model);
		
		
		
		return "person/main/main.tiles";
	}

	//이력서 사진 업로드
	@RequestMapping(value = "/mainPicUpload.jobq")
	public void imageUpload(HttpServletResponse response, HttpSession session, MultipartHttpServletRequest multi) throws Exception {
			
		String id = (String)session.getAttribute("member_id");
		try {
			String root = multi.getSession().getServletContext().getRealPath("/");
			String path = root + "images/person/" + id + "/";
			File dir = new File(path);
			PrintWriter result = null;
        
			//폴더가 없으면 폴더를 생성
			if(!dir.isDirectory()){
				dir.mkdir();
			}
        
	        MultipartFile mFile = multi.getFile("fileUp");
	        String fileName = mFile.getOriginalFilename();
	        String newFileName = "Logo_" + System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
	        String savePath = path + newFileName;

	        path = "images/person/" + id + "/" + newFileName;

//		사진업데이트
	        personService.imageUpload(id , path);
	        
//      업데이트가 되면 바로 적용을 위한 result
	        result = response.getWriter();
			result.write(JsonUtil.ListToJson(path));
       
            mFile.transferTo(new File(savePath));
        } catch (Exception e) {
        	
            e.printStackTrace();
        }
	}
	
	@RequestMapping(value = "/mainPicDelete.jobq") 
	public @ResponseBody void FileDelete(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println(request.getParameter("formData"));
		String id = (String)session.getAttribute("member_id");
		String formData = request.getParameter("formData");
		
		personService.deleteMainImage(id);
		
		File file = new File(formData);
        
        if( file.exists() ){
            if(file.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }
       
	} 

}
