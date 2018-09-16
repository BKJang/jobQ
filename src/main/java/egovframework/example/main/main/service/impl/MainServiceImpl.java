package egovframework.example.main.main.service.impl;



import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import egovframework.example.main.main.service.MainService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;



@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {
	
	@Resource(name="mainMapper")
	private MainMapper mainMapper;

	@Override
	public List<?> selectMainContents() throws Exception {
		
		return mainMapper.selectMainContents();
		
	}

	@Override
	public List<?> selectMainTip() throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.selectMainTip();
	}

	@Override
	public List<?> selectMainContents2() throws Exception {
		
		return mainMapper.selectMainContents2();
	}

	@Override
	public List<?> selectNotice() throws Exception {
		
		return mainMapper.selectNotice();
	}

	@Override
	public List<?> selectFaq() throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.selectFaq();
	}

	@Override
	public List<?> selectStory() throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.selectStory();
	}

	@Override
	public ResponseEntity<byte[]> selectMainPic(String picPath) throws Exception {
		//Map<String, Object> picInfo = mainMapper.selectMainPic();
		
		ResponseEntity<byte[]> response = null;
		HttpHeaders headers = null;
		
		System.out.println(picPath);
		try(InputStream inputStream = new FileInputStream(picPath)) {
			headers = getHttpHeaders(picPath);
		
			response = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			response = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		
		return response;
	}
	private MediaType getImageType(String imgType){
		if(imgType.toUpperCase().equals("JPG"))
			return MediaType.IMAGE_JPEG;
		else if(imgType.toUpperCase().equals("PNG"))
			return MediaType.IMAGE_PNG;
		else
			return MediaType.IMAGE_GIF;
	}
	
	private HttpHeaders getHttpHeaders(String fileName){
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(getImageType(fileName.substring(fileName.lastIndexOf(".") + 1)));
		
		return headers;
	}

	}
