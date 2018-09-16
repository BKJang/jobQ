package egovframework.example.person.resume.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;




import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.person.resume.service.PersonResumeService;

@Controller
public class PersonResumeController {
	
	@Resource(name="personResumeService")
	private PersonResumeService personResumeService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "personResume.jobq")
	public String initPersonResume(HttpSession session, ModelMap model) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		
		try{
			List<Map> personList = personResumeService.selectPersonMainInfo(id);
			List<Map> personResumeList = personResumeService.selectPersonResumeInfo(id);
			List<Map> personCareerList = personResumeService.selectPersonCarrerInfo(id);
			List<Map> personAcademicList = personResumeService.selectPersonAcademicInfo(id);
		
			//System.out.println(personResumeList);
			model.addAttribute("personList", personList);
			model.addAttribute("personResumeList", personResumeList);
			model.addAttribute("personCareerList", personCareerList);
			model.addAttribute("personAcademicList", personAcademicList);
			//System.out.println(model);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}
		return "person/resume/manage.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "personResumeRegister.jobq")
	public String initPersonResumeRegister(HttpSession session, ModelMap model) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		
		try{
			List<Map> personList = personResumeService.selectPersonMainInfo(id);
			List<Map> personResumeAreaList = personResumeService.selectResumeAreaInfo();
			List<Map> personResumeSkillList = personResumeService.selectResumeSkillInfo();
			List<Map> personResumeList = personResumeService.selectPersonResumeInfo(id);
		
			model.addAttribute("personList", personList);
			model.addAttribute("personResumeAreaList", personResumeAreaList);
			model.addAttribute("personResumeSkillList", personResumeSkillList);
			model.addAttribute("personResumeList", personResumeList);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:personResume.jobq";
		}
		
		return "person/resume/register.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "personResumeModify.jobq")
	public String initPersonResumeModify(HttpSession session, ModelMap model) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		
		try{
			List<Map> personList = personResumeService.selectPersonMainInfo(id);
			List<Map> personResumeAreaList = personResumeService.selectResumeAreaInfo();
			List<Map> personResumeSkillList = personResumeService.selectResumeSkillInfo();
			List<Map> personResumeList = personResumeService.selectPersonResumeInfo(id);
			List<Map> personCareerList = personResumeService.selectPersonCarrerInfo(id);
			List<Map> personAcademicList = personResumeService.selectPersonAcademicInfo(id);
		
			model.addAttribute("personList", personList);
			model.addAttribute("personResumeAreaList", personResumeAreaList);
			model.addAttribute("personResumeSkillList", personResumeSkillList);
			model.addAttribute("personResumeList", personResumeList);
			model.addAttribute("personCareerList", personCareerList);
			model.addAttribute("personAcademicList", personAcademicList);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:personResume.jobq";
		}
		return "person/resume/modify.tiles";
	}
	
	@RequestMapping(value = "personResumeDataInsert.jobq" , method=RequestMethod.POST)
	public String initPersonResumeDataRegister(@RequestParam Map<String, String> map, HttpSession session) throws Exception {
		
		
		try{
			String reDelete = "Y";
			
			session.setAttribute("resume_delete", reDelete);
			System.out.println(session.getAttribute("resume_delete"));
			System.out.println("map :" + map);
			
			HashMap<String, Object> resumeMap = new HashMap<String, Object>();
			HashMap<String, Object> academicMap = new HashMap<String, Object>();
			HashMap<String, Object> careerMap = new HashMap<String, Object>();
			String content = map.get("comment").replace("\r\n", "<br>").replaceAll("<s", "& lt")
					.replaceAll("t>", "& gt").replaceAll("</", "& tt")
					.replaceAll("\\(\"", "& ts").replaceAll("\"\\)", "& ta")
					.replaceAll("<S", "& Lt").replaceAll("T>", "& lT");
			
			String resumeNumber = map.get("resumeNumber");
		
		
			resumeMap.put("resumeNumber", resumeNumber);
			resumeMap.put("title", map.get("title"));
			resumeMap.put("lastAcademic", map.get("lastAcademic"));
			resumeMap.put("money", map.get("money"));
			resumeMap.put("jobType", map.get("jobType"));
			resumeMap.put("areaList", map.get("areaList"));
			resumeMap.put("skillList", map.get("skillList"));
			resumeMap.put("comment", content);
		
			for (String key : map.keySet()) {
			
				if(key.substring(0, 1).equals("a")){
				
					academicMap.put(key, map.get(key));
				
				
				}else if(key.substring(0,1).equals("c")){
				
					careerMap.put(key, map.get(key));
				}
			}
		
			academicMap.put("resumeNumber", resumeNumber);
			careerMap.put("resumeNumber", resumeNumber);
			System.out.println(academicMap);
			System.out.println(careerMap);
		
			personResumeService.deleteAcademicInfo(resumeNumber);
			personResumeService.deleteCareerInfo(resumeNumber);
			personResumeService.insertResumeInfo(resumeMap);
			personResumeService.insertAcademicInfo(academicMap);
			personResumeService.insertCareerInfo(careerMap);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/personResume.jobq";
	}
	
	@RequestMapping(value = "personResumeDelete.jobq" , method=RequestMethod.POST)
	public String initPersonResumeDataDelete(@RequestParam String resumeNumber, HttpSession session) throws Exception {
		//System.out.println(resumeNumber);
		
		
		try{
			String reDelete = "N";
			
			session.setAttribute("resume_delete", reDelete);
			System.out.println(session.getAttribute("resume_delete"));
			personResumeService.deleteResumeInfo(resumeNumber);
			personResumeService.deleteAcademicInfo(resumeNumber);
			personResumeService.deleteCareerInfo(resumeNumber);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/personMain.jobq";
	}
	
	@RequestMapping(value = "closeResume.jobq" , method=RequestMethod.POST)
	public String closeResume(@RequestParam String resumeNumber) throws Exception {
		//System.out.println(resumeNumber);
		try{
			personResumeService.closeResumeInfo(resumeNumber);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/personResume.jobq";
	}
	
	@RequestMapping(value = "openResume.jobq" , method=RequestMethod.POST)
	public String openResume(@RequestParam String resumeNumber) throws Exception {
		//System.out.println(resumeNumber);
		try{
			personResumeService.openResumeInfo(resumeNumber);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/personResume.jobq";
	}

}
