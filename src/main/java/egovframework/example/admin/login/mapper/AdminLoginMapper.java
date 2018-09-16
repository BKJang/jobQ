package egovframework.example.admin.login.mapper;

import java.util.Map;

import egovframework.example.admin.login.domain.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface AdminLoginMapper {
	public Map<String, Object> authenticate(LoginVO loginVO);
}
