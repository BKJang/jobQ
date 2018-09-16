package egovframework.example.login.login.service.impl;

import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface LoginMapper {
	public Map<String, String> login(String id);


}
