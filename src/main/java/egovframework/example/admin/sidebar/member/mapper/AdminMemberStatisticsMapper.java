package egovframework.example.admin.sidebar.member.mapper;

import java.util.List;

import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;

public interface AdminMemberStatisticsMapper {
	public List<AdminMemberVO> getGeneralMembers();
	
	public int countGeneralMembers();
	
	public List<AdminMemberVO> getCompanyMebers();
}
