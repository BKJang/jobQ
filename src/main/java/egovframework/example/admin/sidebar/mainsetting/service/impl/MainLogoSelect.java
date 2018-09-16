package egovframework.example.admin.sidebar.mainsetting.service.impl;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;

import org.apache.commons.io.IOUtils;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.mainsetting.dao.MainLogoMapper;

@Service
public class MainLogoSelect {
	private static final Logger logger = LoggerFactory.getLogger(MainLogoSelect.class);
	
	@Autowired
	private MainLogoMapper mainLogoMapper;
	private final String DEFAULT_LOGO_DIR_PATH = "C:\\jobq_logo_file";
	
	public ResponseEntity<byte[]> selectMainLogo() throws Exception{
		Map<String, Object> logoInfo = mainLogoMapper.selectMainLogo();
		
		ResponseEntity<byte[]> response = null;
		HttpHeaders headers = null;
		
		try(InputStream inputStream = new FileInputStream(DEFAULT_LOGO_DIR_PATH + logoInfo.get("LOGO_PATH"))) {
			headers = getHttpHeaders((String)logoInfo.get("LOGO_PATH"));
		
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

	public ResponseEntity<byte[]> selectLogo(String logoPath) {
		ResponseEntity<byte[]> response = null;
		HttpHeaders headers = null;
		
		try(InputStream inputStream = new FileInputStream(DEFAULT_LOGO_DIR_PATH + logoPath)) {
			headers = getHttpHeaders(logoPath);
		
			response = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			response = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		
		return response;
	}
}
