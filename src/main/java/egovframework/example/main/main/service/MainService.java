package egovframework.example.main.main.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

public interface MainService {

	List<?> selectMainContents()throws Exception ;

	List<?> selectMainTip() throws Exception ;

	List<?> selectMainContents2()throws Exception ;

	List<?> selectNotice() throws Exception;

	List<?> selectFaq()  throws Exception;

	List<?> selectStory() throws Exception;

	ResponseEntity<byte[]> selectMainPic(String picPath)  throws Exception;



}
