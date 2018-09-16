package egovframework.example.admin.etc.address;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AddressSearchController {
	private static final Logger logger = LoggerFactory.getLogger(AddressSearchController.class);
	
	@RequestMapping("/admin/common/address/popup")
	public ModelAndView showAddressPopup(@RequestParam Map<String, String> addressInfo, Model model){
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("addressInfo", addressInfo);
		modelAndView.setViewName("admin/common/address/addressPopup");	// .jsp는 붙히지 않는다.
		
		return modelAndView;
	}
}
