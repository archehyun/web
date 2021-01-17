package com.spring.common.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.dao.AbstractDAO;

@Repository("commonDAO")
public class CommonDAO extends AbstractDAO {

	public List selectCodeHList(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return selectList("sample.selectCodeHList", commandMap);
	}

	public List selectCodeDList(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return selectList("sample.selectCodeDList", commandMap);
	}

	public Object deleteCodeD(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub`
		return delete("sample.deleteCodeD", commandMap);
	}

	public List deleteCode(HashMap<String, Object> commandMap) {
		// TODO Auto-generated method stub`
		return selectList("sample.deleteCode", commandMap);
	}

}
