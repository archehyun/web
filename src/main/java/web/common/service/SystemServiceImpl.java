package web.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import web.common.dao.SystemDAO;

@Service("systemService")
public class SystemServiceImpl implements SystemService {

	@Resource(name = "systemDAO")
	private SystemDAO systemDAO;

	@Override
	public List<Map<String, Object>> selectProgramList(Map<String, Object> commandMap) {

		return systemDAO.selectProgramList(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectCodeList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return systemDAO.selectCodeList(commandMap);

	}

	@Override
	public List<Map<String, Object>> insertProgram(Map<String, Object> commandMap) {

		Object obj = systemDAO.insertProgram(commandMap);

		System.out.println("insert obj:" + obj);

		return systemDAO.selectProgramList(commandMap);

	}

	@Override
	public List deleteProgram(Map<String, Object> commandMap) {

		Object obj = systemDAO.deleteProgram(commandMap);

		System.out.println("delete obj:" + obj);

		return selectProgramList(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectUserProgramList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return systemDAO.selectUserProgramList(commandMap);
	}

	@Override
	public List updateProgram(HashMap<String, Object> commandMap) {
		Object obj = systemDAO.updateProgram(commandMap);

		System.out.println("update obj:" + obj);

		return systemDAO.selectProgramList(commandMap);
	}

}
