package egovframework.example.company.offer.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cmmn.service.CmmnPagingVO;
import egovframework.example.company.offer.service.CompanyOfferService;


@Controller
public class CompanyOfferController {
	
	@Resource(name="companyOfferService")
	private CompanyOfferService companyOfferService;
	
	
//	여기 커트롤러는 하라로 충분할듯	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "companyOffer.jobq")
	public String initCompanyOffer(HttpSession session, ModelMap model, @RequestParam(defaultValue="1") int pageNum,@RequestParam(defaultValue="10") int pageSize) throws Exception {

		String id = (String)session.getAttribute("member_id");
		int offerListCount = 0;
		CmmnPagingVO paging = new CmmnPagingVO();
		
		try {
			
			offerListCount = companyOfferService.selectOfferListCount(id);
			
			paging.setPageNo(pageNum);
			paging.setPageSize(pageSize);
			paging.setTotalCount(offerListCount);
			
			List<Map> offerList = companyOfferService.selectOfferList(id, paging);
			
			model.addAttribute("offerList", offerList);
			model.addAttribute("offerListCount", offerListCount);
			model.addAttribute("paging", paging);
			model.addAttribute("pageSize", pageSize);

		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
		
		return "company/offer/list.tiles";
	}
	
//	면접제의 넣는 부분인가봄
	@RequestMapping(value = "insertOffer.jobq")
	public String insertOffer(HttpSession session, @RequestParam Map<String, Object> map) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		map.put("id", id);
		
		companyOfferService.insertOfferList(map);
		
		return "redirect:/paging.jobq";
	}
}
