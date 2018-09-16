package egovframework.example.main.jobstory.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.main.jobstory.service.StoryPagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("storyMapper")
public interface StoryMapper {

	List<?> selectStoryAllList() throws Exception;

	List<Map> selectStoryDetail(Map<String, Object> inputVal) throws Exception;

	List<Map> selectStoryDetailComment(Map<String, Object> inputVal)throws Exception;

	void storyInsert(Map<String, Object> map) throws Exception;

	String selectType(String id) throws Exception;

	void storyCommentInsert(Map<String, Object> map) throws Exception;

	void storyDelete(Map<String, Object> map) throws Exception;

	void storyCommentDelete(Map<String, Object> map) throws Exception;

	void updateStoryHits(String storyNum);

	List<Map> selectStory(Map<String, Object> inputVal) throws Exception;

	void updateStory(Map<String, Object> map)  throws Exception;

	List<Map> selectPagingList(StoryPagingVO storyPagingVO) throws Exception;

	EgovMap selectPagingListCnt(StoryPagingVO storyPagingVO) throws Exception;


	void storyPic(Map<String, Object> storyImage) throws Exception;

}
