package egovframework.example.login.join.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.login.join.service.JoinService;



@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping(value = "join.jobq")
	public String initJoinPage() throws Exception {

		return "login/join/join.tiles2";
	}
	
	
	@RequestMapping(value = "overlaptest.jobq")

	public ResponseEntity<String> overlapTest(String member_id) throws Exception{

		String count_Id = joinService.overlapTest(member_id);
		
		System.out.println("member_id는 : " + member_id);	//적은 아이디
		
		System.out.println("count_Id는 : " + count_Id);		//중복 갯수

		return new ResponseEntity<String>(count_Id, HttpStatus.OK);

	}
	
	@RequestMapping(value = "join_person.jobq")
	public String initJoinPersonPage() throws Exception {
		return "login/join/join_person.tiles2";
	}
	
	
	@RequestMapping(value = "join_person_complete.jobq")
	public ModelAndView members(MembersVO vo, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		//String USER_PWD = EncryptUtil.encrypt(vo.getMember_password());
		
		String USER_PWD = vo.getMember_password();

		vo.setMember_password(USER_PWD);
	
		joinService.insertPMember(vo);

		mav.setViewName("redirect:/login.jobq");
		
		

		return mav;

		//return "login/join/join_person.tiles2";
	}
	
	
	@RequestMapping(value = "join_company.jobq")
	public String initJoinCompanypage() throws Exception {

		return "login/join/join_company.tiles2";
	}
	
	
	@RequestMapping(value = "join_company_complete.jobq")
	public ModelAndView membersCompany(MembersVO vo, HttpSession session) throws Exception {
		System.out.println(vo);
		ModelAndView mav = new ModelAndView();
		
		//String USER_PWD = EncryptUtil.encrypt(vo.getMember_password());
		
		System.out.println(vo.getFull_address());
		
		String USER_PWD = (String) vo.getMember_password();

		vo.setMember_password(USER_PWD);
	
		joinService.insertCMember(vo);

		mav.setViewName("redirect:/login.jobq");

		return mav;

		//return "login/join/join_person.tiles2";
	}
	
	
	@RequestMapping(value = "edit_person.jobq")
	public String initEditPersonPage(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		
		String member_id = (String)session.getAttribute("member_id");
		
		try {
			Map<String, Object> inputVal = new HashMap<String, Object>();
			inputVal.put("member_id", member_id);
			
			List<Map> editPerson = joinService.selectEditPerson(inputVal);
			
			model.addAttribute("editPerson", editPerson);
			
		} catch (Exception e) {

			return "redirect:/main.jobq";
		}
		
		return "login/join/edit_person.tiles2";
			
	}
	
	
	@RequestMapping(value = "update_person.jobq")
	public String updatePerson(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,  ModelMap model) throws Exception {
		
		String member_id = request.getParameter("member_id");
		System.out.println(member_id);
				
		try {
			
			joinService.updatePerson(map);
			
			model.addAttribute("member_id", member_id);
			
			
			
						
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:/personMain.jobq";
		}
	
	
	@RequestMapping(value = "edit_company.jobq")
	public String initEditCompanyPage(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {

		String member_id = (String)session.getAttribute("member_id");
		
		try {
			Map<String, Object> inputVal = new HashMap<String, Object>();
			inputVal.put("member_id", member_id);
			
			List<Map> editCompany = joinService.selectEditCompany(inputVal);
			
			model.addAttribute("editCompany", editCompany);
			
		} catch (Exception e) {

			return "redirect:/main.jobq";
		}
		
		return "login/join/edit_company.tiles2";
			
	}
	
	
	@RequestMapping(value = "update_company.jobq")
	public String updateCompany(@RequestParam Map<String,Object> map, HttpSession session, HttpServletRequest request,  ModelMap model) throws Exception {
		
		String member_id = request.getParameter("member_id");
		// System.out.println(member_id);
				
		try {
			
			joinService.updateCompany(map);
			joinService.update2Company(map);
			
			model.addAttribute("member_id", member_id);
			
			
			
						
		}catch(Exception e){
			e.printStackTrace();
		}
			
			return "redirect:/companyMain.jobq";
		}
	
/*	@RequestMapping(value = "join_complete.jobq")
	public String initJoinComplete() throws Exception {

		return "login/join/join_complete.tiles2";
	}
	*/
}
