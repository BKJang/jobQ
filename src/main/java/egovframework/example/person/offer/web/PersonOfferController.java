package egovframework.example.person.offer.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.main.resumelist.service.PagingVO;
import egovframework.example.person.offer.service.PersonOfferPagingVO;
import egovframework.example.person.offer.service.PersonOfferService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class PersonOfferController {
	
	@Resource(name="personOfferService")
	private PersonOfferService personOfferService;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "personOffer.jobq")
	public String initPersonOffer(HttpSession session, ModelMap model, PersonOfferPagingVO personOfferPagingVO) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		
		try{
			personOfferPagingVO.setId(id);

			List<Map> pagingList = personOfferService.selectPagingList(personOfferPagingVO);
		
			model.addAttribute("pagingList", 	pagingList);
		
			//System.out.println(model);		
			EgovMap pagingCnt = personOfferService.selectPagingListCnt(personOfferPagingVO);
		
			model.addAttribute("pagingCnt", pagingCnt);
		
			//System.out.println(pagingCnt);
			HashMap<String, Object> resMap = new HashMap<String, Object>();
		
			//System.out.println("page : " + personOfferPagingVO.getPage());
			//System.out.println("totalpage : " + pagingCnt.get("totalPage"));
			//System.out.println("pageScale : " + personOfferPagingVO.getPageScale());
		
			resMap.put("page", personOfferPagingVO.getPage());
			resMap.put("totalPage", pagingCnt.get("totalPage"));
			resMap.put("pageScale", personOfferPagingVO.getPageScale());
		
			int pageGroup = (int) Math.ceil((double) personOfferPagingVO.getPage() / personOfferPagingVO.getPageScale() );
		
			long startPage = (pageGroup - 1) * personOfferPagingVO.getPageScale() + 1;

			personOfferPagingVO.setStartPage(startPage);
		
			//System.out.println("startPage: " + personOfferPagingVO.getStartPage());
		
			resMap.put("startPage", personOfferPagingVO.getStartPage());
		
			long endPage = startPage + personOfferPagingVO.getPageScale() - 1;
		
			personOfferPagingVO.setEndPage(endPage);
		
			//System.out.println("endPage: " + personOfferPagingVO.getEndPage());
		
			resMap.put("endPage", endPage);
		
			long prePage = (pageGroup-1) * personOfferPagingVO.getPageScale();
		
			long nextPage = pageGroup * personOfferPagingVO.getPageScale() + 1;
		
			//System.out.println("pageGroup: " + pageGroup);
			//System.out.println("prePage: " + prePage);
			//System.out.println("nextPage: " + nextPage);
		
			resMap.put("pageGroup", pageGroup);
			resMap.put("prePage", prePage);
			resMap.put("nextPage", nextPage);
		
			//System.out.println(resMap);
			model.addAttribute("resMap", resMap);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:main.jobq";
		}
		
		return "person/offer/list.tiles";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "initCompanyMain.jobq")
	public String initCorpInfo(ModelMap model, @RequestParam String cId) throws Exception {
		
		try{
			List<Map> companyInfoList = personOfferService.selectCorpInfo(cId);
			List<Map> companyPicList = personOfferService.selectCorpPic(cId);
			
			model.addAttribute("companyInfoList", companyInfoList);
			model.addAttribute("companyPicList", companyPicList);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "person/offer/companyMain.tiles3";
	}
	
	@RequestMapping(value = "personOfferDelete.jobq")
	public String deletePersonOffer(ModelMap model, @RequestParam int offerId) throws Exception {
		
		try{
			personOfferService.deletePersonOffer(offerId);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:personOffer.jobq";
		}
		
		return "redirect:/personOffer.jobq";
	}
}
