package com.spring.account.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.account.dao.AccountDAO;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Resource(name = "accountDAO")
	private AccountDAO accountDAO;

	@Override
	public List<Map<String, Object>> selectAccountList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.selectAccountList(commandMap);
	}

	@Override
	public List insertAccount(Map<String, Object> commandMap) {

		return accountDAO.insertAccount(commandMap);

	}

	@Override
	public List deleteAccount(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.deleteAccount(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectStaticList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.selectStaticList(commandMap);
	}

	@Override
	public List<Map<String, Object>> updateAccount(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.updateAccount(commandMap);
	}

	@Override
	public List<Map<String, Object>> selectAccountStaticList(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		return accountDAO.selectAccountStaticList(commandMap);
	}

}
