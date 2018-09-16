
package egovframework.example.main.jobstory.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.main.jobstory.service.StoryPagingVO;
import egovframework.example.main.jobstory.service.StoryService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;



@Service("storyService")
public class StoryImpl extends EgovAbstractServiceImpl implements StoryService {
	
	@Resource(name="storyMapper")
	private StoryMapper storyMapper;

	@Override
	public List<?> selectStoryAllList() throws Exception {
		
		return storyMapper.selectStoryAllList();
	}

	@Override
	public List<Map> selectStoryDetail(Map<String, Object> inputVal)
			throws Exception {
		// TODO Auto-generated method stub
		return storyMapper.selectStoryDetail(inputVal);
	}

	@Override
	public List<Map> selectStoryDetailComment(Map<String, Object> inputVal)
			throws Exception {
		// TODO Auto-generated method stub
		return storyMapper.selectStoryDetailComment(inputVal);
	}

	@Override
	public void storyInsert(Map<String, Object> map) throws Exception {
		
		storyMapper.storyInsert(map);
		
	}

	@Override
	public String selectType(String id) throws Exception {

		return storyMapper.selectType(id);
	}

	@Override
	public void storyCommentInsert(Map<String, Object> map) throws Exception {

		storyMapper.storyCommentInsert(map);
	}

	@Override
	public void storyDelete(Map<String, Object> map) throws Exception {
		storyMapper.storyDelete(map);
		
	}

	@Override
	public void storyCommentDelete(Map<String, Object> map) throws Exception {
		storyMapper.storyCommentDelete(map);
		
	}

	@Override
	public void updateStoryHits(String storyNum) {
		storyMapper.updateStoryHits(storyNum);
		
	}

	@Override
	public List<Map> selectStory(Map<String, Object> inputVal) throws Exception {
		// TODO Auto-generated method stub
		return storyMapper.selectStory(inputVal);
	}

	@Override
	public void updateStory(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		storyMapper.updateStory(map);
		
	}

	@Override
	public List<Map> selectPagingList(StoryPagingVO storyPagingVO) throws Exception {
		long page = storyPagingVO.getPage();
		long rows = storyPagingVO.getRows();
		
		storyPagingVO.setStartPage(page == 1 ? page : 1 + (rows * (page - 1)) );
		storyPagingVO.setEndPage(page * rows);
		
		return storyMapper.selectPagingList(storyPagingVO);
	}

	@Override
	public EgovMap selectPagingListCnt(StoryPagingVO storyPagingVO) throws Exception {
		// TODO Auto-generated method stub
		return storyMapper.selectPagingListCnt(storyPagingVO);
	}

	@Override
	public void storyPic(MultipartFile multipartFile, HttpSession session, String storyNum) throws Exception {
		
		String storyPicName = multipartFile.getOriginalFilename();
		String storyPicPath = "C:\\eGovFrameDev-3.5.1-64bit\\workspace\\jobQ_v0.01\\src\\main\\webapp\\images\\story" ;
		
		Map<String, Object> storyImage = new HashMap();
		
		
		File dirPath = new File(storyPicPath);
		
		if (dirPath.exists()) {
			System.out.println("존재함");
		}
		else {
			System.out.println("안존재함");
			dirPath.mkdir();
		}
		
		File uploadFile = new File(storyPicPath, storyPicName);
		FileCopyUtils.copy(multipartFile.getBytes(), uploadFile);
		
		System.out.println(storyPicPath.indexOf("images"));
		System.out.println(storyPicPath.substring(storyPicPath.indexOf("images")).replace(File.separatorChar, '/') + "/" + storyPicName);
		
		storyImage.put("storyImagePath", storyPicPath.substring(storyPicPath.indexOf("images")).replace(File.separatorChar, '/') + "/" + storyPicName);
		storyImage.put("storyNum", storyNum);
		
		System.out.println(storyNum);
		
		
		storyMapper.storyPic(storyImage);
		
		
	}


	
}