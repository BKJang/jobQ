package egovframework.example.login.modify.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModifyController {
	
	@RequestMapping(value = "modifyPerson.jobq")
	public String initModifyPerson() throws Exception {

		return "login/modify/modify_person.tiles2";
	}
	
	@RequestMapping(value = "modifyCompany.jobq")
	public String initModifyCompany() throws Exception {

		return "login/modify/modify_company.tiles2";
	}
}
