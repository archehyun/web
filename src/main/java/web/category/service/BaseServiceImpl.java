package web.category.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import web.category.dao.BaseDAO;

@Service("baseService")
public class BaseServiceImpl implements BaseService {

	@Resource(name = "BaseDAO")
	private BaseDAO baseDAO;

	@Override
	public List<Map<String, Object>> selectGubun(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return baseDAO.selectGubun(commandMap);
	}

	@Override
	public List<Map<String, Object>> updateGubun(Map<String, Object> commandMap) {

		baseDAO.updateGubun(commandMap);

		return selectGubun(commandMap);
	}

	@Override
	public List<Map<String, Object>> insertGubun(Map<String, Object> commandMap) {

		baseDAO.insertGubun(commandMap);

		return selectGubun(commandMap);
	}

	@Override
	public List<Map<String, Object>> deleteGubun(Map<String, Object> commandMap) {

		baseDAO.deleteGubun(commandMap);

		return selectGubun(commandMap);
	}

}
