package egovframework.example.person.resume.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.person.resume.service.PersonResumeService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("personResumeService")
public class PersonResumeServiceImpl extends EgovAbstractServiceImpl implements PersonResumeService {
	
	@Resource(name="personResumeMapper")
	private PersonResumeMapper personResumeMapper;
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonMainInfo(String id) throws Exception {
		
		return personResumeMapper.selectPersonMainInfo(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonResumeInfo(String id)
			throws Exception {
		
		return personResumeMapper.selectPersonResumeInfo(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonCarrerInfo(String id) throws Exception {

		return personResumeMapper.selectPersonCareerInfo(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPersonAcademicInfo(String id) throws Exception{

		return personResumeMapper.selectPersonAcademicInfo(id);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectResumeAreaInfo() throws Exception {

		return personResumeMapper.selectResumeAreaInfo();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectResumeSkillInfo() throws Exception {

		return personResumeMapper.selectResumeSkillInfo();
	}

	@Override
	public void insertResumeInfo(Map<String, Object> map) throws Exception {

		personResumeMapper.insertResumeInfo(map);
	}

	@Override
	public void deleteResumeInfo(String resumeNumber) throws Exception {
		
		personResumeMapper.deleteResumeInfo(resumeNumber);
	}

	@Override
	public void closeResumeInfo(String resumeNumber) throws Exception {

		personResumeMapper.closeResumeInfo(resumeNumber);
		
	}

	@Override
	public void openResumeInfo(String resumeNumber) throws Exception {

		personResumeMapper.openResumeInfo(resumeNumber);
		
	}

	@Override
	public void insertAcademicInfo(HashMap<String, Object> academicMap)
			throws Exception {
		for(int i=1; i<=academicMap.size()/4 ; i++){
			System.out.println(i);
			System.out.println("size : " + academicMap.size()/4);
			personResumeMapper.insertAcademicInfo(
					academicMap.get("a_inAcademicDate_"+i),
					academicMap.get("a_outAcademicDate_"+i),
					academicMap.get("a_academicName_"+i),
					academicMap.get("a_lastAcademicType_"+i),
					academicMap.get("resumeNumber")
					);
		}
		System.out.println(academicMap);
	}

	@Override
	public void insertCareerInfo(HashMap<String, Object> careerMap)
			throws Exception {
		for(int i=1; i<=careerMap.size()/4 ; i++){
			System.out.println(i);
			System.out.println("size : " + careerMap.size()/4);

			personResumeMapper.insertCareerInfo(
					careerMap.get("c_inCareerDate_"+i),
					careerMap.get("c_outCareerDate_"+i),
					careerMap.get("c_companyName_"+i),
					careerMap.get("c_careerName_"+i),
					careerMap.get("resumeNumber")
					);
		}
		
		System.out.println(careerMap);
		
	}

	@Override
	public void deleteAcademicInfo(String resumeNumber) throws Exception {

		personResumeMapper.deleteAcademicInfo(resumeNumber);
		
	}

	@Override
	public void deleteCareerInfo(String resumeNumber) throws Exception {

		personResumeMapper.deleteCareerInfo(resumeNumber);
		
	}

	
}
