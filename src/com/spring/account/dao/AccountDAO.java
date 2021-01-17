package com.spring.account.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dao.AbstractDAO;

@Repository("accountDAO")
public class AccountDAO extends AbstractDAO {


	public List<Map<String, Object>> selectAccountList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return selectList("account.selectAccountList", commandMap);

	}

	public List insertAccount(Map<String, Object> commandMap) {


		return selectList("account.insertAccount", commandMap);
	}

	public List deleteAccount(Map<String, Object> commandMap) {

		return selectList("account.deleteAccount", commandMap);

	}

	public List<Map<String, Object>> selectStaticList(Map<String, Object> commandMap) {
		return selectList("account.selectStatic", commandMap);
	}

	public List<Map<String, Object>> updateAccount(Map<String, Object> commandMap) {
		return selectList("account.updateAccount", commandMap);
	}

	public List<Map<String, Object>> selectAccountStaticList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return selectList("account.selectAccountStaticList", commandMap);
	}

}
