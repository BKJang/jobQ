package egovframework.example.company.job_manage.web;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.cmmn.service.CmmnPagingVO;
import egovframework.example.company.job_manage.service.CompanyJobmanageService;

@Controller
public class CompanyJobmanageController {

	@Resource(name = "companyJobmanageService")
	private CompanyJobmanageService companyJobmanageService;

//	초기 관리 페이지 클릭시 이동 _ 수정완료시 이동 _ 등록시 이동
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "companyJobmanage.jobq")
	public String initCompanyJobmanage(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		CmmnPagingVO paging = new CmmnPagingVO();
		
		try {
			String FCGuBun = (String)(request.getParameter("FCGubun") != null ?  (String)request.getParameter("FCGubun") != null: "a");
			
//			전체 공고 리스트 갯수 가져오기
			
			int ListCount = companyJobmanageService.ListCount(id, "a");
			
//			로그인 상태 검사
			if (id == null) {
				
				System.out.println("로그인을 해주세요");
				return "redirect:/login.jobq";
			}
			
//			페이징 초기화
			paging.setTotalCount(ListCount);
			
			List<Map> List = companyJobmanageService.defaultGonggoList(paging.getPageNo(), paging.getPageSize(), FCGuBun, id);
			
			model.addAttribute("gonggoList", List);
			model.addAttribute("paging", paging);
			model.addAttribute("ListCount", ListCount);
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("에러");
			
			return "redirect:/companyMain.jobq";
		}
		return "company/job_manage/list.tiles";
	}
	
	@RequestMapping(value = "insertGonggo.jobq")
	public String insertGonggo(MultipartHttpServletRequest multi, @RequestParam HashMap<String,Object> map, HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "images/gonggo_pic/" + id + "/";
        File dir = new File(path);
        
//      폴더가 없으면 폴더를 생성
        if(!dir.isDirectory()){
            dir.mkdir();
        }
		try {
			
//			id 만 추가해서 아이디와 공고 번호로 공고 구분하자 
			map.put("id", id);
			System.out.println("등록 항목 : " + map);
			
			MultipartFile mFile = multi.getFile("fileInput");
	        String fileName = mFile.getOriginalFilename();
	        String newFileName = "Logo_" + System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
	        String savePath = path + newFileName;

	        path = "images/gonggo_pic/" + id + "/" + newFileName;
       
            mFile.transferTo(new File(savePath));
			
            if (!fileName.equals("")) {
				System.out.println("사진체인지");
				map.replace("deaultLogo", path);
			}
			
			companyJobmanageService.insertGonngoData(map);
			companyJobmanageService.insertComMultiPic(map);
		
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("등록 에러");
			return "redirect:/companyMain.jobq";
		}
		
//		등록이 완료되면 관리 페이지로 이동
		return "redirect:/companyJobmanage.jobq";
	}
	
	
	//업데이트만 진행하고 바로 관리 페이지로 이동시키기
	@RequestMapping(value = "updateGonggo.jobq")
	public String updateGonggo(MultipartHttpServletRequest multi, @RequestParam Map<String,Object> map, HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root + "images/gonggo_pic/" + id + "/";
        File dir = new File(path);
        
//      폴더가 없으면 폴더를 생성
        if(!dir.isDirectory()){
            dir.mkdir();
        }
        
		try {
			if (id == null) {
				
				System.out.println("로그인을 해주세요");
				return "redirect:/login.jobq";
			}
			
//			id 만 추가해서 아이디와 공고 번호로 공고 구분하자 
			map.put("id", id);
			System.out.println("업데이트 항목 : " + map);
			
			MultipartFile mFile = multi.getFile("fileInput");
	        String fileName = mFile.getOriginalFilename();
	        String newFileName = "Logo_" + System.currentTimeMillis()+"."+fileName.substring(fileName.lastIndexOf(".")+1);
	        String savePath = path + newFileName;

	        path = "images/gonggo_pic/" + id + "/" + newFileName;
       
	        mFile.transferTo(new File(savePath));
			
            if (!fileName.equals("")) {
				System.out.println("사진체인지");
				map.replace("deaultLogo", path);
			}
            System.out.println(map.get("deaultLogo"));
			companyJobmanageService.updateGonngoData(map);
		
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("업데이트 에러");
			return "redirect:/companyMain.jobq";
		}
		return "redirect:/companyJobmanage.jobq";
	}
	
	@RequestMapping(value = "deleteGonggo.jobq")
	public void Delete(HttpServletResponse response, @RequestParam String gonggoNum, String FCGubun, String closingNum) throws Exception {
		
		try {
			String[] checkList = gonggoNum.split(",");
			
			System.out.println(FCGubun);
			if (FCGubun.equals("a")  || FCGubun.equals("i") || FCGubun.equals("f") ||FCGubun.equals("")) {
				
				System.out.println("삭제");
				companyJobmanageService.deleteList(checkList);
			} else {
				
				for (String element : checkList) {
					System.out.println(element);
					companyJobmanageService.gonggoClosing(Integer.parseInt(element), closingNum);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("삭제 에러");
		}
		
//		삭제는 ajax로 구성해서 받아오기
		//삭제하고 다시 리로드
		//return "redirect:/companyJobmanage.jobq";
	}
	
	@RequestMapping(value = "deleteGonggoD.jobq")
	public String deleteGonggoD(@RequestParam String gonggoNum) throws Exception {
		
		try {
			
			String[] checkList = gonggoNum.split(",");
			companyJobmanageService.deleteList(checkList);
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("삭제 에러");
			return "redirect:/companyMain.jobq";
		}
		return "redirect:/companyJobmanage.jobq";
	}
	
	@RequestMapping(value = "closing.jobq")
	public void closing(HttpServletResponse response, @RequestParam int gonggoNum, String changeNum) throws Exception {
		
		try {
			
			companyJobmanageService.gonggoClosing(gonggoNum, changeNum);
		} catch (Exception e) {
			response.sendError(404, "마감일이 지났습니다.");
		}
	
	}
	
//	-------------------------------------------------------------------------------------------------
//	ajax를 위한 모든 것을 담는 곳

	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(value = "changeMenu.jobq")
	public void changeMenu(HttpServletRequest request, HttpSession session, HttpServletResponse response, @RequestParam int pageNum, int pageSize, String FCGuBun) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
//		ajax결과 값을 넘길
		PrintWriter result = null;
		
		response.setCharacterEncoding("UTF-8"); //셋팅을 해야함
		
		try {
			
			//해당되는 공고들 가져오기
			List<Map> List = companyJobmanageService.defaultGonggoList(pageNum, pageSize, FCGuBun, id);
			
			result = response.getWriter();
			result.write(JsonUtil.ListToJson(List));
			
			System.out.println(List);
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("리스트 출력 에러");
		}
	};
	
	@RequestMapping(value = "makePaging.jobq")
	public void makePaging(HttpSession session, HttpServletResponse response, @RequestParam int pageNum, int pageSize, String FCGuBun) throws Exception {
		
		String id = (String)session.getAttribute("member_id");
//		ajax결과 값을 넘길
		PrintWriter result = null;
		CmmnPagingVO paging = new CmmnPagingVO();
		response.setCharacterEncoding("UTF-8"); //셋팅을 해야함
		
		try {
			//전체 리스트 가져오기
			int ListCount = companyJobmanageService.ListCount(id, FCGuBun);
			
//			페이징 초기화
			if (pageNum != 0) {
				paging.setPageNo(pageNum);
				paging.setPageSize(pageSize);
			}else{
				paging.setPageSize(10);
				paging.setPageNo(1);
			}
			
			paging.setTotalCount(ListCount);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("paging", paging);
			
			result = response.getWriter();
			result.write(JsonUtil.MapToJson(map));
			
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			System.out.println("페이징 에러");
		}
	}
}
