package egovframework.example.aboutjobq.about.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	
	@RequestMapping(value = "about.jobq")
	public String initAbout() throws Exception {

		return "aboutjobq/about/about.tiles";

}
	
}
