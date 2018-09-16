package egovframework.example.aboutjobq.faq.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.aboutjobq.faq.service.FaqService;



@Controller
public class FaqController {
	
	@Resource(name="faqService")
	private FaqService faqService;
	
	@RequestMapping(value = "faq.jobq")
	public String initFaq(HttpServletRequest request, ModelMap model) throws Exception {
		
		List<?> faqListAll = faqService.selectFaqList();	
		
		model.addAttribute("faqListAll", faqListAll);
		
		System.out.println(faqListAll);
		
		
		List<?> faqList1 = faqService.selectFaqList1();	
		
		model.addAttribute("faqList1", faqList1);
		
		
		List<?> faqList2 = faqService.selectFaqList2();	
		
		model.addAttribute("faqList2", faqList2);
		
		
		List<?> faqList3 = faqService.selectFaqList3();	
		
		model.addAttribute("faqList3", faqList3);
		

		return "aboutjobq/faq/faq.tiles";

	
	}
}
