package com.spring.category.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dao.AbstractDAO;

@Repository("BaseDAO")
public class BaseDAO extends AbstractDAO {


	public List<Map<String, Object>> selectGubun(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub

		return selectList("category.selectGubun", commandMap);

	}

	public List<Map<String, Object>> updateGubun(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return selectList("category.updateGubun", commandMap);
	}

	public List<Map<String, Object>> insertGubun(Map<String, Object> commandMap) {
		return selectList("category.insertGubun", commandMap);

	}

	public List<Map<String, Object>> deleteGubun(Map<String, Object> commandMap) {
		return selectList("category.deleteGubun", commandMap);

	}

}
