package egovframework.example.admin.sidebar.mainsetting.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainLogoMapper {
	public void insertLogo(String logoFullPath);
	
	public Map<String, Object> selectMainLogo();
	
	public void updateMainLogo();
	
	public List<String> getLogoList();

	public int updateLogo(String updateLogoPath);

	public int deleteLogo(String logoPath);
}
